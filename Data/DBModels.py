import datetime
from .DBConnect import DB


class dbGrupStratejilerModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.GrupId: int = data[1] if data is not None else None
		self.Maliyet: float = data[2] if data is not None else None
		self.Kalite: float = data[3] if data is not None else None
		self.Teslimat: float = data[4] if data is not None else None
		self.Memnuniyet: float = data[5] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (GrupId, Maliyet, Kalite, Teslimat, Memnuniyet) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("GrupStratejiler", self.GrupId, self.Maliyet, self.Kalite, self.Teslimat, self.Memnuniyet))
		self.id = DB.select("SELECT TOP 1 id FROM GrupStratejiler ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET GrupId='{}', Maliyet='{}', Kalite='{}', Teslimat='{}', Memnuniyet='{}' WHERE id = {}""".format("GrupStratejiler", self.GrupId, self.Maliyet, self.Kalite, self.Teslimat, self.Memnuniyet, self.id))

	def delete(self):
		DB.query("""DELETE FROM GrupStratejiler WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM GrupStratejiler WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbKullanicilarModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.KullaniciAdi: str = data[1] if data is not None else None
		self.Sifre: str = data[2] if data is not None else None
		self.Rol: str = data[3] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (KullaniciAdi, Sifre, Rol) VALUES ('{}', '{}', '{}')""".format("Kullanicilar", self.KullaniciAdi, self.Sifre, self.Rol))
		self.id = DB.select("SELECT TOP 1 id FROM Kullanicilar ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET KullaniciAdi='{}', Sifre='{}', Rol='{}' WHERE id = {}""".format("Kullanicilar", self.KullaniciAdi, self.Sifre, self.Rol, self.id))

	def delete(self):
		DB.query("""DELETE FROM Kullanicilar WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM Kullanicilar WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbMalKabulModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.TedarikciId: int = data[2] if data is not None else None
		self.MaliyetPuan: int = data[3] if data is not None else None
		self.KalitePuan: int = data[4] if data is not None else None
		self.TeslimatPuan: int = data[5] if data is not None else None
		self.MemnuniyetPuan: int = data[6] if data is not None else None
		self.Tarih: datetime.datetime = data[7] if data is not None else None
		self.Adet: int = data[8] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan, Tarih, Adet) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format("MalKabul", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.Tarih, self.Adet))
		self.id = DB.select("SELECT TOP 1 id FROM MalKabul ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', MaliyetPuan='{}', KalitePuan='{}', TeslimatPuan='{}', MemnuniyetPuan='{}', Tarih='{}', Adet='{}' WHERE id = {}""".format("MalKabul", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.Tarih, self.Adet, self.id))

	def delete(self):
		DB.query("""DELETE FROM MalKabul WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM MalKabul WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbMalzemeGruplariModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.GrupAdi: str = data[1] if data is not None else None
		self.UstGrupId: int = data[2] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (GrupAdi, UstGrupId) VALUES ('{}', '{}')""".format("MalzemeGruplari", self.GrupAdi, self.UstGrupId))
		self.id = DB.select("SELECT TOP 1 id FROM MalzemeGruplari ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET GrupAdi='{}', UstGrupId='{}' WHERE id = {}""".format("MalzemeGruplari", self.GrupAdi, self.UstGrupId, self.id))

	def delete(self):
		DB.query("""DELETE FROM MalzemeGruplari WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM MalzemeGruplari WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbSonuclarModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.TedarikciId: int = data[2] if data is not None else None
		self.AHPPuan: float = data[3] if data is not None else None
		self.AHPUyumSirasi: int = data[4] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, TedarikciId, AHPPuan, AHPUyumSirasi) VALUES ('{}', '{}', '{}', '{}')""".format("Sonuclar", self.StokKodu, self.TedarikciId, self.AHPPuan, self.AHPUyumSirasi))
		self.id = DB.select("SELECT TOP 1 id FROM Sonuclar ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', AHPPuan='{}', AHPUyumSirasi='{}' WHERE id = {}""".format("Sonuclar", self.StokKodu, self.TedarikciId, self.AHPPuan, self.AHPUyumSirasi, self.id))

	def delete(self):
		DB.query("""DELETE FROM Sonuclar WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM Sonuclar WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbTedarikciModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.TedarikciAdi: str = data[1] if data is not None else None
		self.Memnuniyet: float = data[2] if data is not None else None
		self.MemnuniyetAdedi: float = data[3] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (TedarikciAdi, Memnuniyet, MemnuniyetAdedi) VALUES ('{}', '{}', '{}')""".format("Tedarikci", self.TedarikciAdi, self.Memnuniyet, self.MemnuniyetAdedi))
		self.id = DB.select("SELECT TOP 1 id FROM Tedarikci ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET TedarikciAdi='{}', Memnuniyet='{}', MemnuniyetAdedi='{}' WHERE id = {}""".format("Tedarikci", self.TedarikciAdi, self.Memnuniyet, self.MemnuniyetAdedi, self.id))

	def delete(self):
		DB.query("""DELETE FROM Tedarikci WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM Tedarikci WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbTedarikUrunleriModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.TedarikciId: int = data[2] if data is not None else None
		self.BirimFiyat: float = data[3] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, TedarikciId, BirimFiyat) VALUES ('{}', '{}', '{}')""".format("TedarikUrunleri", self.StokKodu, self.TedarikciId, self.BirimFiyat))
		self.id = DB.select("SELECT TOP 1 id FROM TedarikUrunleri ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', BirimFiyat='{}' WHERE id = {}""".format("TedarikUrunleri", self.StokKodu, self.TedarikciId, self.BirimFiyat, self.id))

	def delete(self):
		DB.query("""DELETE FROM TedarikUrunleri WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM TedarikUrunleri WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbUrunlerModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.StokAdi: str = data[2] if data is not None else None
		self.GrupId: int = data[3] if data is not None else None
		self.DefTedId: int = data[4] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, StokAdi, GrupId, DefTedId) VALUES ('{}', '{}', '{}', '{}')""".format("Urunler", self.StokKodu, self.StokAdi, self.GrupId, self.DefTedId))
		self.id = DB.select("SELECT TOP 1 id FROM Urunler ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', StokAdi='{}', GrupId='{}', DefTedId='{}' WHERE id = {}""".format("Urunler", self.StokKodu, self.StokAdi, self.GrupId, self.DefTedId, self.id))

	def delete(self):
		DB.query("""DELETE FROM Urunler WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM Urunler WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbUrunStratejilerModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.MaliyetPuan: float = data[2] if data is not None else None
		self.KalitePuan: float = data[3] if data is not None else None
		self.TeslimatPuan: float = data[4] if data is not None else None
		self.MemnuniyetPuan: float = data[5] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, MaliyetPuan, KalitePuan, TeslimatPuan, MemnuniyetPuan) VALUES ('{}', '{}', '{}', '{}', '{}')""".format("UrunStratejiler", self.StokKodu, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan))
		self.id = DB.select("SELECT TOP 1 id FROM UrunStratejiler ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', MaliyetPuan='{}', KalitePuan='{}', TeslimatPuan='{}', MemnuniyetPuan='{}' WHERE id = {}""".format("UrunStratejiler", self.StokKodu, self.MaliyetPuan, self.KalitePuan, self.TeslimatPuan, self.MemnuniyetPuan, self.id))

	def delete(self):
		DB.query("""DELETE FROM UrunStratejiler WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM UrunStratejiler WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None



class dbUrunTedarikciModel:
	def __init__(self, data: tuple = None):
		self.id: int = data[0] if data is not None else None
		self.StokKodu: str = data[1] if data is not None else None
		self.TedarikciId: int = data[2] if data is not None else None
		self.MaliyetPuan: float = data[3] if data is not None else None
		self.MaliyetAdet: float = data[4] if data is not None else None
		self.KalitePuan: float = data[5] if data is not None else None
		self.KaliteAdet: float = data[6] if data is not None else None
		self.TeslimatPuan: float = data[7] if data is not None else None
		self.TeslimatAdet: float = data[8] if data is not None else None

	def insert(self):
		DB.query("""INSERT INTO {} (StokKodu, TedarikciId, MaliyetPuan, MaliyetAdet, KalitePuan, KaliteAdet, TeslimatPuan, TeslimatAdet) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}')""".format("UrunTedarikci", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.MaliyetAdet, self.KalitePuan, self.KaliteAdet, self.TeslimatPuan, self.TeslimatAdet))
		self.id = DB.select("SELECT TOP 1 id FROM UrunTedarikci ORDER BY id DESC", True)[0][0]

	def update(self):
		DB.query("""UPDATE {} SET StokKodu='{}', TedarikciId='{}', MaliyetPuan='{}', MaliyetAdet='{}', KalitePuan='{}', KaliteAdet='{}', TeslimatPuan='{}', TeslimatAdet='{}' WHERE id = {}""".format("UrunTedarikci", self.StokKodu, self.TedarikciId, self.MaliyetPuan, self.MaliyetAdet, self.KalitePuan, self.KaliteAdet, self.TeslimatPuan, self.TeslimatAdet, self.id))

	def delete(self):
		DB.query("""DELETE FROM UrunTedarikci WHERE id = {}""".format(self.id))


	@staticmethod
	def select(id):
		result = DB.select("""SELECT * FROM UrunTedarikci WHERE id = {}""".format(id))
		if len(result) > 0:
			return result[0]
		return None


DB.Models.update({'dbGrupStratejilerModel': dbGrupStratejilerModel})
DB.Models.update({'dbKullanicilarModel': dbKullanicilarModel})
DB.Models.update({'dbMalKabulModel': dbMalKabulModel})
DB.Models.update({'dbMalzemeGruplariModel': dbMalzemeGruplariModel})
DB.Models.update({'dbSonuclarModel': dbSonuclarModel})
DB.Models.update({'dbTedarikciModel': dbTedarikciModel})
DB.Models.update({'dbTedarikUrunleriModel': dbTedarikUrunleriModel})
DB.Models.update({'dbUrunlerModel': dbUrunlerModel})
DB.Models.update({'dbUrunStratejilerModel': dbUrunStratejilerModel})
DB.Models.update({'dbUrunTedarikciModel': dbUrunTedarikciModel})
