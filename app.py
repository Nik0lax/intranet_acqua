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
app.secret_key = 'intranet_acqua' 
app.config.from_object(Config)

mysql = MySQL(app)

# Pasta de upload
UPLOAD_FOLDER = os.path.join('static', 'uploads')
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
# Extensões permitidas
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif', 'mp4', 'webp'}

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
    
    #puxando aniversários no Banco de Dados
    cur.execute("SELECT * FROM aniversariantes ORDER BY id DESC")
    aniversariantes = cur.fetchall()

    #puxando compliance no Banco de Dados
    cur.execute("SELECT * FROM compliance ORDER BY id DESC")
    compliance = cur.fetchall()

    #puxando noticias externas no Banco de Dados
    cur.execute("SELECT * FROM noticias_externas ORDER BY data_publicacao DESC, criado_em DESC")
    colunas = [col[0] for col in cur.description]  # pega o nome das colunas
    noticias_externas = [dict(zip(colunas, row)) for row in cur.fetchall()]

    cur.close()

    return render_template('publica.html', posts=posts, links=links , aniversariantes=aniversariantes, compliance=compliance, noticias_externas=noticias_externas)

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

    # GET - Buscar os comunicados, links do banco, ramais, aniversariantes e compliance
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cur.execute("SELECT * FROM publicacoes ORDER BY id DESC")
    comunicados = cur.fetchall()
    cur.execute("SELECT * FROM links_rapidos ORDER BY id DESC")
    links_rapidos = cur.fetchall()
    cur.execute("SELECT * FROM ramais ORDER BY andar, setor")
    ramais = cur.fetchall()
    cur.execute("SELECT * FROM aniversariantes ORDER BY id DESC")
    aniversariantes = cur.fetchall()
    cur.execute("SELECT * FROM compliance ORDER BY id DESC")
    compliance = cur.fetchall()
    cur.execute("SELECT * FROM noticias_externas ORDER BY data_publicacao DESC, criado_em DESC")
    noticias_externas = cur.fetchall()
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
    
      #Criar uma notícia externa
    elif form_type == 'noticia_externa':
        titulo = request.form['titulo']
        link = request.form['link']
        descricao = request.form.get('descricao', '')
        data_publicacao = request.form.get('data_publicacao') or datetime.today().strftime('%Y-%m-%d')

        imagem_file = request.files.get('imagem')
        imagem_path = None

        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

        cur = mysql.connection.cursor()
        cur.execute("""
            INSERT INTO noticias_externas (titulo, link, descricao, imagem, data_publicacao)
            VALUES (%s, %s, %s, %s, %s)
        """, (titulo, link, descricao, imagem_path, data_publicacao))
        mysql.connection.commit()
        cur.close()

        flash('Notícia externa criada com sucesso!', 'success')
        return redirect(url_for('admin'))

    #Criar um aniversario
    elif form_type == 'aniversariante':
        imagem_file = request.files.get('imagem')
        imagem_path = None

        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO aniversariantes (imagem) VALUES (%s)", (imagem_path,))
            mysql.connection.commit()
            cur.close()

            flash('Aniversariante adicionado com sucesso!', 'success')
        else:
            flash('Formato de imagem inválido.', 'danger')

        return redirect(url_for('admin'))

    #Criar um compliance
    elif form_type == 'compliance':
        imagem_file = request.files.get('imagem')
        imagem_path = None

        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

            cur = mysql.connection.cursor()
            cur.execute("INSERT INTO compliance (imagem) VALUES (%s)", (imagem_path,))
            mysql.connection.commit()
            cur.close()

            flash('compliance adicionado com sucesso!', 'success')
        else:
            flash('Formato de imagem inválido.', 'danger')

        return redirect(url_for('admin'))

    return render_template('admin.html', comunicados=comunicados, links_rapidos=links_rapidos, ramais=ramais, aniversariantes=aniversariantes, compliance=compliance, noticias_externas=noticias_externas)

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

