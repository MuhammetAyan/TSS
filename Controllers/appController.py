from Network.bottle import request, json_dumps, route, abort
from Network.Security import *
from Business import AppBusiness
import time

print("appController")


@route('/app/optimizasyon')
def hesapla():
    if IsAllow(request, Roller.Admin):
        # Test amaçlı 5 sn gecikme sağlanmıştır.
        import time
        time.sleep(5)
        print("hesapla başarılı erişim")
        return ""
    else:
        UnauthorizedError()


@route('/app/grafik')
def rate():
    if IsAllow(request, Roller.TumHesaplar):
        oran = float(AppBusiness.OranGrafigi())
        return json_dumps({"oran" : oran})
    else:
        UnauthorizedError()
