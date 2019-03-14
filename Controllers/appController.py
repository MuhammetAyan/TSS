from Network.bottle import request, json_dumps, route, abort
from Network.Security import *
import time

print("appController")


@route('/app/optimizasyon')
def hesapla():
    if IsAllow(request, Roller.Admin):
        print("hesapla başarılı erişim")
        return ""
    else:
        UnauthorizedError()


@route('/app/grafik')
def rate():
    if IsAllow(request, Roller.TumHesaplar):
        print("oran: ", 90)
        return json_dumps({"oran": 90})
    else:
        UnauthorizedError()
