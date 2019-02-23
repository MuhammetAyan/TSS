from Network.bottle import request
from Data.DBConnect import select
from Data.DBModels import dbKullanicilarModel


ErrorText = {
    '500': 'Erişim yetkiniz yok!',
}


class Rol:
    def __init__(self, name: str = ""):
        if name == "":
            self.roles = []
        else:
            self.roles: list = [name]

    def __add__(self, other):
        R = Rol()
        R.roles = self.roles
        R.roles.__add__(other.roles)
        R.roles = list(set(R.roles))
        return R


class Roller:
    Admin: Rol = Rol("admin")
    User: Rol = Rol("user")
    Misafir: Rol = Rol()
    TumHesaplar: Rol = Admin + User
    Tumu: Rol = Admin + User + Misafir


def IsAllow(req: request, role: Rol):
    """
    Kullanıcı, belirtilen rol seviyelerinden birine sahipse true döner.
    :param req: Kullanıcı isteği
    :param role: Kullanıcı rolü
    :return:
    """
    username = req.get_cookie("account", secret='some-secret-key')
    users: list[dbKullanicilarModel] = select("select * from Kullanicilar where KullaniciAdi='{}'".format(username))
    if len(users) == 1:
        if role.roles.__contains__(users[0].Rol):
            return True
    return False
