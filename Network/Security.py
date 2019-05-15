from .bottle import abort, request, response
import secrets
from threading import Thread, Event
from Test import TEST

__UsersVaribles__ = []


class Rol:
    def __init__(self, name: str = ""):
        if name == "":
            self.roles = []
        else:
            self.roles: list = [name]

    def __add__(self, other):
        R = Rol()
        R.roles = self.roles + list(other.roles)
        return R


class Roller:
    Admin: Rol = Rol("admin")
    User: Rol = Rol("user")
    Misafir: Rol = Rol("misafir")
    TumHesaplar: Rol = Admin + User
    Tumu: Rol = Admin + User + Misafir


def IsAllow(req: request, role: Rol):
    """
    Kullanıcı, belirtilen rol seviyelerinden birine sahipse true döner.
    :param req: Kullanıcı isteği
    :param role: Kullanıcı rolü
    :return:
    """
    key = req.get_header("auth", "")
    TEST("gelen auth key: '{}'".format(key))
    if key == "":
        if role.roles.__contains__(Roller.Misafir.roles[0]):
            TEST("misafir yetkisi verildi")
            return True
        UnauthorizedError()
        return False
    for user in __UsersVaribles__:
        if user.key == key:
            user.refreshTime()  # User için süreyi uzat
            TEST(role.roles, user.rol.roles[0])
            if role.roles.__contains__(user.rol.roles[0]):
                TEST("'{}' yetkisi verildi.".format(user.rol.roles[0]))
                return True
            else:
                return False
    abort(403, "Bağlantınız zaman aşımına uğramış!")
    return False


def UserError(message=""):
    """
    Kullanıcıdan kaynaklanan ve assert komudu ile yakalanan hataların mesajını döndürür.
    :param message: Hata mesajı
    :return:
    """
    abort(400, message)
    response.json({'message': message})


def FailedError(message="İşlem gerçekleştirilemedi!"):
    """
    Exception hatalarında kullanıcıya 500 hata mesajı döndürür.
    :param message: Hata mesajı. Varsayılan mesaj: "İşlem gerçekleştirilemedi!"
    :return:
    """
    abort(500, message)
    response.json({'message': message})


def UnauthorizedError(message="Yetkisiz erişim!"):
    """
    IsAllow çağrısı sonucunda kullanıcı yetkiye sahip değilse hata fırlatmak için bu metodu çağırabilirsiniz.
    :param message: Hata mesajı default:"Yetkisiz erişim!"
    :return:
    """
    abort(401, message)
    response.json({'message': message})


def KeyGenerator():
    return secrets.token_urlsafe()


class UsersVarible:
    def __init__(self, username: str, key: str, rol: Rol):
        self.username = username
        self.key = key
        self.rol = rol
        self.time = 60 * 15
        __UsersVaribles__.append(self)

    def delete(self):
        __UsersVaribles__.remove(self)
        del self

    def refreshTime(self):
        """
        Kullanıcının açık kalma süresini yeniden hesaplar.
        :return:
        """
        self.time = 60 * 15


def DeleteUser(key):
    for user in __UsersVaribles__:
        if user.key == key:
            user.delete()
            break


class Timer(Thread):
    def __init__(self, event):
        Thread.__init__(self)
        self.stopped = event

    def run(self):
        while not self.stopped.wait(1):
            for user in __UsersVaribles__:
                user.time -= 1
                if user.time <= 0:
                    TEST("Kullanıcı çıkarıldı: ", user.username)
                    user.delete()


stopFlag = Event()
thread = Timer(stopFlag)
thread.start()
# stopFlag.set()
