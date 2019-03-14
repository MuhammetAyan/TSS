from Data.DBConnect import select
from Data.DBModels import dbKullanicilarModel


def FindLogin(username: str, password: str)->dbKullanicilarModel:
    """
    Verilen kullanıcı adı ve şifreye sahip veritabanında hesabın olup olmadığını kontrol eder.
    :param username: Kullanıcı adı
    :param password: Şifre
    :return:
    """
    users: list[dbKullanicilarModel] = select("select * from Kullanicilar where KullaniciAdi = '{}' and Sifre = '{}'".format(username, password))
    for user in users:
        print("Kullanicilar:", user)
    if len(users) == 1:
        return users[0]
    else:
        return None

