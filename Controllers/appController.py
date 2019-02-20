from Network.bottle import request, json_dumps, route
import  time

app = 0
print("appController")


@route('/hesapla')
def hesapla():
    print("hesaplama")
    username = request.get_cookie("account", secret='some-secret-key')
    if username:
        print("hesapla başarılı erişim")
        time.sleep(5)
        return ""
    else:
        print("hesapla yetkisiz erişim!")
        return "Yetkisiz erişim!"


@route('/rate')
def rate():
    print("rate: ")
    username = request.get_cookie("account", secret='some-secret-key')
    print(username)
    if username:
        print(90)
        return json_dumps({"rate": 90})
    else:
        print(10)
        return json_dumps({"rate": 10})
