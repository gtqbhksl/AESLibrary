# 基于AES加密的图书管理系统
Library management system based on AES encryption

这是一个基于AES加密的图书管理系统

数据在服务器端加密存储，能够实现不解密的 SQL 查询

数据的加解密操作：分别能够在浏览器端和在服务器端完成

数据库中加密存储信息
![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/e0b4f914-c13a-4c4e-812a-9f91a3d420bd)

客户端正常显示
![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/0fdc64b3-fe88-4c80-a8ed-150b9fa8e06f)

# 功能

该系统主要有以下功能：
- 用户登录：判断用户密码的哈希值是否与数据库中的相同
- 首页：默认显示5条数据库内的数据
- 添加图书：前端将要添加的图书进行加密发送到后端，后端解密后，先判断图书id是否已经存在，不存在则后端进行加密存储，若已存在则返回id存在信息。存储时为了后续方便查找，需要将name字段进行逐字加密存储在另外一列。
- 查询图书（按照id）：将id发送到后端，后端构造数据库查询语句，可以实现等值查询和批量查询。
- 查询图书（按照书名）：将要查询的书名，发送到后端，后端对其进行逐字加密，在search字段内进行模糊匹配，如果有通配符，则需要将通配符替换为%进行模糊查询。该方法可实现模糊查询和通配符查询。
- 图书详情：通过查询出来的结果，可以进入图书详情页。可以对图书信息进行编辑和删除。


# 使用方法
安装依赖pip install -r requirements.txt

然后运行app.py即可
用户名密码 admin/admin
![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/8d5b2027-b425-45f7-8876-a4680b2661a9)
![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/30d5e5dc-9042-4fed-9166-4628f00b7d8f)
![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/edf2248a-af9d-4b4d-b46b-088a848ee2ca)

# 系统结构草图

![image](https://github.com/gtqbhksl/AESLibrary/assets/113713406/591dc384-1779-449f-9832-1bb23bc78f64)

# 数据传输流程

