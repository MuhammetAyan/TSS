from Network.bottle import *
from Business import GrupBusiness
from Network.Security import *

@get('/strateji/gruplar/<ustGrupid>')
def Gruplar(ustGrupid):
    if IsAllow(request, Roller.TumHesaplar):
        print("MalzemeGrupları gruplar:", ustGrupid)
        return json_dumps(GrupBusiness.getGruplar(ustGrupid))
    else:
        UnauthorizedError()

