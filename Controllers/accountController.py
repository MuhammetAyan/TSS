from Network.bottle import *


@post('/login')
def login():
    username = request.forms.get('username')
    password = request.forms.get('pass')
    if username == 'Muhammet' and password == '1234':
        response.set_cookie("account", username, secret='some-secret-key')
        return template("<p>Hoşgeldin {{name}}! You are now logged in.</p>", name=username)
    else:
        return "<p>Login failed.</p>"


@route('/logout')
def log_out():
    response.delete_cookie("account")


@route('/restricted')
def restricted_area():
    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        return template("Hello {{name}}. Welcome back.", name=username)
    else:
        return "You are not logged in. Access denied."
