from Network.bottle import route,get,request,response
from Business import GrupBusiness
from Network.Security import *

@get('/strateji/gruplar/<ustGrupid>')
def Gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        print("MalzemeGrupları gruplar:", ustGrupid)
        return json_dumps(GrupBusiness.getGruplar(ustGrupid))
    else:
        UnauthorizedError()

@route('/strateji/adres/<grupId>')
def UstGruplar(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetUstGruplar(grupId))
    else:
        UnauthorizedError()

@route('/strateji/stratejigetir/<grupId>')
def GrupStratejiOran(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetGrupStratejiOran(grupId))
    else:
        UnauthorizedError()

@route('/strateji/grafik/<grupId>')
def GrupStrateji(grupId):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(GrupBusiness.GetGrupStratejileri(grupId))
    else:
        UnauthorizedError()


@post('/strateji/belirle')
def StratejiBelirle():
    if IsAllow(request, Roller.TumHesaplar):
        id = request.json.get('id')
        tip = request.json.get('tip')
        maliyet = request.json.get('maliyet')
        kalite = request.json.get('kalite')
        teslimat= request.json.get('teslimat')
        memnuniyet= request.json.get('memnuniyet')

        GrupBusiness.PostStratejiBelirle(id,tip,maliyet,kalite,teslimat,memnuniyet)
    else:
        UnauthorizedError()
