from Network.bottle import *
from Business import urunSorguBusiness
from Network.Security import *

test = 0
print("urunSorguController")


@get('/urunsorgula/getlist/<search>')
def getlist(search):
    if IsAllow(request, Roller.TumHesaplar):
        print("Urunsorgula getlist:", search)
        return json_dumps(urunSorguBusiness.getList(search))
    else:
        abort(code=500, text=ErrorText.get('500'))


@get('/urunsorgula/gruplar/<ustGrupid>')
def gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        print("Urunsorgula gruplar:", ustGrupid)
        return json_dumps(urunSorguBusiness.getGruplar(ustGrupid))
    else:
        abort(code=500, text=ErrorText.get('500'))


@route('/urunsorgula/sorgula/<urunKodu>')
def sorgula(urunKodu):
    return ""