@app.route('/admin/ramal/editar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_ramal(id):
    andar = request.form['andar']
    setor = request.form['setor']
    ramal = request.form['ramal']

    cur = mysql.connection.cursor()
    cur.execute("""
        UPDATE ramais
        SET andar = %s, setor = %s, ramal = %s
        WHERE id = %s
    """, (andar, setor, ramal, id))
    mysql.connection.commit()
    cur.close()

    flash('Ramal atualizado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/ramal/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_ramal(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM ramais WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()

    flash('Ramal deletado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/aniversariante/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_aniversariante(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT imagem FROM aniversariantes WHERE id = %s", (id,))
    imagem = cur.fetchone()
    if imagem:
        imagem_path = os.path.join('static', imagem[0])
        if os.path.exists(imagem_path):
            os.remove(imagem_path)

    cur.execute("DELETE FROM aniversariantes WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()
    flash('Aniversariante deletado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/aniversariante/editar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_aniversariante(id):
    imagem_file = request.files.get('imagem')

    if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
        ext = imagem_file.filename.rsplit('.', 1)[1].lower()
        nome_unico = f"{uuid.uuid4()}.{ext}"
        imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
        imagem_path = f'uploads/{nome_unico}'

        cur = mysql.connection.cursor()
        cur.execute("SELECT imagem FROM aniversariantes WHERE id = %s", (id,))
        antiga = cur.fetchone()
        if antiga:
            antiga_path = os.path.join('static', antiga[0])
            if os.path.exists(antiga_path):
                os.remove(antiga_path)

        cur.execute("UPDATE aniversariantes SET imagem = %s WHERE id = %s", (imagem_path, id))
        mysql.connection.commit()
        cur.close()

        flash('Imagem atualizada com sucesso!', 'success')
    else:
        flash('Erro ao atualizar imagem.', 'danger')

    return redirect(url_for('admin'))

@app.route('/admin/compliance/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_compliance(id):
    cur = mysql.connection.cursor()
    cur.execute("SELECT imagem FROM compliance WHERE id = %s", (id,))
    imagem = cur.fetchone()
    if imagem:
        imagem_path = os.path.join('static', imagem[0])
        if os.path.exists(imagem_path):
            os.remove(imagem_path)

    cur.execute("DELETE FROM compliance WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()
    flash('Compliance deletado com sucesso!', 'success')
    return redirect(url_for('admin'))

@app.route('/admin/compliance/editar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_compliance(id):
    imagem_file = request.files.get('imagem')

    if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
        ext = imagem_file.filename.rsplit('.', 1)[1].lower()
        nome_unico = f"{uuid.uuid4()}.{ext}"
        imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
        imagem_path = f'uploads/{nome_unico}'

        cur = mysql.connection.cursor()
        cur.execute("SELECT imagem FROM compliance WHERE id = %s", (id,))
        antiga = cur.fetchone()
        if antiga:
            antiga_path = os.path.join('static', antiga[0])
            if os.path.exists(antiga_path):
                os.remove(antiga_path)

        cur.execute("UPDATE compliance SET imagem = %s WHERE id = %s", (imagem_path, id))
        mysql.connection.commit()
        cur.close()

        flash('Imagem atualizada com sucesso!', 'success')
    else:
        flash('Erro ao atualizar imagem.', 'danger')

    return redirect(url_for('admin'))

# Editar notícia externa (GET e POST)
@app.route('/admin/noticia-externa/editar/<int:id>', methods=['GET', 'POST'])
@login_required(roles=['comunicacao', 'admin'])
def editar_noticia_externa(id):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)

    if request.method == 'POST':
        titulo = request.form['titulo']
        link = request.form['link']
        descricao = request.form.get('descricao', '')
        data_publicacao = request.form.get('data_publicacao')

        imagem_file = request.files.get('imagem')

        # Buscar dados atuais
        cur.execute("SELECT imagem FROM noticias_externas WHERE id = %s", (id,))
        antigo = cur.fetchone()
        imagem_path = antigo['imagem']

        # Upload nova imagem
        if imagem_file and imagem_file.filename != '' and allowed_file(imagem_file.filename):
            ext = imagem_file.filename.rsplit('.', 1)[1].lower()
            nome_unico = f"{uuid.uuid4()}.{ext}"
            imagem_file.save(os.path.join(UPLOAD_FOLDER, nome_unico))
            imagem_path = f'uploads/{nome_unico}'

        cur.execute("""
            UPDATE noticias_externas
            SET titulo = %s, link = %s, descricao = %s, imagem = %s, data_publicacao = %s
            WHERE id = %s
        """, (titulo, link, descricao, imagem_path, data_publicacao, id))
        mysql.connection.commit()
        cur.close()

        flash('Notícia externa atualizada com sucesso!', 'success')
        return redirect(url_for('admin'))

    # GET - busca pra preencher o form
    cur.execute("SELECT * FROM noticias_externas WHERE id = %s", (id,))
    noticia = cur.fetchone()
    cur.close()

    return render_template('editar_noticia_externa.html', noticia=noticia)

# Deletar notícia externa
@app.route('/admin/noticia-externa/deletar/<int:id>', methods=['POST'])
@login_required(roles=['comunicacao', 'admin'])
def deletar_noticia_externa(id):
    cur = mysql.connection.cursor()
    cur.execute("DELETE FROM noticias_externas WHERE id = %s", (id,))
    mysql.connection.commit()
    cur.close()
    flash('Notícia externa deletada com sucesso!', 'success')
    return redirect(url_for('admin'))

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
