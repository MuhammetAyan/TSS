from Network.bottle import *
from Business import urunSorguBusiness
from Network.Security import *

print("urunSorguController")


@get('/urunsorgula/getlist/<grupId>/<arama>')
def getlist(grupId, arama):
    if IsAllow(request, Roller.TumHesaplar):
        print("Urunsorgula getlist:", arama)
        return json_dumps(urunSorguBusiness.getList(arama, grupId))
    else:
        UnauthorizedError()


@get('/urunsorgula/gruplar/<ustGrupid>')
def gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        print("Urunsorgula gruplar:", ustGrupid)
        return json_dumps(urunSorguBusiness.getGruplar(ustGrupid))
    else:
        UnauthorizedError()


@route('/urunsorgula/sorgula/<urunKodu>')
def sorgula(urunKodu):
    if IsAllow(request, Roller.TumHesaplar):
        print("sorgula")
    else:
        UnauthorizedError()
