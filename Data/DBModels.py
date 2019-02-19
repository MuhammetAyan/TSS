

class KriterAgirlik(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.MaliyetPuan = data[2]
		self.KalitePuan = data[3]
		self.TeslimatPuan = data[4]
		self.MemnuniyetPuan = data[5]


class Kullanicilar(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.KullaniciAdi = data[1]
		self.Sifre = data[2]
		self.Rol = data[3]


class MalKabul(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.TedarikciId = data[2]
		self.MaliyetPuan = data[3]
		self.KalitePuan = data[4]
		self.TeslimatPuan = data[5]
		self.MemnuniyetPuan = data[6]
		self.Tarih = data[7]


class Sonuclar(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.TedarikciId = data[2]
		self.AHPPuan = data[3]
		self.AHPUyumSirasi = data[4]


class Tedarikci(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.TedarikciAdi = data[1]
		self.MemnuniyetPuani = data[2]
		self.MemnuniyetAdedi = data[3]
		self.TeslimatPuani = data[4]
		self.TeslimatAdedi = data[5]


class TedarikUrunleri(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.TedarikciId = data[2]
		self.BirimFiyat = data[3]


class UrunlerGruplar(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.GrupId = data[2]
		self.DefaultTedId = data[3]


class UrunTedarikci(object):
	def __init__(self, data: tuple):
		self.id = data[0]
		self.StokKodu = data[1]
		self.TedarikciId = data[2]
		self.MaliyetPuan = data[3]
		self.MaliyetAdet = data[4]
		self.KalitePuan = data[5]
		self.KaliteAdet = data[6]


class sysdiagrams(object):
	def __init__(self, data: tuple):
		self.name = data[0]
		self.principal_id = data[1]
		self.diagram_id = data[2]
		self.version = data[3]
		self.definition = data[4]
