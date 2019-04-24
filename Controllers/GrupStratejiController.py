from Network.bottle import route, get, post, request, response, json_dumps
from Business import GrupBusiness
from Network.Security import *
from Test import TEST

TEST("GrupStratejiController")


@get('/strateji/gruplar/<ustGrupid:int>')
def Gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        TEST("MalzemeGrupları gruplar:", ustGrupid)
        return json_dumps(GrupBusiness.getGruplar(ustGrupid))
    else:
        UnauthorizedError()


@route('/strateji/adres/<grupId:int>')
def UstGruplar(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetUstGruplar(grupId))
    else:
        UnauthorizedError()


@route('/strateji/stratejigetir/<grupId:int>')
def GrupStratejiOran(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetGrupStratejiOran(grupId))
    else:
        UnauthorizedError()


@route('/strateji/grafik/<grupId:int>')
def GrupStrateji(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetGrupStratejileri(grupId))
    else:
        UnauthorizedError()


@post('/strateji/belirle')
def StratejiBelirle():
    if IsAllow(request, Roller.TumHesaplar):
        try:
            id = request.json.get("id")
            assert id is not None, "id bilgisi girilmemiş"
            tip = request.json.get("tip")
            assert tip in ["grup", "ürün"], "Geçersiz tip"
            data = request.json.get("data")
            assert type(data) is list, "data verisi yanlış girilmiş"
            GrupBusiness.PostStratejiBelirle(id, tip, data)
        except AssertionError as hata:
            abort(400, hata)
    else:
        UnauthorizedError()

