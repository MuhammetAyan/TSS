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

"""Stok kodu verilen ürünün "Sonuclar" ve "TedarikciUrünleri" tablosundaki 
bilgilerle tedarikçinin id'si, adı, AHP puanı ve ürünün varsayılan tedarikçisi olup olmadığı bilgisini döndürecek.
[{'id': 0, 'tedarikci': 'tedarikçi adı', 'ahp': 23, 'default': False}] """

@route('/urunlerisorgula/tedarikciler/<stokkodu>')
def TedarikciBilgileriGetir(stokkodu):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(UrunBusiness.TedarikciBilgi(stokkodu))
    else:
        UnauthorizedError()
