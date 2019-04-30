from Network.bottle import request, json_dumps, route, abort, error
from Network.Security import *
from Business import AppBusiness
from Test import TEST

TEST("appController")


@route('/app/optimizasyon')
def hesapla():
    if IsAllow(request, Roller.Admin):
        AppBusiness.Optimizasyon()
        return
    else:
        UnauthorizedError()


@route('/app/grafik')
def rate():
    if IsAllow(request, Roller.TumHesaplar):
        oran = float(AppBusiness.OranGrafigi())
        return json_dumps({"oran": oran})
    else:
        UnauthorizedError()


@error(400)
@error(401)
@error(403)
@error(404)
@error(405)
@error(500)
def error404(error):
    if len(error.args) < 2:
        return error.status
    else:
        return error.args[1]
