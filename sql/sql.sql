-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        8.0.12 - MySQL Community Server - GPL
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- 导出 test 的数据库结构
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test`;

-- 导出  表 test.authors 结构
CREATE TABLE IF NOT EXISTS `authors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `books` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `search` varchar(6550) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `books` (`books`) USING BTREE,
  KEY `price` (`price`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- 正在导出表  test.authors 的数据：~20 rows (大约)
DELETE FROM `authors`;
INSERT INTO `authors` (`id`, `name`, `books`, `price`, `search`) VALUES
	(1, 'aBDKmewwxWO9G3Sm7wN1DA==', 'W7PLmLwRlQaxLN6V8nccPw==', 'vSESOe0bvpTxM0S4x5VsnQ==', 'JUKwlaJI6YoglYEnkWHtJQ==,pWDhIYaip4OoUwcmjMubgA==,'),
	(2, '99nixh3cckNIVYaOKY2+1w==', 'hWDaRriDH2sbZ9lYy3vz9w==', 'btKHW+FV9APLkq7Zt46zmQ==', 'qU/C86uLnEC1HrTJCkzN8A==,91lR9BYN0LuVLZ6wPrjXIw==,F+dvrgaK9T7jaO3XYJQqeg==,PPgZm+Cz4npqgMImboF6NQ==,sFAav5yXMwviYFt7JjbWeQ==,'),
	(3, '5i9541buWedb7pWAkbz8/A==', 't1dIGdAKi4BrJ4VYp8P19g==', 'Wo05jucBfQmWkvPWk92t+g==', 'pWDhIYaip4OoUwcmjMubgA==,ndtSVPB8t9PmtBttgUpGxw==,hTTrhtVxgyaGbEm9ZvsN8A==,i8wvhI3gsHP9KSvvTZj9og==,'),
	(4, 'vDguPvXbCFA665kb5GpDlA==', 'AdALNvdwnKv0AeAk2KGuDw==', 'LFd/iY3lbbKnD+A27UNuYQ==', 'Z5KWKQSfw0goF0P2mvKfqg==,p1yxkaRXRvgMgbIBcjUVmg==,IYXxmYIEhdtdRUujtH9EeA==,iEWnsGjohuGUkGqThRuLXQ==,'),
	(5, 'TmUyTXYkFesikO8MlkbX+g==', 'vXrWv8yrBo/ZfOBxMz22fg==', '79t/xjq+OFdrrUqxNciE0g==', 'krWBMYEm+FRF3itjdrirmQ==,Pyuw5Ig78Qc989sfI8slLw==,mDTlPn7EMQtpab7RB+nTMg==,'),
	(6, 'cHiJTcgf+L6W4Uxfscyzrw==', 'yw2rKZe1oOggXzUu8UZ81g==', 'dPUJd6opeL6G1RNjp34qUA==', 'GeNz14BwaD4U4aKnwvq7pQ==,dU2hviyjaCOj0LdY7W8ExQ==,lVBzBLqAQIOAUbaZgK9Cag==,'),
	(7, 'eSji87yyS/oDZkELlpIoMg==', 'xVOQkXokI+roVJ4AZAdPnA==', 'BB7h/xf1o7laN4y0nMMSbg==', '0wlt+2LvQ+DXI75BWfV+rg==,pfznB+t+Np0NX/+hCct2yQ==,NQAr3rrXlEnYFfsTt4qM6Q==,Je0CbBpFDeRbUCwDAyd5VQ==,kxA3Wjkqp4TR5e+uTxtXAg==,JLvBHWpm6pEgv4onk5LD4w==,Pyuw5Ig78Qc989sfI8slLw==,'),
	(8, 'wH6hxG5MWlsqJuEkDri4iA==', 'xVOQkXokI+roVJ4AZAdPnA==', 'sPZP3G+cO0dwjrwFJFKuwA==', '0wlt+2LvQ+DXI75BWfV+rg==,pfznB+t+Np0NX/+hCct2yQ==,NQAr3rrXlEnYFfsTt4qM6Q==,Je0CbBpFDeRbUCwDAyd5VQ==,kxA3Wjkqp4TR5e+uTxtXAg==,JLvBHWpm6pEgv4onk5LD4w==,Pyuw5Ig78Qc989sfI8slLw==,'),
	(9, 'gqOuS7cEDvYalJQ+r6UkoQ==', '8Up9+tWPQEn1dx27HbeoMFdQg/ZzP9s8Qx5aryO4GQY=', 'M2/j2Grg1IQSKWEjzczVsA==', '0wlt+2LvQ+DXI75BWfV+rg==,pfznB+t+Np0NX/+hCct2yQ==,NQAr3rrXlEnYFfsTt4qM6Q==,Je0CbBpFDeRbUCwDAyd5VQ==,kxA3Wjkqp4TR5e+uTxtXAg==,jT05unZjRowOKIA9lRN+oA==,c6NTvdbRw2mTp08W6m4qdg==,Q7YpDTpruB+i2ICL8YI7Ww==,'),
	(10, 'lSZabnwrLI46qY8fJPVuow==', 'V4c4vKrYPd78XEBtOGHE/A==', 'mAKLdZM6cu3+X1ZaoJMm+A==', '0wlt+2LvQ+DXI75BWfV+rg==,pfznB+t+Np0NX/+hCct2yQ==,NQAr3rrXlEnYFfsTt4qM6Q==,Je0CbBpFDeRbUCwDAyd5VQ==,kxA3Wjkqp4TR5e+uTxtXAg==,JUKwlaJI6YoglYEnkWHtJQ==,pWDhIYaip4OoUwcmjMubgA==,'),
	(11, 'aBDKmewwxWO9G3Sm7wN1DA==', '/4pr+Vw8lf6IXjbw6loC7w==', 'vSESOe0bvpTxM0S4x5VsnQ==', 'jT05unZjRowOKIA9lRN+oA==,c6NTvdbRw2mTp08W6m4qdg==,Q7YpDTpruB+i2ICL8YI7Ww==,0wlt+2LvQ+DXI75BWfV+rg==,'),
	(12, 'C86qaoDFIl3xpEhJUv06IA==', 'DR7Sqexgq+TcnxeuWuevjQkgPrzh7QXIe7aOf/WmAdA=', 'RNuNKcpZl7DTzQ5tzYASUg==', '0wlt+2LvQ+DXI75BWfV+rg==,6CYH0hWLkX7BY2WdF0+ouQ==,NQAr3rrXlEnYFfsTt4qM6Q==,Je0CbBpFDeRbUCwDAyd5VQ==,kxA3Wjkqp4TR5e+uTxtXAg==,jT05unZjRowOKIA9lRN+oA==,c6NTvdbRw2mTp08W6m4qdg==,Q7YpDTpruB+i2ICL8YI7Ww==,'),
	(13, 'NuyLluVZTo6LukIwV54ILw==', 'NsNYdZERzsxB1n4Ayi8ayQ==', 'uXjRg6zK6sdi9AYKPA+mAA==', '/nsjAbdyG8Fj1RtSiaYUpA==,c6NTvdbRw2mTp08W6m4qdg==,27hehwQgnUZjI5j+0V2HDg==,5UswfA5w28KUcZtbYM2dUQ==,'),
	(14, 'UyOfxNQhyvSBPZPriW3B1g==', 'JFkvSfn+N02vfHsJPTsvI21prbu1TYyzGpfwXeaqMOE=', 'KygbYANZJfDAJrVU1bNcpA==', 'CcY69lfYCUs8Ru9QYWA+AQ==,SxAoGUcVK6phC9xX3Z6axw==,RPaqZ9qFG9SWHrpHxuEQMw==,Vf+9nxmbxYzFkuxf1gotaQ==,2LP3+VhIEbunPqrKSWgwGQ==,QrxyMd49ahSx/+rSYV5sCw==,otNZMcadgjAl6PDJdhV4xw==,QrxyMd49ahSx/+rSYV5sCw==,'),
	(15, 'ACiR+veVnzyKJWKJB3G+EA==', '+X2PoAn2N6WAIqQgX0VKnndJODdAmlg6uQq07742E/4=', 'IGMeBUPqLHvLMqS0n/CZXQ==', 'wHwrRx2JBM5zLxf5YKW7rQ==,j7q2TPzbY2WUQPGpYA9bDA==,Pyuw5Ig78Qc989sfI8slLw==,mDTlPn7EMQtpab7RB+nTMg==,ey0flADujA+QdrVG3+P9lg==,gLyYzEGjoE/i6JUpzfB8tQ==,DOtnf8C6aqT4OvBGndWQgQ==,Ho6mHfVib/wYfyW8P1ENtA==,'),
	(16, 'BkjtO+qytQPXWao0UoqjGw==', 'sEbD+5WhKUhtE4dyWobXF50S0raoiuhGcbn0IhHa0HSAMN9UgM69E3DskYUSZwgm', '6CYH0hWLkX7BY2WdF0+ouQ==', 'W+ax3d0BUetRO//pTvULsg==,DWoBb6e+TyD6vAbERFi5jw==,hDaRcHx26ch7reJXy6ijTA==,pCZWcQV6P1fQw6P4PVMscA==,j7q2TPzbY2WUQPGpYA9bDA==,PVIfRaIG9lX1pza52ftwpg==,wACb4LNRahZ/pS3YvsnseQ==,xmRnHNQYEbcSfGP3HUwsPQ==,hDaRcHx26ch7reJXy6ijTA==,/qAblmBDGz26S43oYr4MMA==,j7q2TPzbY2WUQPGpYA9bDA==,DWoBb6e+TyD6vAbERFi5jw==,Qn5uo032f7ZuBZ58soxeMQ==,hDaRcHx26ch7reJXy6ijTA==,j7q2TPzbY2WUQPGpYA9bDA==,Qn5uo032f7ZuBZ58soxeMQ==,sEHzR/F0MCqmvPRlwAA9DQ==,j7q2TPzbY2WUQPGpYA9bDA==,PVIfRaIG9lX1pza52ftwpg==,w30XZrrGkvYTZOsZgcR29A==,pCZWcQV6P1fQw6P4PVMscA==,DWoBb6e+TyD6vAbERFi5jw==,Qn5uo032f7ZuBZ58soxeMQ==,krWBMYEm+FRF3itjdrirmQ==,pCZWcQV6P1fQw6P4PVMscA==,gWS9TrP0FWMVzjL7T5OgUQ==,81aLWhM5Qk5pAM5YAxGUcQ==,hDaRcHx26ch7reJXy6ijTA==,j7q2TPzbY2WUQPGpYA9bDA==,3ezmu2d8eU/grCGMAlas9Q==,pCZWcQV6P1fQw6P4PVMscA==,QrxyMd49ahSx/+rSYV5sCw==,81aLWhM5Qk5pAM5YAxGUcQ==,4FKEOUgUnzjsVjli8SFCoA==,gWS9TrP0FWMVzjL7T5OgUQ==,'),
	(17, 'f4hVcjktGVPTgj7N6Ye9Bg==', 'pSAyopA32+0xO2D35bOoDP7C6qh2qWvLw3/Ql6oKlp4=', 'rNpF0IB23Zr2E9YXryhKEA==', 'RP1lcfM+XIqJs3tz2fjSCg==,BpqC5bHNFDEqTnYNv64gcA==,3Xvl/TYN1pbIoRxGCdCbOg==,DlU2LJHDTplOUed2JQLfHA==,3rsAfLGFIPD6GZUvYEaEtQ==,G7RxoxcdJr3kOChWUt1bTA==,'),
	(18, 'ldqjpNHphGRIc/kKwOmotA==', 'fAbyPbSUvYN2EkjqOYPUFvciVAqW3U/wPGRjHLOubHc=', 'eJixN8JhPJIuJW//bHhV8Q==', 'Vbd5IRXIkQjeKJ2alIBrzA==,gWS9TrP0FWMVzjL7T5OgUQ==,hDaRcHx26ch7reJXy6ijTA==,4FKEOUgUnzjsVjli8SFCoA==,j7q2TPzbY2WUQPGpYA9bDA==,DWoBb6e+TyD6vAbERFi5jw==,ey0flADujA+QdrVG3+P9lg==,gLyYzEGjoE/i6JUpzfB8tQ==,jZwwQAa1krJL593pdRGGhg==,w/2/OnBB84nCAmmU2zbD5Q==,/aSzz/R2FAVV+XgBiFg0kQ==,3gSgS/fp7NwyYlsojAZoEw==,c3pfiuI6S2GDmPK6qDT4kg==,JUKwlaJI6YoglYEnkWHtJQ==,'),
	(19, 'j8AZUilLprgB/PkyX6Ro8w==', 'sC1du7EUw3pKXbNHwOiRSu707iVbTfC3mbIsxtC2vHHN9209qekxW8cJXwpV/J8C', 'yox4CBOZdvKoUs71GI4ANA==', '28dP2cTbEmeVKmgylP8eLQ==,/qAblmBDGz26S43oYr4MMA==,DWoBb6e+TyD6vAbERFi5jw==,PVIfRaIG9lX1pza52ftwpg==,j7q2TPzbY2WUQPGpYA9bDA==,M/vFsoZIqzJjMbLVgLIKGQ==,2ZHTI7ZXomwMaRTL7YqFVw==,RP1lcfM+XIqJs3tz2fjSCg==,BpqC5bHNFDEqTnYNv64gcA==,3Xvl/TYN1pbIoRxGCdCbOg==,DlU2LJHDTplOUed2JQLfHA==,05eQJMV20hOANaTF5HItxw==,PPgZm+Cz4npqgMImboF6NQ==,sFAav5yXMwviYFt7JjbWeQ==,N3WHMwKf+DaEldG+VSSIiA==,3s2e1+TbatgipmdvthII8A==,'),
	(20, '2I6wtzsRApSW48knlWhSNQ==', '55Fuuk5+X9whYSt6g+EvYsuEFasJ4kZ+3IXQLUz/6LTx4kJpuQqnqgEskgMH8W8F', 'EMx+8auKO+V2fD2lyjElbA==', 'Z5KWKQSfw0goF0P2mvKfqg==,p1yxkaRXRvgMgbIBcjUVmg==,IYXxmYIEhdtdRUujtH9EeA==,iEWnsGjohuGUkGqThRuLXQ==,O2uwk54GeTrcq+gr+A65mg==,xXHq0cTK9qGkXO9RJoGN/w==,hMGHZelkTKnsGacg9UrE4Q==,wi39a+6C+nzcgnGQIabKiw==,VSyGgFKgqT7DYV06kypoVQ==,JvffN/3E2mxzDYq5n+upvg==,97Lby2WGiqxaEMFlSsoWhQ==,pfznB+t+Np0NX/+hCct2yQ==,Pu+61X/6zDBJ8OZMywqKSA==,jhFpyu/E/aIkBisPfQKeZg==,');

-- 导出  表 test.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `prikey` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  test.user 的数据：~1 rows (大约)
DELETE FROM `user`;
INSERT INTO `user` (`id`, `user`, `pwd`, `prikey`) VALUES
	(1, 'admin', 'admin', 'b\'YWRtaW4=\'');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
