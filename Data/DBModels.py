import datetime
import Data.DBConnect


class dbGrupStratejilerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.GrupId: int = data[1]
		self.Maliyet: float = data[2]
		self.Kalite: float = data[3]
		self.Teslimat: float = data[4]
		self.Memnuniyet: float = data[5]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (GrupId, Maliyet, Kalite, Teslimat, Memnuniyet) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("GrupStratejiler", self.GrupId, self.Maliyet, self.Kalite, self.Teslimat, self.Memnuniyet))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET GrupId='{}', Maliyet='{}', Kalite='{}', Teslimat='{}', Memnuniyet='{}' WHERE id = {}""".format("GrupStratejiler", self.GrupId, self.Maliyet, self.Kalite, self.Teslimat, self.Memnuniyet, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM GrupStratejiler WHERE id = {}""".format(self.id))



class dbKullanicilarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.KullaniciAdi: str = data[1]
		self.Sifre: str = data[2]
		self.Rol: str = data[3]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (KullaniciAdi, Sifre, Rol) VALUES ('{}', '{}', '{}')""".format("Kullanicilar", self.KullaniciAdi, self.Sifre, self.Rol))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET KullaniciAdi='{}', Sifre='{}', Rol='{}' WHERE id = {}""".format("Kullanicilar", self.KullaniciAdi, self.Sifre, self.Rol, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM Kullanicilar WHERE id = {}""".format(self.id))



class dbUrunlerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.StokAdi: str = data[2]
		self.GrupId: int = data[3]
		self.DefTedId: int = data[4]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, StokAdi, GrupId, DefTedId) VALUES ('{}', '{}', '{}', '{}')""".format("Urunler", self.StokKodu, self.StokAdi, self.GrupId, self.DefTedId))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', StokAdi='{}', GrupId='{}', DefTedId='{}' WHERE id = {}""".format("Urunler", self.StokKodu, self.StokAdi, self.GrupId, self.DefTedId, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM Urunler WHERE id = {}""".format(self.id))



class dbSonuclarModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.AHPPuan: float = data[3]
		self.AHPUyumSirasi: int = data[4]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, AHPPuan, AHPUyumSirasi) VALUES ('{}', '{}', '{}', '{}')""".format("Sonuclar", self.StokKodu, self.TedarikciId, self.AHPPuan, self.AHPUyumSirasi))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', AHPPuan='{}', AHPUyumSirasi='{}' WHERE id = {}""".format("Sonuclar", self.StokKodu, self.TedarikciId, self.AHPPuan, self.AHPUyumSirasi, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM Sonuclar WHERE id = {}""".format(self.id))



class dbMalzemeGruplariModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.GrupAdi: str = data[1]
		self.UstGrupId: int = data[2]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (GrupAdi, UstGrupId) VALUES ('{}', '{}')""".format("MalzemeGruplari", self.GrupAdi, self.UstGrupId))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET GrupAdi='{}', UstGrupId='{}' WHERE id = {}""".format("MalzemeGruplari", self.GrupAdi, self.UstGrupId, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM MalzemeGruplari WHERE id = {}""".format(self.id))



class dbUrunTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: float = data[3]
		self.MaliyetAdet: float = data[4]
		self.KalitePuan: float = data[5]
		self.KaliteAdet: float = data[6]
		self.TeslimatPuan: float = data[7]
		self.TeslimatAdet: float = data[8]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, MaliyetAdet, KalitePuan, KaliteAdet, TeslimatPuan, TeslimatAdet) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format("UrunTedarikci", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.MaliyetAdet, self.KalitePuan, self.KaliteAdet, self.TeslimatPuan, self.TeslimatAdet))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', MaliyetPuan='{}', MaliyetAdet='{}', KalitePuan='{}', KaliteAdet='{}', TeslimatPuan='{}', TeslimatAdet='{}' WHERE id = {}""".format("UrunTedarikci", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.MaliyetAdet, self.KalitePuan, self.KaliteAdet, self.TeslimatPuan, self.TeslimatAdet, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM UrunTedarikci WHERE id = {}""".format(self.id))



class dbMalKabulModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.MaliyetPuan: int = data[3]
		self.KalitePuan: int = data[4]
		self.TeslimatPuan: int = data[5]
		self.MemnuniyetPuan: int = data[6]
		self.Tarih: datetime.datetime = data[7]
		self.Adet: int = data[8]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan, Tarih, Adet) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format("MalKabul", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.Tarih, self.Adet))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', MaliyetPuan='{}', KalitePuan='{}', TeslimatPuan='{}', MemnuniyetPuan='{}', Tarih='{}', Adet='{}' WHERE id = {}""".format("MalKabul", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.Tarih, self.Adet, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM MalKabul WHERE id = {}""".format(self.id))



class dbUrunStratejilerModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.MaliyetPuan: float = data[2]
		self.KalitePuan: float = data[3]
		self.TeslimatPuan: float = data[4]
		self.MemnuniyetPuan: float = data[5]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("UrunStratejiler", self.StokKodu, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', MaliyetPuan='{}', KalitePuan='{}', TeslimatPuan='{}', MemnuniyetPuan='{}' WHERE id = {}""".format("UrunStratejiler", self.StokKodu, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM UrunStratejiler WHERE id = {}""".format(self.id))



class dbTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.TedarikciAdi: str = data[1]
		self.Memnuniyet: float = data[2]
		self.MemnuniyetAdedi: float = data[3]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (TedarikciAdi, Memnuniyet, MemnuniyetAdedi) VALUES ('{}', '{}', '{}')""".format("Tedarikci", self.TedarikciAdi, self.Memnuniyet, self.MemnuniyetAdedi))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET TedarikciAdi='{}', Memnuniyet='{}', MemnuniyetAdedi='{}' WHERE id = {}""".format("Tedarikci", self.TedarikciAdi, self.Memnuniyet, self.MemnuniyetAdedi, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM Tedarikci WHERE id = {}""".format(self.id))



class dbsysdiagramsModel(object):
	def __init__(self, data: tuple):
		self.name: object = data[0]
		self.principal_id: int = data[1]
		self.diagram_id: int = data[2]
		self.version: int = data[3]
		self.definition: object = data[4]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (name, principal_id, diagram_id, version, definition) VALUES ('{}', '{}', '{}', '{}')""".format("sysdiagrams", self.name, self.principal_id, self.diagram_id, self.version, self.definition))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET name='{}', principal_id='{}', diagram_id='{}', version='{}', definition='{}' WHERE id = {}""".format("sysdiagrams", self.name, self.principal_id, self.diagram_id, self.version, self.definition, self.name))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM sysdiagrams WHERE id = {}""".format(self.id))



class dbTedarikUrunleriModel(object):
	def __init__(self, data: tuple):
		self.id: int = data[0]
		self.StokKodu: str = data[1]
		self.TedarikciId: int = data[2]
		self.BirimFiyat: float = data[3]

	def insert(self):
		Data.DBConnect.query("""INSERT INTO {} (StokKodu, TedarikciId, BirimFiyat) VALUES ('{}', '{}', '{}')""".format("TedarikUrunleri", self.StokKodu, self.TedarikciId, self.BirimFiyat))

	def update(self):
		Data.DBConnect.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', BirimFiyat='{}' WHERE id = {}""".format("TedarikUrunleri", self.StokKodu, self.TedarikciId, self.BirimFiyat, self.id))

	def delete(self):
		Data.DBConnect.query("""DELETE FROM TedarikUrunleri WHERE id = {}""".format(self.id))

