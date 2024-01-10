import ctypes
import json
import random
import subprocess
from functools import partial


subprocess.Popen = partial(subprocess.Popen, encoding='utf-8')

import execjs
import pymysql as mysql

from aes_utils import AEScryptor
from Crypto.Cipher import AES

# 配置数据库用户名 密码 数据库名
con = mysql.connect(user='root', password='root', db="test")
# 开启数据库事务的自动提交功能
con.autocommit(True)
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

def userlist():
    sql = "select * from authors limit 19"
    cur = con.cursor()
    # 执行通过函数传入的sql语句
    cur.execute(sql)
    # 获取所有的数据库将参数赋给data
    data = cur.fetchall()
    # 后端解密
    print(data)
    de_data = []
    for i in data:
        # author = ctypes.cast(aes_decrypt(i[1]), ctypes.py_object).value
        author = aes_decrypt(i[1])
        # print(author)
        name = aes_decrypt(i[2])
        # print(name)
        price = aes_decrypt(i[3])
        print(price)
        de_data.append([i[0], author, name, price])
    return de_data
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

def submit_data(id, name, books, price):
    search = ''
    for i in books:
        aa = aes_encrypt(i)
        search = search + aa + ','

    cur = con.cursor()
    # 数据库插入语句
    sql = 'insert  authors values(%s,%s,%s,%s,%s)'
    # 传入语句与需要插入的值
    cur.execute(sql, [id, str(aes_encrypt(name)), str(aes_encrypt(books)), str(aes_encrypt(price)), search])
    # 提交该事务
    con.commit()

# submit_data(1, "刘子涵", "高数", str(random.randint(1, 100)))
userlist()

# with open("static/js/sjcl.js", 'r', encoding='UTF-8') as file:
#     sjcljs = file.read()
#
#
# def js_encrypt(plaintext):
#     # 编译加载js字符串
#     context1 = execjs.compile(sjcljs)
#     # plaintext = 'hello world'
#     key = '1234567890123456'
#     encrypt_text = context1.call("sjcl.encrypt", key, plaintext)
#
#     return encrypt_text
#
#
# def js_decrypt(plaintext):
#     # 编译加载js字符串
#     context1 = execjs.compile(sjcljs)
#     # plaintext = '{"iv":"dBzm+rNQHzc7tT0VoaCYkQ","v":1,"iter":1000,"ks":128,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"hBg6mRogsuU","ct":"KmUG87f+G7v9Zs+BzG//3asFxA"}'
#     key = '1234567890123456'
#     decrypt_text = context1.call("sjcl.decrypt", key, plaintext)
#     print(decrypt_text)
#     return decrypt_text
#
# print(js_encrypt('nudbcudihcfiusgfki'))
# name = '{"iv":"bKUQRV5O7a1+lPXE5VFv2A","v":1,"iter":1000,"ks":128,"ts":64,"mode":"ccm","adata":"","cipher":"aes","salt":"IbTOTnkUCXo","ct":"DT06kDWooJ0NQXc5r7S8uTE"}'
# js_decrypt(name)
