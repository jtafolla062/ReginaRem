from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, BLOB, ForeignKey, Float, Date
from flask import  session,redirect, url_for
from flask_login import LoginManager, login_user, logout_user, login_required, current_user, UserMixin
from datetime import timedelta
app = Flask(__name__)
db = SQLAlchemy(app)
app.config['SQLALCHEMY_DATABASE_URI']='mysql+pymysql://root:root@localhost/tienda_reginarem'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False






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

class Usuario(UserMixin,db.Model):
    __tablename__='Usuarios'
    idUsuario=Column(Integer,primary_key=True)
    nombreCompleto=Column(String,nullable=False)
    direccion=Column(String,nullable=False)
    telefono=Column(String,nullable=False)
    email=Column(String,unique=True)
    password=Column(String(128),nullable=False)
    tipo=Column(String,nullable=False)
    estatus=Column(String,nullable=False)
    genero=Column(String,nullable=False)
    saldo = Column(Float, nullable=False)

    def validarPassword(self,passw):
        if self.password == passw:
            return True
        else:
            return False

    #Definición de los métodos para el perfilamiento
    def is_authenticated(self):
        return True

    def is_active(self):
        if self.estatus=='Activo':
            return True
        else:
            return False
    def is_anonymous(self):
        return False

    def get_id(self):
        return self.idUsuario

    def is_admin(self):
        if self.tipo=='Administrador':
            return True
        else:
            return False
    def is_vendedor(self):
        if self.tipo=='Vendedor':
            return True
        else:
            return False
    def is_comprador(self):
        if self.tipo=='Comprador':
            return True
        else:
            return False
    #Definir el método para la autenticacion
    def validar(self,email,password):
        usuario=Usuario.query.filter(Usuario.email==email).first()
        #print(usuario.email)
        if usuario!=None and usuario.validarPassword(password) and usuario.is_active():
            return usuario
        else:
            return None

    #Método para agregar una cuenta de usuario
    def agregar(self):
        db.session.add(self)
        db.session.commit()


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

@app.route('/RegistroU')
def registroU():
    return render_template('RegistroU.html')    

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

@app.route('/menuClienConsul')
def mCC():
    return render_template('menuClienteConsul.html')


class Productos(db.Model):
    __tablename__='productos'
    id_prod=Column(Integer,primary_key=True)
    cat_prod=Column(String)
    nom_prod=Column(String)
    desc_prod=Column(String)
    prec_prod=Column(Float)

    def consultaIndividual(self, id):
        return Productos.query.get(id)

    def agregar(self):
        db.session.add(self)
        db.session.commit()

    def editar(self):
        db.session.merge(self)
        db.session.commit()

    def eliminar(self, id):
        p = self.consultaIndividual(id)
        db.session.delete(p)
        db.session.commit()

    def consultaGeneral(self):
        return self.query.all()

if __name__ == '__main__':
    app.run(debug=True)
