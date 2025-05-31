from functools import wraps
from flask import session, redirect, url_for, flash

def login_required(roles=[]):
    def decorator(f):
        @wraps(f)
        def decorated_function(*args, **kwargs):
            # Check se tá logado
            if 'logged_in' not in session or not session['logged_in']:
                flash('Você precisa estar logado para acessar essa página.', 'warning')
                return redirect(url_for('login'))

            # Se roles definidos, verifica se usuário tem papel autorizado
            if roles:
                user_role = session.get('role')
                if user_role not in roles:
                    flash('Você não tem permissão para acessar essa página.', 'danger')
                    return redirect(url_for('publica'))

            # Passa o rolê pra rota protegida
            return f(*args, **kwargs)
        return decorated_function
    return decorator
