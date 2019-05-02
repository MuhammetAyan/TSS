from Network.bottle import route, get, post, request, response, json_dumps
from Business import GrupBusiness
from Network.Security import *
from Test import TEST

TEST("GrupStratejiController")


@get('/strateji/gruplar/<ustGrupid:int>')
def Gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        try:
            TEST("MalzemeGrupları gruplar:", ustGrupid)
            return json_dumps(GrupBusiness.getGruplar(ustGrupid))
        except AssertionError as error:
            UserError(error.__str__())
        except Exception:
            FailedError()
    else:
        UnauthorizedError()


@route('/strateji/adres/<grupId:int>')
def UstGruplar(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        try:
            return json_dumps(GrupBusiness.GetUstGruplar(grupId))
        except AssertionError as error:
            UserError(error.__str__())
        except Exception:
            FailedError()
    else:
        UnauthorizedError()


@route('/strateji/stratejigetir/<grupId:int>')
def GrupStratejiOran(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        try:
            return json_dumps(GrupBusiness.GetGrupStratejiOran(grupId))
        except AssertionError as error:
            UserError(error.__str__())
        except Exception:
            FailedError()
    else:
        UnauthorizedError()


@route('/strateji/grafik/<grupId:int>')
def GrupStrateji(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        try:
            return json_dumps(GrupBusiness.GetGrupStratejileri(grupId))
        except Exception:
            FailedError()
    else:
        UnauthorizedError()


@post('/strateji/belirle')
def StratejiBelirle():
    if IsAllow(request, Roller.TumHesaplar):
        try:
            id = request.json.get("id")
            assert id is not None, "id bilgisi girilmemiş."
            tip = request.json.get("tip")
            assert tip in ["grup", "ürün"], "Geçersiz tip"
            data = request.json.get("data")
            assert type(data) is list, "data verisi yanlış girilmiş."
            GrupBusiness.PostStratejiBelirle(id, tip, data)
        except AssertionError as hata:
            UserError(hata.__str__())
        except Exception as hata:
            FailedError()
    else:
        UnauthorizedError()


@get("strateji/usttenkalitimal/<grupId: int>")
def UsttenKalitimAl(grupId):
    if IsAllow(request, Roller.Admin):
        try:
            GrupBusiness.UsttenKalitimAl(grupId)
        except AssertionError as hata:
            UserError(hata.__str__())
        except Exception as hata:
            FailedError()
    else:
        UnauthorizedError()
