from Data.DBConnect import select, query
from Data.DBModels import *


def Create(liste: list, tabloadi: str):
    print(tabloadi, ":")
    query("DELETE FROM {}".format(tabloadi))
    print("\tTüm veriler silindi.")
    for element in liste:
        query("INSERT {} VALUES{}".format(tabloadi, str(element)))
    print("\tVeriler tekrar oluşturuldu.")
    del liste


kullanicilar = [
    ('Muhammet', '1234', 'admin'),
    ('User', '1234', 'user'),
    ('Yunus', '1234', 'admin'),
    ('İdris', '1234', 'admin'),
]
Create(kullanicilar, "Kullanicilar")


tedarikciler = [
    ('Rendecioğlu Holding', 100, 1, 100, 1),
]
Create(tedarikciler, "Tedarikci")


query("DELETE FROM UrunlerGruplar")

query("INSERT UrunlerGruplar VALUES('BSKLT', NULL, 1, 0, 'Bisiklet Parçaları')")
ids = select("SELECT id FROM UrunlerGruplar WHERE StokKodu = 'BSKLT'", True)
query("INSERT UrunlerGruplar VALUES('BTEK', {}, 1, 0, 'Tekerlekler')".format(ids[0][0]))

ids = select("SELECT id FROM UrunlerGruplar WHERE StokKodu = 'BTEK'", True)
query("INSERT UrunlerGruplar VALUES('TK501', {}, 1, 1, 'Ön Tekerlek 1')".format(ids[0][0]))
query("INSERT UrunlerGruplar VALUES('TK401', {}, 1, 1, 'Arka Tekerlek 1')".format(ids[0][0]))
query("INSERT UrunlerGruplar VALUES('TK602', {}, 1, 1, 'Ön Tekerlek 5')".format(ids[0][0]))
query("INSERT UrunlerGruplar VALUES('TK751', {}, 1, 1, 'Arka Tekerlek 5')".format(ids[0][0]))

query("INSERT UrunlerGruplar VALUES('CMRR', NULL, 1, 0, 'Bisiklet Çamurluklar')")
ids = select("SELECT id FROM UrunlerGruplar WHERE StokKodu = 'CMRR'", True)
query("INSERT UrunlerGruplar VALUES('CMR532', {}, 1, 1, 'Ön Çamurluk')".format(ids[0][0]))
query("INSERT UrunlerGruplar VALUES('CMR632', {}, 1, 1, 'Arka Çamurluk')".format(ids[0][0]))
