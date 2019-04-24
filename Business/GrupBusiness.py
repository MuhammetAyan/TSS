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
        x = GrupModel(data.id, data.GrupAdi)
        temp.append(x.__dict__)
    return temp

def GetGrupStratejiOran(Grupid):
    """
    grup id'si girilen malzeme grubuna ait strateji verisi döndürülecek. yapılıyor
    [{'Kriter1': 'Maliyet', 'Kriter2': 'Teslimat', 'Oran': 5}]
    :param Grupid:
    :return:
    """
    datalist: list[dbGrupStratejilerModel] = DB.select("select * from GrupStratejiler where GrupId = {}".format(Grupid))
    temp: list[GrupStratejiOranlariModel] = []
    for data in datalist:
        oran = data.Maliyet/data.Kalite
        y = GrupStratejiOranlariModel('Maliyet','Kalite',oran)
        temp.append(y.__dict__)

        oran = data.Maliyet/data.Teslimat
        y = GrupStratejiOranlariModel('Maliyet','Teslimat',oran)
        temp.append(y.__dict__)

        oran = data.Maliyet/data.Memnuniyet
        y = GrupStratejiOranlariModel('Maliyet','Memnuniyet',oran)
        temp.append(y.__dict__)

        oran = data.Kalite/data.Teslimat
        y = GrupStratejiOranlariModel('Kalite','Teslimat',oran)
        temp.append(y.__dict__)

        oran = data.Kalite/data.Memnuniyet
        y = GrupStratejiOranlariModel('Kalite','Memnuniyet',oran)
        temp.append(y.__dict__)

        oran = data.Teslimat/data.Memnuniyet
        y = GrupStratejiOranlariModel('Teslimat','Memnuniyet',oran)
        temp.append(y.__dict__)

    return temp

def GetUstGruplar(Grupid):
    """
    Id'si verilen grubun hiyerarşik olarak üst gruplarını döndürür
    :param Grupid:
    :return:
    """
    UstGruplar :list[UstGrupModel] = []
    GrupId = Grupid
    TEST(type(GrupId))  # list indices must be integers or slices, not str hatası vriyorint yapıom tipini out of range veriyo aşşada forda Gruplar yazınca düzeldi biraz anladım ama tam anlamadım
    while GrupId != 0:
        gruplar: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(GrupId))
        UstGrupId = gruplar[0].UstGrupId

        grup = gruplar[0]
        ustGrupAdi: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(UstGrupId))
        x = UstGrupModel(grup.UstGrupId, ustGrupAdi[0].GrupAdi)
        UstGruplar.append(x.__dict__)

        GrupId = UstGrupId

    UstGruplar.reverse()
    return UstGruplar

def GetGrupStratejileri(Grupid):
    datalist: list[dbGrupStratejilerModel] = DB.select("select * from GrupStratejiler where GrupId = {}".format(Grupid))
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

        def getData(k1: str, k2: str):
            """
            Matrise yerleştirilecek değerleri hesaplar.
            :param k1: Kriter1 adı
            :param k2: Kriter2 adı
            :return:
            """
            if k1 == k2:
                return 1
            for row in data:
                if row['Kriter1'] == k1 and row['Kriter2'] == k2:
                    return int(row['Oran'])
                elif row['Kriter1'] == k2 and row['Kriter2'] == k1:
                    return 1 / int(row['Oran'])
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
