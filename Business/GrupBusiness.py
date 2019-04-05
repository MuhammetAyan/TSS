from Data.DBConnect import select
from Data.DBModels import *
from Models.GrupModel import *
from Models.GrupStratejilerModel import *
from Models.UstGrupModel import *

def getGruplar(ustGrupid):
    """
    Üst grubun altındaki tüm grupları adları ve id'lerini getirir.
    :param ustGrupid:
    :return:
    """
    datalist: list[dbMalzemeGruplariModel] = select("select * from MalzemeGruplari where UstGrupId = {}".format(ustGrupid))
    temp: list[GrupModel] = []
    for data in datalist:
        x = GrupModel(data.id, data.GrupAdi)
        temp.append(x.__dict__)
    return temp

def GetUstGruplar(Grupid):
    """
    Id'si verilen grubun hiyerarşik olarak üst gruplarını döndürür
    :param Grupid:
    :return:
    """
    UstGruplar :list[UstGrupModel] = []
    GrupId = Grupid
    print(type(GrupId)) #list indices must be integers or slices, not str hatası vriyorint yapıom tipini out of range veriyo
    while GrupId != 0:
        Gruplar: list[dbMalzemeGruplariModel] = select("select * from MalzemeGruplari where id = '{}'".format(GrupId))
        UstGrupId =Gruplar[0].UstGrupId
        for grup in Gruplar: # ben buraya Gruplar[GrupId] yazıyordum olmadı ancak boyle yapınca oldu neden ???????????????????????????????????
            ustGrupAdi: list[dbMalzemeGruplariModel] = select("select * from MalzemeGruplari where id = '{}'".format(UstGrupId))
            x = UstGrupModel(grup.UstGrupId,ustGrupAdi[0].GrupAdi)
            UstGruplar.append(x.__dict__)

        GrupId = UstGrupId

    return UstGruplar

def GetGrupStratejileri(Grupid):
    datalist: list[dbGrupStratejilerModel] = select("select * from GrupStratejiler where GrupId = {}".format(Grupid))
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
