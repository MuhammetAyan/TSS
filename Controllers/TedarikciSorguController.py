from Network.bottle import route,get,request,response
from Business import TedarikciBusiness
from Network.Security import *
from Test import TEST

TEST("TedarikçiSorguController")

"""arama metnini içeren tedarikçileri listeler.
(response'da 'defNo' ile bahsedilen bu tedarikçiden kaç tane ürün varsayılan olarak alınıyor.)"""

@route('/tedarikcisorgula/listele/<arama>')
def TedarikciSorgula(arama):
    """
    :param grupId:
    :param arama:
    :return:
    """
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(TedarikciBusiness.TedarikciSorgula(arama))
    else:
        UnauthorizedError()



@route('/tedarikcisorgula/tedarikci/<tedarikciId>')
def TedarikciSorgula(tedarikciId):
    """
    Tedarikçi sorgulamada bir tedarikçinin bilgileri gösterilirken tedarikçinin sattığı ürünler ve
    bu ürünlerden hangilerini varsayılan olarak aldığımızı göstermek için bu servis kullanılacak.
    :param tedarikciId:
    :return:
    """
    if IsAllow(request, Roller.TumHesaplar):
        return json_dumps(TedarikciBusiness.TedarikciUrunleri(tedarikciId))
    else:
        UnauthorizedError()
