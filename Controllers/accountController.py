from Network.bottle import *
from Business.AccountBusiness import LoginControl
from Network.Security import *

print("accountController")


@post('/login')
def login():
    if IsAllow(request, Roller.Misafir):
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
    else:
        abort(code=500, text=ErrorText.get('500'))


@route('/logout')
def log_out():
    if IsAllow(request, Roller.TumHesaplar):
        print("Çıkış yapıldı!")
        response.delete_cookie("account")
    else:
        abort(code=500, text=ErrorText.get('500'))
