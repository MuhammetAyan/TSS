from Network.bottle import route, static_file, post, request, get, response, redirect
import json
from Test import TEST
from Data.DBConnect import DB

TEST("testController")
"""
Bu dosya test dosyasıdır. Gerçek projeye dahil değildir.
"""


@route('/')
def index():
    redirect("/test/index.html")


@route('/test/')
@route('/test/<filename>')
def test(filename="index.html"):
    TEST("filename", filename)
    return static_file(filename, root="./Test/")


@post('/saveservices')
def save():
    TEST("save")
    fs = open("./Data/WebServices.json", mode="w", encoding="UTF-8")
    data = {'services': request.json.get('services')}
    fs.write(json.dumps(data))
    fs.close()


@get('/loadservices')
def load():
    TEST('load')
    fs = open("./Data/WebServices.json", mode="r", encoding="UTF-8")
    data = fs.read()
    fs.close()
    response.set_header("Content-Type", "application/json")
    TEST(json.loads(data, encoding="UTF-8"))
    return json.loads(str(data), encoding="UTF-8")


@post('/query')
def query():
    TEST("query")
    q = request.json.get('query')
    if str(q).strip().lower().startswith("select"):
        data: list[tuple] = DB.select(q, True)
        for i in range(len(data)):
            data[i] = list(data[i])
        return json.dumps(data)
    else:
        DB.query(q)



@route("/tablelist")
def tablelist():
    TEST("tablelist")
    tablesdata = []
    tables = DB.select("select name, object_id from sys.tables WHERE type = 'U'", IsFree=True)
    for table in tables:
        tab = {'name': table[0], 'cols': []}
        columns = DB.select("select name, /*max_length,*/ (select name from sys.types WHERE user_type_id = sys.all_columns.user_type_id)userType from sys.all_columns WHERE object_id=" + str(table[1]), IsFree=True)
        for col in columns:
            tab["cols"].append(col[0])
        tablesdata.append(tab)
    TEST(tablesdata)
    return json.dumps(tablesdata)
