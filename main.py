from Controllers.accountController import *
from Controllers.appController import *
from Controllers.urunSorguController import *
from Controllers.testController import *
from Controllers.GrupStratejiController import *
from Controllers.TedarikciSorguController import *
from Network.runserver import runserver
from socket import gethostbyname, gethostname


runserver(gethostbyname(gethostname()), 8080)
