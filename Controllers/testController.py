from Network.bottle import *
from Network.Security import *

test = 0
print("testController")

#@route('/')
#def index():
#    f = open("./Simulator/login.html", "r", encoding="utf8")
#    text = f.read()
#    return text


@route('/')
@route('/test/<filename>')
def html(filename="login"):
    print("Şu dosya okundu:", filename)
    if filename == "index":
        if IsAllow(request, Roller.Misafir):
            return """<script>window.location = "/test/login";</script>"""
        else:
            return """<script>window.location = "/test/home";</script>"""
    return static_file(filename + ".html", root="./Simulator")


@route('/static/media/<filename>')
def media(filename):
    print("media:", filename)
    return static_file(filename, root="./Simulator/static/media")


@route('/static/css/<filename>')
def css(filename):
    print("css", filename)
    return static_file(filename, root="./Simulator/static/css")


@route('/static/js/<filename>')
def js(filename):
    print("js:", filename)
    return static_file(filename, root="./Simulator/static/js")


"""
@post('/login')
def login():
    username = request.json.get('username')
    password = request.json.get('pass')
    if username == 'Muhammet' and password == '1234':
        response.set_cookie("account", username, secret='some-secret-key')
        return template("<p>Hoşgeldin {{name}}! <a href="/menu">Menüye git</a></p>", name=username)
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
"""


@error(404)
def error404(error):
    print("error:", error)
    filename = "error"
    return static_file(filename + ".html", root="./Simulator")
