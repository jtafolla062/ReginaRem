from flask import Flask, render_template
from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, BLOB, ForeignKey, Float, Date
from flask import  session,redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from datetime import timedelta
app = Flask(__name__)

@app.route('/')
def inicio():
    return render_template('Principal.html')

@app.route('/ReginaRem', methods=['post'])
def inicio2():
    nombre = request.form['usuario']
    pas = request.form['contra']
    u = Usuario()
    u = u.validar(nombre, pas)
    if u != None:
        login_user(u)
        return render_template('Principal2.html', usuario=nombre)
    return render_template('Login.html', mensaje='usuario no registrado')
@app.route('/Terminos')
def term():
    return render_template('TerminosCondiciones.html')

@app.route('/PoliticaPrivacidad')
def pol():
    return render_template('PoliticaPrivacidad.html')

@app.route('/MVV')
def mvv():
    return render_template('MVV.html')
#USUARIOS----------------------------------------------
app.secret_key='Cl4v3'
login_manager=LoginManager()
login_manager.init_app(app)
login_manager.login_view='login'

login_manager.login_message='¡ Tu sesión expiró !'
login_manager.login_message_category="info"

@login_manager.user_loader
def cargar_usuario(id):
    return Usuario.query.get(int(id))

@app.before_request
def before_request():
    session.permanent=True
    app.permanent_session_lifetime=timedelta(minutes=10)

@app.route('/cerrarSesion')
@login_required
def cerrarSesion():
    logout_user()
    return redirect(url_for('login'))

@app.route('/Login')
def login():
    return render_template('Login.html')

#PRODUCTOS-------------------------------------------
@app.route('/menuAd')
def mA():
    return render_template('menuAdmn.html')
@app.route('/menuProd')
def mP():
    return render_template('menuProd.html')

@app.route('/menuProdConsul')
def mPC():
    return render_template('menuProdConsul.html')

@app.route('/menuProdAgregar')
def mPA():
    return render_template('menuProdAgregar.html')


if __name__ == '__main__':
    app.run(debug=True)
