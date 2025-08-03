from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World! Esta es la practica de Entrega Continua.'

if __name__ == '__main__':
    # Binds to all network interfaces, which is necessary for Docker
    app.run(debug=True, host='0.0.0.0', port=5000)