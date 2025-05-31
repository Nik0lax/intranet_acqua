from flask import Flask, render_template, request, redirect, session, url_for, flash
from flask_mysqldb import MySQL
from werkzeug.security import check_password_hash
from werkzeug.utils import secure_filename
from datetime import datetime
from config import Config
from decorators import login_required
from collections import OrderedDict
import uuid
import os
import MySQLdb

app = Flask(__name__)
app.secret_key = 'intranet_acqua'  # pode jogar isso no .env também
app.config.from_object(Config)

mysql = MySQL(app)

# Pasta de upload
UPLOAD_FOLDER = os.path.join('static', 'uploads')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
# Extensões permitidas
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'mp4'}

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS


# -------- ROTA PUBLICA -------- #
@app.route('/')
def home():
    #puxando os posts no banco de dados
    cur = mysql.connection.cursor()
    cur.execute("SELECT titulo, conteudo, data_publicacao, autor, imagem, video FROM publicacoes ORDER BY data_publicacao DESC")
    posts = cur.fetchall()

    # puxando links rápidos
    cur.execute("SELECT titulo, url, tipo FROM links_rapidos ORDER BY titulo")
    links = cur.fetchall()
    
    #puxando ramais no Banco de Dados
    cur.execute("SELECT andar, setor, ramal FROM ramais")
    raw_ramais = cur.fetchall()

    cur.close()

    # definido ordem dos andares
    ordem_andares = [
        'Térreo',
        '1° Andar',
        '2° Andar',
        '3° Andar',
        '4° Andar',
        '5° Andar',
        '6° Andar',
        '7° Andar',
        '8° Andar',
        '9° Andar',
        '10° Andar'
    ]

    # Monta o dicionário agrupado por andar
    ramais_por_andar = {andar: [] for andar in ordem_andares}
    for andar, setor, ramal in raw_ramais:
        if andar in ramais_por_andar:
            ramais_por_andar[andar].append((setor, ramal))

    # Usa OrderedDict para garantir a ordem no template
    ramais_ordenado = OrderedDict((andar, ramais_por_andar[andar]) for andar in ordem_andares if ramais_por_andar[andar])

    return render_template('publica.html', posts=posts, links=links ,ramais=ramais_ordenado)

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        senha = request.form['senha']

        cur = mysql.connection.cursor()
        cur.execute("SELECT id, senha_hash, nome, tipo FROM usuarios WHERE email = %s", (email,))
        user = cur.fetchone()
        cur.close()

        if user and check_password_hash(user[1], senha):
            session['user_id'] = user[0]
            session['username'] = user[2]
            session['role'] = user[3]
            session['logged_in'] = True
            return redirect(url_for('admin'))
        else:
            flash('Credenciais inválidas. Tente novamente.')

    return render_template('login.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('login'))

# -------- ROTA ADMIN e COMUNICACAO -------- #
@app.route('/admin', methods=['GET', 'POST'])
@login_required(roles=['comunicacao', 'admin'])
def admin():
    form_type = request.form.get('form_type')

    # GET - Buscar os comunicados, links do banco
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT * FROM publicacoes ORDER BY id DESC")
    comunicados = cur.fetchall()
    cur.execute("SELECT * FROM links_rapidos ORDER BY id DESC")
    links_rapidos = cur.fetchall()
    cur.close()

    #Criar uma postagem
    if form_type == 'comunicado':
        titulo = request.form['titulo']
        conteudo = request.form['conteudo']
        autor = session.get('username')

        imagem_file = request.files.get('imagem')
        video_file = request.files.get('video')

        imagem_path = None
        video_path = None

        # Salva imagem
        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_seguro = secure_filename(imagem_file.filename)
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

        # Salva vídeo
        if video_file and video_file.filename != '' and allowed_file(video_file.filename):
            ext = video_file.filename.rsplit('.', 1)[1].lower()
            nome_seguro = secure_filename(video_file.filename)
            nome_unico = f"{uuid.uuid4()}.{ext}"
            video_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            video_path = f'uploads/{nome_unico}'

        # Insere no banco
        cur = mysql.connection.cursor()
        cur.execute("""
            INSERT INTO publicacoes (titulo, conteudo, autor, imagem, video)
            VALUES (%s, %s, %s, %s, %s)
        """, (titulo, conteudo, autor, imagem_path, video_path))
        mysql.connection.commit()
        cur.close()

        flash('Post criado com sucesso!', 'success')
        return redirect(url_for('admin'))

    #Criar um link
    elif form_type == 'link_rapido':
        titulo = request.form['titulo']
        url = request.form['url']
        tipo = request.form['tipo']

        cur = mysql.connection.cursor()
        cur.execute("""
            INSERT INTO links_rapidos (titulo, url, tipo)
            VALUES (%s, %s, %s)
        """, (titulo, url, tipo))
        mysql.connection.commit()
        cur.close()

        flash('Link rápido criado com sucesso!', 'success')
        return redirect(url_for('admin'))
    return render_template('admin.html', comunicados=comunicados, links_rapidos=links_rapidos)

@app.route('/admin/comunicado/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_comunicado(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM publicacoes WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()
    flash('Comunicado deletado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/comunicado/editar/<int:id>', methods=['GET', 'POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_comunicado(id):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if request.method == 'POST':
        titulo = request.form['titulo']
        conteudo = request.form['conteudo']

        imagem_file = request.files.get('imagem')
        video_file = request.files.get('video')

        # Buscar dados atuais para substituir só se tiver arquivo novo
        cur.execute("SELECT imagem, video FROM publicacoes WHERE id = %s", (id,))
        antigo = cur.fetchone()

        imagem_path = antigo['imagem']
        video_path = antigo['video']

        # Upload da imagem nova (se tiver)
        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

        # Upload do vídeo novo (se tiver)
        if video_file and video_file.filename != '' and allowed_file(video_file.filename):
            ext = video_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            video_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            video_path = f'uploads/{nome_unico}'

        autor = session.get('username')  # Atualiza autor para o usuário que editou
        data_atualizacao = datetime.now().strftime('%Y-%m-%d %H:%M:%S')  # Timestamp atual

        # Atualiza o comunicado com autor e horário
        cur.execute("""
            UPDATE publicacoes
            SET titulo = %s, conteudo = %s, imagem = %s, video = %s, autor = %s, data_publicacao = %s
            WHERE id = %s
        """, (titulo, conteudo, imagem_path, video_path, autor, data_atualizacao, id))
        mysql.connection.commit()
        cur.close()

        flash('Comunicado atualizado com sucesso!', 'success')
        return redirect(url_for('admin'))

    # Se GET, carrega o comunicado para preencher o formulário
    cur.execute("SELECT * FROM publicacoes WHERE id = %s", (id,))
    comunicado = cur.fetchone()
    cur.close()

    return render_template('editar_comunicado.html', comunicado=comunicado)

@app.route('/admin/link-rapido/editar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_link_rapido(id):
    titulo = request.form['titulo']
    url = request.form['url']
    tipo = request.form['tipo']

    cur = mysql.connection.cursor()
    cur.execute("""
        UPDATE links_rapidos
        SET titulo = %s, url = %s, tipo = %s
        WHERE id = %s
    """, (titulo, url, tipo, id))
    mysql.connection.commit()
    cur.close()

    flash('Link rápido atualizado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/link-rapido/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_link_rapido(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM links_rapidos WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()
    flash('Link rápido deletado com sucesso!', 'success')
    return redirect(url_for('admin'))

if __name__ == '__main__':
    app.run(debug=True)
