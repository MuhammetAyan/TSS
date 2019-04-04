from Network.bottle import route,get,request,response
from Business import UrunBusiness
from Network.Security import *

print("urunSorguController")


@route('/urunlerisorgula/adresigetir/<stokkodu>')
def AdresiGetir(stokkodu):
    """
    :param grupId:
    :param arama:
    :return:
    """
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(UrunBusiness.UrunAdresi(stokkodu))
    else:
        UnauthorizedError()



@route('/urunsorgula/sorgula/<urunKodu>')
def sorgula(urunKodu):
    if IsAllow(request, Roller.TumHesaplar):
        print("sorgula")
    else:
        UnauthorizedError()
