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
    return sorted(temp, key=lambda y: y['grupadi'])


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
    strateji: list[GrupStratejilerModel] = GetGrupStratejileri(Grupid)
    temp: list[GrupStratejiOranlariModel] = []
    kriterler = {}
    for kriter in strateji:  # normalde datalist'te tek eleman var.
        kriterler.update({kriter["kriter"]: kriter["val"]})
    del strateji
    
    oran = kriterler["Maliyet"]/kriterler["Kalite"]
    y = GrupStratejiOranlariModel('Maliyet', 'Kalite', yakinsa(oran))
    temp.append(y.__dict__)

    oran = kriterler["Maliyet"]/kriterler["Teslimat"]
    y = GrupStratejiOranlariModel('Maliyet', 'Teslimat', yakinsa(oran))
    temp.append(y.__dict__)

    oran = kriterler["Maliyet"]/kriterler["Memnuniyet"]
    y = GrupStratejiOranlariModel('Maliyet', 'Memnuniyet', yakinsa(oran))
    temp.append(y.__dict__)

    oran = kriterler["Kalite"]/kriterler["Teslimat"]
    y = GrupStratejiOranlariModel('Kalite', 'Teslimat', yakinsa(oran))
    temp.append(y.__dict__)

    oran = kriterler["Kalite"]/kriterler["Memnuniyet"]
    y = GrupStratejiOranlariModel('Kalite', 'Memnuniyet', yakinsa(oran))
    temp.append(y.__dict__)

    oran = kriterler["Teslimat"]/kriterler["Memnuniyet"]
    y = GrupStratejiOranlariModel('Teslimat', 'Memnuniyet', yakinsa(oran))
    temp.append(y.__dict__)

    return temp


def GetUstGruplar(Grupid):
    """
    Id'si verilen grubun hiyerarşik olarak üst gruplarını döndürür
    :param Grupid:
    :return:
    """
    KalitimId = -1

    def stratejiVarmi(grupId):
        global KalitimId
        x = DB.select("select top 1 count(id) from GrupStratejiler where GrupId='{}'".format(grupId), True)[0][0]
        if x == 1:
            return grupId
        else:
            return -1

    UstGruplar: list[UstGrupModel] = []
    GrupId = Grupid
    if GrupId == 0:
        AnaGrup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(GrupId)
        model = UstGrupModel(0, AnaGrup.GrupAdi)
        UstGruplar.append(model.__dict__)
        k = stratejiVarmi(0)
        KalitimId = k if k != -1 and KalitimId == -1 else KalitimId
    else:
        grup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(GrupId)
        assert grup is not None, "Böyle bir grup bulunamadı."
        model = UstGrupModel(grup.id, grup.GrupAdi)
        UstGruplar.append(model.__dict__)
        k = stratejiVarmi(grup.id)
        KalitimId = k if k != -1 and KalitimId == -1 else KalitimId
        while GrupId != 0:
            grup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(GrupId)
            ustGrup: dbMalzemeGruplariModel = dbMalzemeGruplariModel.select(grup.UstGrupId)
            model = UstGrupModel(ustGrup.id, ustGrup.GrupAdi)
            UstGruplar.append(model.__dict__)
            GrupId = ustGrup.id
            k = stratejiVarmi(ustGrup.id)
            KalitimId = k if k != -1 and KalitimId == -1 else KalitimId
    UstGruplar.reverse()
    for gr in UstGruplar:
        if gr["id"] == KalitimId:
            gr["kalitim"] = True
    return UstGruplar


def GetGrupStratejileri(Grupid):
    def GetGrup(id) -> dbMalzemeGruplariModel:
        MalzemeGruplari: list[dbMalzemeGruplariModel] = DB.select("select * from MalzemeGruplari where id = '{}'".format(id))
        assert len(MalzemeGruplari) == 1, "Böyle bir grup bulunamadı."
        # TEST(">>>", MalzemeGruplari[0].id, MalzemeGruplari[0].GrupAdi)
        return MalzemeGruplari[0]

    MalzemeGrubu = GetGrup(Grupid)
    temp: list[GrupStratejilerModel] = []
    while True:
        stratejiler: list[dbGrupStratejilerModel] = DB.select("select * from GrupStratejiler where GrupId = '{}'".format(MalzemeGrubu.id))
        if len(stratejiler) == 1:
            strateji = stratejiler[0]
            y = GrupStratejilerModel('Maliyet', strateji.Maliyet)
            temp.append(y.__dict__)

            y = GrupStratejilerModel('Kalite', strateji.Kalite)
            temp.append(y.__dict__)

            y = GrupStratejilerModel('Memnuniyet', strateji.Memnuniyet)
            temp.append(y.__dict__)

            y = GrupStratejilerModel('Teslimat', strateji.Teslimat)
            temp.append(y.__dict__)
            return temp
        else:
            MalzemeGrubu = GetGrup(MalzemeGrubu.UstGrupId)


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


def UsttenKalitimAl(grupId):
    """
    Bir grubun kendi stratejisi yoksa üstten kalıtım alıyor demektir. Yani bu fonksiyon grubun stratejisini siler.
    :param grupId: Stratejisi silinecek grubun id'si
    :return:
    """
    DB.query("DELETE FROM GrupStratejiler WHERE GrupId='{}'".format(grupId))
