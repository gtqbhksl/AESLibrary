import base64
import json

import pymysql
import pymysql as mysql
from Crypto.Cipher import AES
from flask import Flask, render_template, request, redirect, session
from flask_login import LoginManager
import subprocess
from functools import partial
subprocess.Popen = partial(subprocess.Popen, encoding='utf-8')

import execjs
from aes_utils import AEScryptor

# 配置数据库用户名 密码 数据库名
con = mysql.connect(host='localhost', port=3306,user='root', password='root', db="test")
# 开启数据库事务的自动提交功能
con.autocommit(True)
# 获取数据库的游标
# cur = con.cursor()

with open("static/js/sjcl.js", 'r', encoding='UTF-8') as file:
    sjcljs = file.read()


def js_encrypt(plaintext):
    # 编译加载js字符串
    context1 = execjs.compile(sjcljs)
    # plaintext = 'hello world'
    key = '1234567890123456'
    encrypt_text = context1.call("sjcl.encrypt", key, plaintext)

    return encrypt_text


def js_decrypt(plaintext):
    # 编译加载js字符串
    context1 = execjs.compile(sjcljs)
    # plaintext = '{"iv":"dBzm+rNQHzc7tT0VoaCYkQ","v":1,"iter":1000,"ks":128,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"hBg6mRogsuU","ct":"KmUG87f+G7v9Zs+BzG//3asFxA"}'
    key = '1234567890123456'
    decrypt_text = context1.call("sjcl.decrypt", key, plaintext)
    return decrypt_text


def aes_encrypt(text):
    # 加密后的字符串
    encrypt_text = ""
    # 加密的秘钥
    key = b"1234567890123456"
    iv = b"0000000000000000"
    aes = AEScryptor(key, AES.MODE_CBC, iv, paddingMode="ZeroPadding", characterSet='utf-8')
    rData = aes.encryptFromString(text)
    # 返回加密后的字符串
    return rData.toBase64()


def aes_decrypt(text):
    # 加密后的字符串
    encrypt_text = ""
    # 加密的秘钥
    key = b"1234567890123456"
    iv = b"0000000000000000"
    aes = AEScryptor(key, AES.MODE_CBC, iv, paddingMode="ZeroPadding", characterSet='utf-8')
    rData = aes.decryptFromBase64(text)
    # print("明文：", rData)
    # 返回加密后的字符串
    return rData


# 主函数
def user_loader(user_id):
    # 根据用户ID加载用户模型并返回
    pass


def request_loader(request):
    # 根据请求模型加载用户模型并返回
    pass


app = Flask(__name__)
app.config['SECRET_KEY'] = 'your-secret-key'
login_manager = LoginManager()
login_manager.init_app(app)
login_manager.user_loader(user_loader)
login_manager.request_loader(request_loader)


# 配置数据库名 账号 密码  端口号 数据库库名
def getdata(sql):
    connect = pymysql.connect(
        host="localhost",
        user="root",
        password="root",
        port=3306,
        database="test"
    )
    # 获取游标
    cursor = connect.cursor()
    # 执行通过函数传入的sql语句
    cursor.execute(sql)
    # 获取所有的数据库将参数赋给result
    result = cursor.fetchall()
    # 返回result参数
    return result


# 设置网址的路由
@app.route('/index')
def hello_world():
    # 执行userlist函数将返回值赋给data
    data = userlist()
    # 使用render_template渲染index.html并传入数据data到前端
    return render_template("index.html", data=data)


# 设置网址的路由
@app.route('/', methods=["post", "get"])
def login():
    if request.method == "POST":
        user = request.form.get('user')
        password = request.form.get('password')
        sql = 'select * from user where user ="{}" AND pwd="{}"'.format(user, password)
        cur = con.cursor()
        b = cur.execute(sql)
        if b == 1:
            # Create a session
            session['username'] = user
            session['key'] = base64.b64encode(user.encode("utf-8"))
            session['logged_in'] = True
            sql = 'update user set prikey="{}" where user="{}"'.format(session['key'], user)
            b = cur.execute(sql)
            return redirect('/index')
        else:
            return render_template("login.html", data=0)
    else:
        return render_template("login.html", data=1)


# 定义一个函数 使用sql语句查询anthors表的所有数据
def userlist():
    sql = "select * from authors limit 5"
    cur = con.cursor()
    # 执行通过函数传入的sql语句
    cur.execute(sql)
    # 获取所有的数据库将参数赋给data
    data = cur.fetchall()
    # 后端解密
    de_data = []
    for i in data:
        author = aes_decrypt(i[1])
        name = aes_decrypt(i[2])
        price = aes_decrypt(i[3])
        de_data.append([i[0], author, name, price])
    # 前端加密
    js_encrypt_data = []
    for j in de_data:
        author_js = js_encrypt(str(j[1]))
        name_js = js_encrypt(str(j[2]))
        price_js = js_encrypt(str(j[3]))
        js_encrypt_data.append([j[0], str(author_js), str(name_js), str(price_js)])
    return js_encrypt_data


