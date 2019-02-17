from Network.bottle import *

#@route('/')
#def index():
#    f = open("./Simulator/index.html", "r", encoding="utf8")
#    text = f.read()
#    return text


@route('/')
@route('/<filename>')
def html(filename="index"):
    print("a")
    if not filename.__contains__("."):
        print(filename)
        return static_file(filename + ".html", root="./Simulator")
    else:
        print("c")
        return static_file(filename, root="./Simulator")


@route('/static/media/<filename>')
def media(filename):
    return static_file(filename, root="./Simulator/static/media")


@route('/static/css/<filename>')
def css(filename):
    return static_file(filename, root="./Simulator/static/css")


@route('/static/js/<filename>')
def js(filename):
    return static_file(filename, root="./Simulator/static/js")


@post('/login')
def login():
    username = request.forms.get('username')
    password = request.forms.get('pass')
    if username == 'Muhammet' and password == '1234':
        response.set_cookie("account", username, secret='some-secret-key')
        return template("""<p>Hoşgeldin {{name}}! <a href="/menu">Menüye git</a></p>""", name=username)
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


@error(404)
def error404(error):
    filename = "error"
    return static_file(filename + ".html", root="./Simulator")
