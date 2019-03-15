from Network.bottle import * # route, post, static_file, response, json_dumps
from Business.AccountBusiness import FindLogin, dbKullanicilarModel
from Network.Security import *

print("accountController")



@post('/account/login')
def login():
    if IsAllow(request, Roller.Misafir):
        username = request.json.get('username')
        password = request.json.get('password')
        print("Kullanıcı adı şifre:", username, password)
        user = FindLogin(username, password)
        if user is not None:
            key = KeyGenerator()
            UsersVarible(username=username, key=key, rol=Rol(user.Rol))#rol admin değil ayarlanması gerekiyor
            response.set_cookie("account", key, secret='some-secret-key')
            print("Başarılı giriş!", key)
            return json_dumps({'auth': key})
        else:
            print("Hatalı giriş!")
            UnauthorizedError("Kullanıcı adı veya parola yanlış!")
    else:
        UnauthorizedError()


@route('/account/logout')
def log_out():
    if IsAllow(request, Roller.TumHesaplar):
        print("Çıkış yapıldı!")
        response.delete_cookie("account")
        DeleteUser(request.get_header("auth"))
    else:
        UnauthorizedError()


