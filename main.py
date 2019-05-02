from Controllers.accountController import *
from Controllers.appController import *
from Controllers.urunSorguController import *
from Controllers.testController import *
from Controllers.GrupStratejiController import *
from Controllers.TedarikciSorguController import *

from Network.bottle import run

from socket import gethostbyname, gethostname

run(host=gethostbyname(gethostname()), port=8080, debug=False)
