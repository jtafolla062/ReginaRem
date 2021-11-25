from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def inicio():
    return render_template('Principal.html')
@app.route('/Terminos')
def term():
    return render_template('TerminosCondiciones.html')
@app.route('/PoliticaPrivacidad')
def pol():
    return render_template('PoliticaPrivacidad.html')
@app.route('/MVV')
def mvv():
    return render_template('MVV.html')

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
