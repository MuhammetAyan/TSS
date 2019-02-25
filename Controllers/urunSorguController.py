from Network.bottle import *
from Business.urunSorguBusiness import *
from Network.Security import *

print("urunSorguController")


@route('/urunsorgula/getlist/<search>')
def getlist(search):
    if IsAllow(request, Roller.TumHesaplar):
        print("Urunsorgula getlist:", search)
        return json_dumps(getList(search))
    else:
        abort(code=500, text=ErrorText.get('500'))


@route('/urunsorgula/sorgula/<urunKodu>')
def sorgula(urunKodu):
    return ""
