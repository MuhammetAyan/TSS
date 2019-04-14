from Data.DBConnect import DB
from Data.DBModels import *
from Models import UrunTedarikciBilgileriModel, UrunBilgiModel


def UrunleriGetir(arama):
    """
    [{'stok': 'stok kodu', 'grup': 'grup adı'}]
    arama metni ile başlayan stok koduna sahip ürünleri ve bağlı olduğu grubun adını döndürür. .
    :param search: Stok kodu.
    :return:
    """
    datalist: list[dbUrunlerModel] = DB.select("select * from Urunler where StokKodu LIKE '{}%'".format(arama))
    Urunler : list[UrunBilgiModel] = []

    for urun in datalist:
        GrupId = urun.GrupId
        Grup : list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(GrupId))

        x = UrunBilgiModel(urun.StokKodu, Grup[0].GrupAdi) #TypeError: 'module' object is not callable hatası ???????????????
        Urunler.append(x.__dict__)

    return Urunler




def UrunAdresi(stokkodu):
    Urun: list[dbUrunlerModel] = DB.select("select top 1 * from Urunler where StokKodu = '{}'".format(stokkodu))
    GrupId = Urun[0].GrupId
    Gruplar = []
    while GrupId != 0:
        Grup: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(GrupId))
        UstGrupId =Grup[0].UstGrupId
        Gruplar.append(Grup[0].GrupAdi)
        GrupId = UstGrupId

    Gruplar.append(".")
    Gruplar.reverse()
    return Gruplar


def UrunTedarikciDefaultYap(StokKodu,TedarikciId):
    """
    /urunlerisorgula/defaultyap/<stokkodu>/<tedarikciId>
    Verilen stok koduna sahip ürünün varsayılan tedarikçisi olarak id'si verilen tedarikçi yapılacak.
    :param stokkodu:
    :param TedarikciId:
    :return:
    """
    DB.query("update Urunler set DefTedId = '{}' where StokKodu= '{}'".format(TedarikciId,StokKodu))

    #return 0  yapmaya gerek varmı bu halde çalışıyor ??????

def TedarikciBilgi(stokkodu):
    Tedarikci: list[dbTedarikUrunleriModel] = DB.select("select * from TedarikUrunleri where StokKodu = '{}'".format(stokkodu))
    print('tedarikciiddd:',len(Tedarikci))
    TedarikciBilgi : list[UrunTedarikciBilgileriModel] = []
    TedarikcilerBilgileri = []
    for i in range(0,len(Tedarikci)-1):

        Tedid = Tedarikci[i].TedarikciId


        TedAdi: list[dbTedarikciModel] = DB.select("select * from Tedarikci where id = '{}'".format(Tedid))
        TedAdi2= TedAdi[0].TedarikciAdi
        #print('tedadii2:',TedAdi2)

        """
        TedAhp : list[dbSonuclarModel] = select("select * from Sonuclar where TedarikciId = '{}' and StokKodu = '{}' ".format(Tedid, stokkodu))
        TedAhp2 = TedAhp[0].AHPPuan
        print('tedaahp:',TedAhp2)

        
        TedA = select(("select TedarikciAdi from Tedarikci where id = '{}'".format(Tedid)),True)
        print('teda:',TedA)
        
        """
        #x = UrunTedarikciBilgileriModel(Tedid,TedAdi2,5,False)
        #TedarikciBilgi.append(x)

        TedarikciBilgi.append(Tedid)
        #print('tedbilgielr1:',TedarikciBilgi)

        TedarikciBilgi.append(TedAdi2)
        #print('tedbilgielr2:',TedarikciBilgi)

        TedarikcilerBilgileri.append(TedarikciBilgi)
        TedarikciBilgi = []



    return TedarikcilerBilgileri






