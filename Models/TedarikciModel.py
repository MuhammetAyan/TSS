
"""
(response'da 'defNo' ile bahsedilen bu tedarikçiden kaç tane ürün varsayılan olarak alınıyor.)
     [{'id':0, 'tedarikci':'tedarikçi Adı', 'defNo': 1}]
"""
class TedarikciModel(object):
    def __init__(self, id,tedarikci,defNo):
        self.id: int = id
        self.tedarikci: str = tedarikci
        self.defNo: int = defNo
