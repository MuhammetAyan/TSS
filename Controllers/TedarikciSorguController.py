from Network.bottle import route,get,request,response
from Business import TedarikciBusiness
from Network.Security import *


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

