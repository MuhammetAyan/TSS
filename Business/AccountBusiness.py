from Data.DBConnect import select
from Data.DBModels import dbKullanicilarModel


def LoginControl(username: str, password: str):
    """
    Verilen kullanıcı adı ve şifreye sahip veritabanında hesabın olup olmadığını kontrol eder.
    :param username: Kullanıcı adı
    :param password: Şifre
    :return:
    """
    users: list[dbKullanicilarModel] = select("select * from Kullanicilar where KullaniciAdi = '{}' and Sifre = '{}'".format(username, password))
    for user in users:
        print("Kullanicilar:", user)
    return len(users) == 1

