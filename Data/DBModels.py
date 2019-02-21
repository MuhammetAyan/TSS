import datetime


class dbKriterAgirlikModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.MaliyetPuan : float = data[2]
		self.KalitePuan : float = data[3]
		self.TeslimatPuan : float = data[4]
		self.MemnuniyetPuan : float = data[5]


class dbKullanicilarModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.KullaniciAdi : str = data[1]
		self.Sifre : str = data[2]
		self.Rol : str = data[3]


class dbMalKabulModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.TedarikciId : int = data[2]
		self.MaliyetPuan : float = data[3]
		self.KalitePuan : float = data[4]
		self.TeslimatPuan : float = data[5]
		self.MemnuniyetPuan : float = data[6]
		self.Tarih : datetime.datetime = data[7]


class dbSonuclarModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.TedarikciId : int = data[2]
		self.AHPPuan : float = data[3]
		self.AHPUyumSirasi : object = data[4]


class dbTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.TedarikciAdi : str = data[1]
		self.MemnuniyetPuani : float = data[2]
		self.MemnuniyetAdedi : float = data[3]
		self.TeslimatPuani : float = data[4]
		self.TeslimatAdedi : float = data[5]


class dbTedarikUrunleriModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.TedarikciId : int = data[2]
		self.BirimFiyat : float = data[3]


class dbUrunlerGruplarModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.GrupId : int = data[2]
		self.DefaultTedId : int = data[3]


class dbUrunTedarikciModel(object):
	def __init__(self, data: tuple):
		self.id : int = data[0]
		self.StokKodu : str = data[1]
		self.TedarikciId : int = data[2]
		self.MaliyetPuan : float = data[3]
		self.MaliyetAdet : float = data[4]
		self.KalitePuan : float = data[5]
		self.KaliteAdet : float = data[6]


class dbsysdiagramsModel(object):
	def __init__(self, data: tuple):
		self.name : object = data[0]
		self.principal_id : int = data[1]
		self.diagram_id : int = data[2]
		self.version : int = data[3]
		self.definition : object = data[4]
