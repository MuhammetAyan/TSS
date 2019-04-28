from Data.DBModels import *
from Models.GrupModel import *
from Models.GrupStratejilerModel import *
from Models.UstGrupModel import *
from Models.GrupStratejiOranlariModel import *
import Business.AHPBusiness as Ahp
from Test import TEST


def getGruplar(ustGrupid):
    """
    Üst grubun altındaki tüm grupları adları ve id'lerini getirir.
    :param ustGrupid:
    :return:
    """
    datalist: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where UstGrupId = {}".format(ustGrupid))
    temp: list[GrupModel] = []
    for data in datalist:
        if data.id != 0:
            x = GrupModel(data.id, data.GrupAdi)
            temp.append(x.__dict__)
    return temp


def GetGrupStratejiOran(Grupid):
    """
    grup id'si girilen malzeme grubuna ait strateji verisi döndürülecek.
    [{'Kriter1': 'Maliyet', 'Kriter2': 'Teslimat', 'Oran': 5}]
    :param Grupid:
    :return:
    """
    def yakinsa(oran):
        """oranın en yakın olduğu değeri döndürür."""
        oranlar = ["1/9", "1/7", "1/5", "1/3", "1", "3", "5", "7", "9"]
        fark = 100
        deger = "1"
        for o in oranlar:
            yenifark = abs(oran - eval(o))
            if yenifark < fark:
                fark = yenifark
                deger = o
        return deger

    _grupId = Grupid
    datalist: list[dbGrupStratejilerModel] = DB.select("select * from GrupStratejiler where GrupId = {}".format(_grupId))
    assert len(datalist) == 1, "Böyle bir grup bulunamadı."
    while _grupId != 0 and len(datalist) == 0:  # Grubun stratejisi olmadığı sürece
        grup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(_grupId)  # grubu bul
        _grupId = grup.UstGrupId  # Bir üst gruba çık
        datalist = DB.select("select * from GrupStratejiler where GrupId = {}".format(_grupId))  # tekrar sorgula

    assert len(datalist) == 1, "Malzeme grubuna ait strateji verisi bulunamadı."

    temp: list[GrupStratejiOranlariModel] = []
    for data in datalist:  # normalde datalist'te tek eleman var.
        oran = data.Maliyet/data.Kalite
        y = GrupStratejiOranlariModel('Maliyet', 'Kalite', yakinsa(oran))
        temp.append(y.__dict__)

        oran = data.Maliyet/data.Teslimat
        y = GrupStratejiOranlariModel('Maliyet', 'Teslimat', yakinsa(oran))
        temp.append(y.__dict__)

        oran = data.Maliyet/data.Memnuniyet
        y = GrupStratejiOranlariModel('Maliyet', 'Memnuniyet', yakinsa(oran))
        temp.append(y.__dict__)

        oran = data.Kalite/data.Teslimat
        y = GrupStratejiOranlariModel('Kalite', 'Teslimat', yakinsa(oran))
        temp.append(y.__dict__)

        oran = data.Kalite/data.Memnuniyet
        y = GrupStratejiOranlariModel('Kalite', 'Memnuniyet', yakinsa(oran))
        temp.append(y.__dict__)

        oran = data.Teslimat/data.Memnuniyet
        y = GrupStratejiOranlariModel('Teslimat', 'Memnuniyet', yakinsa(oran))
        temp.append(y.__dict__)

    return temp


def GetUstGruplar(Grupid):
    """
    Id'si verilen grubun hiyerarşik olarak üst gruplarını döndürür
    :param Grupid:
    :return:
    """
    UstGruplar: list[UstGrupModel] = []
    GrupId = Grupid
    if GrupId != 0:
        grup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(GrupId)
        assert grup is not None, "Böyle bir grup bulunamadı."
        model = UstGrupModel(grup.id, grup.GrupAdi)
        UstGruplar.append(model.__dict__)
    while GrupId != 0:
        grup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(GrupId)
        ustGrup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(grup.UstGrupId)
        model = UstGrupModel(ustGrup.id, ustGrup.GrupAdi)
        UstGruplar.append(model.__dict__)
        GrupId = ustGrup.id

    UstGruplar.reverse()
    return UstGruplar


def GetGrupStratejileri(Grupid):
    datalist: list[dbGrupStratejilerModel] = DB.select("select * from GrupStratejiler where GrupId = {}".format(Grupid))
    assert len(datalist) == 1, "Böyle bir grup bulunamadı."
    temp: list[GrupStratejilerModel] = []
    for data in datalist:
        y = GrupStratejilerModel('Maliyet',data.Maliyet)
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Kalite',data.Kalite)
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Memnuniyet',data.Memnuniyet)
        temp.append(y.__dict__)

        y = GrupStratejilerModel('Teslimat',data.Teslimat)
        temp.append(y.__dict__)

    return temp


def PostStratejiBelirle(id, tip, data):
    """
    Gelen veriler mobil uygulamadan kıyas bilgilerinin AHP matris satır ortalamasından geçmemiş halidir. Bu veriler AHP matris satır ortalamasından geçip "Stratejiler" tablosuna eklenecek.
    :return:
    """
    if tip == 'grup':
        DB.query("delete GrupStratejiler WHERE GrupId={}".format(id))

        def floatt(x: str)->float:
            l = ["1/9", "1/7", "1/5", "1/3", "1", "3", "5", "7", "9"]
            assert x in l, "Geçersiz değer!"
            if x.__contains__("/"):
                return float(x.split("/")[0]) / float(x.split("/")[1])
            else:
                return float(x)

        def getData(k1: str, k2: str):
            """
            Matrise yerleştirilecek değerleri hesaplar.
            :param k1: Kriter1 adı
            :param k2: Kriter2 adı
            :return:
            """
            if k1 == k2:
                return 1.
            for row in data:
                if row['Kriter1'] == k1 and row['Kriter2'] == k2:
                    return floatt(row['Oran'])
                elif row['Kriter1'] == k2 and row['Kriter2'] == k1:
                    return 1 / floatt(row['Oran'])
            raise ValueError('"{}" ve "{}" ikilisi için değer bulunamadı.'.format(k1, k2))

        kriterler = ["Maliyet", "Kalite", "Teslimat", "Memnuniyet"]  # Kriter isimleri aşağıdaki sql sorgusu ile aynı sırada olmalı

        def matrisOlustur() -> list:
            matris = []
            for k1 in kriterler:
                row = []
                for k2 in kriterler:
                    row.append(getData(k1, k2))
                matris.append(row)
            return matris

        sonuc = Ahp.matrisSatirOrtalamasi(matrisOlustur())

        DB.query("insert into GrupStratejiler (GrupId,Maliyet,Kalite,Teslimat, Memnuniyet) values('{}','{}','{}','{}','{}') ".format(id, sonuc[0], sonuc[1], sonuc[2], sonuc[3]))
    elif tip == 'ürün':
        # Burası sonradan eklenecek. Şu anlık hata vermeye ayarlandı.
        raise ValueError()