# 设置路由为/add 使用的请求方式是post
@app.route('/add', methods=["post", "get"])
def add():
    if request.method == "POST":
        # 获取前端表单里key来获取value值
        id = request.form.get('id')
        name = request.form.get('name')
        books = request.form.get('books')
        price = request.form.get('price')
        # 数据库命令根据id来查询此id是否已经存在
        s = 'select * from authors where id=' + id
        cur = con.cursor()
        a = cur.execute(s)
        # 如果存在
        if a > 0:
            return "编号已存在"
        # 否则
        else:
            # 前端解密
            name = js_decrypt(str(name))
            books = js_decrypt(str(books))
            price = js_decrypt(str(price))
            search = ''
            for i in books:
                aa = aes_encrypt(i)
                search = search + aa + ','

            # 数据库插入语句
            sql = 'insert  authors values(%s,%s,%s,%s,%s)'
            # 传入语句与需要插入的值
            cur.execute(sql, [id, str(aes_encrypt(name)), str(aes_encrypt(books)), str(aes_encrypt(price)), search])
            # 提交该事务
            con.commit()
            # 重定向路由为
            return redirect('/index')


# 根据id进行删除
@app.route('/dele', methods=["post", "get"])
def dele():
    # 从前端表单中获取id的值
    id = request.args.get("id")
    # 执行sql命令，根据id删除内容
    sql = "delete from authors where id=" + id
    cur = con.cursor()
    cur.execute(sql)
    con.commit()
    return redirect('/index')


# 根据id进行查找
@app.route('/sele', methods=["post", "get"])
def sele():
    id = request.form.get("sele")
    sql = 'select * from authors where id in ({})'.format(id)
    cur = con.cursor()
    b = cur.execute(sql)
    sdata = cur.fetchall()
    # 后端解密，赋给de_data
    de_data = []
    for i in sdata:
        author = aes_decrypt(i[1])
        name = aes_decrypt(i[2])
        price = aes_decrypt(i[3])
        de_data.append([i[0], str(author), str(name), str(price)])

    if b > 0:
        # 前端加密
        js_encrypt_data = []
        for i in de_data:
            author = js_encrypt(i[1])
            name = js_encrypt(i[2])
            price = js_encrypt(i[3])
            js_encrypt_data.append([i[0], str(author), str(name), str(price)])
        return render_template("select.html", sdata=js_encrypt_data)
    else:
        return render_template("select.html", d=0)


# 根据名称进行查找
@app.route('/sele1', methods=["post", "get"])
def sele1():
    name = request.form.get("name")
    # 加密搜索，对要搜索的每个字进行加密拼接
    # if '?' in name:
    #     name = name.replace('?', '')
    nameaes = ''

    for i in name:
        if i =='*':
            # *查询
            nameaes = nameaes + '%'
        else:
            aa = aes_encrypt(i)
            nameaes = nameaes + aa + ','
    sql = 'select * from authors where search like "%{}%"'.format(nameaes)
    cur = con.cursor()
    b = cur.execute(sql)
    sdata = cur.fetchall()
    # 后端解密，赋给de_data
    de_data = []
    for i in sdata:
        author = aes_decrypt(i[1])
        name = aes_decrypt(i[2])
        price = aes_decrypt(i[3])
        de_data.append([i[0], str(author), str(name), str(price)])

    if b > 0:
        # 前端加密
        js_encrypt_data = []
        for i in de_data:
            author = js_encrypt(i[1])
            name = js_encrypt(i[2])
            price = js_encrypt(i[3])
            js_encrypt_data.append([i[0], str(author), str(name), str(price)])
        print(js_encrypt_data)

        return render_template("select.html", sdata=js_encrypt_data)
    else:
        return render_template("select.html", d=0)


# 根据id进行修改
@app.route('/updata', methods=['GET', 'POST'])
def updata():
    id = request.args.get('id')
    sql = "select * from authors where id = %s" % id
    cur = con.cursor()
    b = cur.execute(sql)
    # 获取所有的数据库将参数赋给result
    sdata = cur.fetchall()
    # 后端解密，赋给de_data
    de_data = []
    for i in sdata:
        author = aes_decrypt(i[1])
        name = aes_decrypt(i[2])
        price = aes_decrypt(i[3])
        de_data.append([i[0], str(author), str(name), str(price)])

    if b > 0:
        # 前端加密
        js_encrypt_data = []
        for i in de_data:
            author = js_encrypt(i[1])
            name = js_encrypt(i[2])
            price = js_encrypt(i[3])
            js_encrypt_data.append([i[0], str(author), str(name), str(price)])
        return render_template('updata.html', data=js_encrypt_data[0])


@app.route('/update', methods=['POST'])
def update():
    id = request.form.get('id')
    name = request.form.get('name')
    books = request.form.get('books')
    price = request.form.get('price')
    search = ''
    for i in books:
        aa = aes_encrypt(i)
        search = search + aa + ','
    sql = 'update authors set name="{}",books="{}",price="{}",search="{}" where id="{}"'.format(str(aes_encrypt(name)),
                                                                                                str(aes_encrypt(books)),
                                                                                                str(aes_encrypt(price)),
                                                                                                search, id)
    cur = con.cursor()
    cur.execute(sql)
    # con.commit()
    return redirect('/index')


# Example logout route
@app.route('/logout')
def logout():
    # Remove session data
    session.clear()

    # Redirect to login page
    return redirect('/')


# 主函数执行
if __name__ == '__main__':
    # 主动开启debug便于调试
    app.run(debug=True)
