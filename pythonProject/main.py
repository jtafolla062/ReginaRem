from flask import Flask, render_template
app = Flask(__name__)


@app.route('/')
def inicio():
    return render_template('MVV.html')
@app.route('/PoliticaPrivacidad')
def login():
    return render_template('PoliticaPrivacidad.html')
@app.route('/MVV')
def main():
    return render_template('MVV.html')


if __name__ == '__main__':
    app.run(debug=True)
