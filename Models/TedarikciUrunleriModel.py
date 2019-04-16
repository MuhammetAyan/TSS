"""
Tedarikçi sorgulamada bir tedarikçinin bilgileri gösterilirken tedarikçinin sattığı ürünler ve
bu ürünlerden hangilerini varsayılan olarak aldığımızı göstermek için bu servis kullanılacak.
    [{'urunId': 1, 'UrunAdi': 'Ürün adı', 'AHP': 24.3, 'AHPSira': 2, 'default': true}]
"""

class TedarikciUrunleriModel:
    def __init__(self, urunId,UrunAdi,AHP,AHPSira,default):
        self.urunId: int = urunId
        self.UrunAdi: str = UrunAdi
        self.AHP: float = AHP
        self.AHPSira: float = AHPSira
        self.default: bool = default
