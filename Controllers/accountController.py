from Network.bottle import *
from Business.AccountBusiness import LoginControl

account = 0
print("accountController")


@post('/login')
def login():
    username = request.json.get('username')
    password = request.json.get('password')
    print("Kullanıcı adı şifre:", username, password)
    if LoginControl(username, password):
        response.set_cookie("account", username, secret='some-secret-key')
        print("Başarılı giriş!")
        return ""
    else:
        print("Hatalı giriş!")
        return "Kullanıcı adı veya parola yanlış!"


@route('/logout')
def log_out():
    print("Çıkış yapıldı!")
    response.delete_cookie("account")


@route('/restricted')
def restricted_area():
    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        return ""
    else:
        return "Yetkisiz erişim!"
