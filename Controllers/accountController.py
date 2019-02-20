from Network.bottle import *

account = 0
print("accountController")


@post('/login')
def login():
    username = request.json.get('username')
    password = request.json.get('password')
    print("Kullanıcı adı şifre:", username, password)
    if username == 'Muhammet' and password == '1234':
        response.set_cookie("account", username, secret='some-secret-key')
        print("Başarılı giriş!")
        return ""
    else:
        print("Hatalı giriş!")
        return "Hatalı giriş yapma girişimi!"


@route('/logout')
def log_out():
    print("Çıkış yapıldı!")
    response.delete_cookie("account")


@route('/restricted')
def restricted_area():
    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        return "Veri"
    else:
        return "Yetkisiz erişim!"
