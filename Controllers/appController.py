from Network.bottle import request, json_dumps, route, abort
from Network.Security import *
import time

print("appController")


@route('/hesapla')
def hesapla():
    if IsAllow(request, Roller.Admin):
        print("hesaplama")
        username = request.get_cookie("account", secret='some-secret-key')
        if username:
            print("hesapla başarılı erişim")
            time.sleep(5)
            return ""
        else:
            print("hesapla yetkisiz erişim!")
            return "Yetkisiz erişim!"
    else:
        abort(code=500, text=ErrorText.get('500'))


@route('/rate')
def rate():
    if IsAllow(request, Roller.TumHesaplar):
        print("rate: ")
        username = request.get_cookie("account", secret='some-secret-key')
        print(username)
        if username:
            print(90)
            return json_dumps({"rate": 90})
        else:
            print(10)
            return json_dumps({"rate": 10})
    else:
        abort(code=500, text=ErrorText.get('500'))
