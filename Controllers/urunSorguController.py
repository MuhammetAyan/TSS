from Network.bottle import route, get, request, response, json_dumps
from Business import UrunBusiness
from Network.Security import *
from Test import TEST

TEST("urunSorguController")


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

"""
/urunlerisorgula/defaultyap/<stokkodu>/<tedarikciId> 
Verilen stok koduna sahip ürünün varsayılan tedarikçisi olarak id'si verilen tedarikçi yapılacak.
"""
@route('/urunlerisorgula/defaultyap/<stokkodu>/<tedarikciId:int>')
def UrunTedarikciDefaultYap(stokkodu,tedarikciId):
    if IsAllow(request, Roller.TumHesaplar):
        try:
            UrunBusiness.UrunTedarikciDefaultYap(stokkodu,tedarikciId)
        except AssertionError as error:
            abort(400, error.__str__())
        except Exception as error:
            abort(500, error.__str__())
    else:
        UnauthorizedError()

"""[{'stok': 'stok kodu', 'grup': 'grup adı'}]
arama metni ile başlayan stok koduna sahip ürünleri ve bağlı olduğu grubun adını döndürür. """
@get('/urunlerisorgula/urunler/<arama>')
def UrunSorgula(arama):
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(UrunBusiness.UrunleriGetir(arama))
    else:
        UnauthorizedError()

