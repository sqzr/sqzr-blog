/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : 127.0.0.1:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2014-11-18 14:06:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text,
  `allowcomment` int(11) DEFAULT '1',
  `commentsnum` int(11) DEFAULT '0',
  `date` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`c_id`),
  KEY `id` (`id`),
  KEY `c_id` (`c_id`),
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '1', 'nginx 反向代理谷歌', '已经有不少人做了类似的站点,大部分都没处理好几个问题..比如谷歌的一些图片和js放在`ssl.gstatic.com`这个域名上,虽然没加载出来也不会对搜索有什么影响,但看着chrome一直转圈,非常不爽。  \n一个处理的比较好的网站[wen.lu](http://wen.lu/),不管是速度还是各方面都比较好.. 但缺点就是人用的比较多,偶尔会出现要输验证码的情况,花了一天的时间,自己折腾了下反向代理谷歌。\n\n## nginx安装\n```shell\ncd /tmp\ngit clone git://github.com/yaoweibin/ngx_http_substitutions_filter_module.git # nginx 的过滤器模块(比http_sub_module更加灵活)\nwget http://nginx.org/download/nginx-1.7.7.tar.gz\ntar -xzvf nginx-1.7.7.tar.gz\ncd /tmp/nginx-1.7.7\n./configure \\\n--prefix=/www/wdlinux/nginx \\ # 安装位置\n--with-http_ssl_module \\\n--with-http_sub_module \\\n--with-http_gzip_static_module \\\n--with-http_stub_status_module \\\n--add-module=/tmp/ngx_http_substitutions_filter_module # 添加nginx过滤器模块\nmake & make install\n```\n安装上面的步骤安装好nginx,如果中途遇到什么报错,请google。\n<!--more-->\n\n------\n\n## 配置反向代理\n### 配置文件\n直接上配置文件:  \n```shell\nserver {\n    listen 443;\n    server_name sqzr.cc;\n    ssl on;\n    ssl_certificate xxx.crt; # crt 位置\n    ssl_certificate_key xxx.key; # key 位置\n\n    location / {\n        # 反向代理缓存配置\n        proxy_cache_key $scheme://$host$request_uri;\n        proxy_temp_path /home/sqzrproxy_cache_tmp;\n        proxy_cache_path /home/sqzrproxy_cache levels=1:2 keys_zone=sqzrproxy:20m inactive=10d max_size=2g;\n        proxy_cache sqzrproxy;\n        proxy_cache_valid 200 302 24h;\n        proxy_cache_valid 404 1m;\n        # end 反向代理缓存配置\n        expires 30d;   # 用户游览器缓存时间\n        proxy_redirect https://www.google.com/ /;\n        proxy_cookie_domain google.com sqzr.cc;\n        proxy_pass http://173.194.38.69; # 反代的google一个ip\n        proxy_set_header Accept-Encoding \"\";\n        proxy_set_header User-Agent $http_user_agent;\n        proxy_set_header Accept-Language \"zh-CN\";\n        #proxy_set_header Cookie \"PREF=ID=047808f19f6de346:U=0f62f33dd8549d11:FF=2:LD=zh-CN:NW=1:TM=1325338577:LM=1332142444:GM=1:SG=2:S=rE0SyJh2w1IQ-Maw\"; # 使用此cookie 谷歌在搜索结果打开的时候会弹出新窗口\n        proxy_set_header Cookie \"PREF=ID=a55d9a4143345dbb:FF=0:TM=1414914150:LM=1414914150:S=Sm6aRXOASTr7rVM9;NID=67=lFnfhba9BOH4rXNaxA0ieI_XSHv3Mqu9scHN-Byu5sgdy2DAtb_SfC8XVYJAtREoKDJk3M54tGBZK1cCM0TGkJ_yM7Eqrxk2GVGnxJ87V1yUIIRs4ZFAmh2xlIHn1pug;\"; # 使用此cookie 搜索的时候谷歌用ajax加载结果(无刷新页面) 谷歌在搜索结果打开的时候不会弹出新窗口\n        # 关键字替换\n        subs_filter_types text/css text/xml text/javascript; # 过滤类型\n        subs_filter ssl.gstatic.com sqzr.cc; # google会加载ssl.gstatic.com的几个资源和文件,都是在gb目录下,下面反代这个地址\n        subs_filter www.google.com sqzr.cc;\n        # end 关键字替换\n    }\n    \n    # 反代ssl.gstatic.com\n    location /gb {\n        # 随便写了下,自己没使用自己的服务器来反代\n        proxy_pass http://ssl.gstatic.com/gb/;\n        proxy_set_header Accept-Encoding \"\";\n    }\n}\n\nserver {\n    listen 80;\n    server_name sqzr.cc;\n    rewrite ^(.*) https://google.sqzr.cc$1 permanent; # 强制使用https\n}\n```\n### 使用七牛云代替gstatic\n能不反代的地址尽量不要反代,比如一些常年不变的图片,可以直接就缓存到服务器上。\n`ssl.gstatic.com`域上的几个资源就这样,可以用七牛云提供的镜像功能来缓存到七牛云上。\n![设置镜像站点](//dn-sqzr.qbox.me/七牛云设置镜像.png)\n默认七牛给的域名不支持https,绑定一个他们分配的：\n![绑定支持https的域名](//dn-sqzr.qbox.me/绑定支持https的域名.png)\n修改nginx中的关键词替换:\n```shell\nsubs_filter ssl.gstatic.com dn-xxx.qbox.me;\n```\n访问一次,就自动缓存到七牛云的服务器上了:\n![缓存结果](//dn-sqzr.qbox.me/缓存结果.png)\n### 一些细节问题\n1. 在网上看到很多人说无法成功的替换`ssl.gstatic.com`这个域名,之前我也遇到过,折腾了一天才发现`proxy_pass http://173.194.38.69` 某些地址可以修改成功,有些不可以(不知道原因,希望懂的能指导指导)  \n2. google.com下的`/textinputassistant/tia.png`无法替换,也和上个问题一样,有些ip可以有些不行\n\n------\n\n## 没解决的问题\n这样反代下来还是有几个问题没解决,如果使用第一个cookie反代google(用新页面打开搜索结果),搜索不了几次就会出现:  \n![google反代提示](//dn-sqzr.qbox.me/google反代提示.png)\n使用无刷新搜索的那个cookie就不会出来(因为整体页面没刷新,没加载,如果在里面切换到图片搜索再切换回来,一样会出现)\n希望各位大神能指导指导\n\n## 参考资料\n* [分享一下我的 Nginx 反向代理 Google 以及草榴等的参数配置](http://www.v2ex.com/t/126028)\n* [Nginx反向代理Google](http://blog.linuxeye.com/399.html)\n', '1', '11', '2014-11-13 13:29:00', 'post', 'nginx-reverse-proxy-google');
INSERT INTO `article` VALUES ('2', '1', '文字添加测试', '文字添加测试', '1', '0', '2014-11-13 16:47:00', 'post', 'sadasdas');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '折腾2', 'default', 'test', null, '2014-11-13 13:28:24');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `a_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `author` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip` varchar(255) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `text` text,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `parent` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`a_id`),
  KEY `comment_ibfk_1` (`a_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`a_id`) REFERENCES `article` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '2014-11-13 13:31:54', '34534', 'sadasd@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'asdasdasad', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('2', '1', '2014-11-13 13:32:07', '123231', '213123@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'asdasd', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('3', '1', '2014-11-13 16:51:32', 'adasdasdasdsa', 'masdasd@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试大段文本测试', 'article_comment', 'spam', '0');
INSERT INTO `comment` VALUES ('4', '1', '2014-11-13 17:11:56', 'asdasd', 'monkeysqzr@gmail.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'asdasdasd', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('5', '1', '2014-11-13 17:43:27', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'asdasdasd', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('6', '1', '2014-11-14 12:40:46', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿打算的撒打算的撒打算打算打算啊实打实的撒的撒是阿达撒的撒的撒 撒打算阿达撒 阿斯顿撒 撒旦阿萨德按时d', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('7', '1', '2014-11-14 12:40:46', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿打算的撒打算的撒打算打算打算啊实打实的撒的撒是阿达撒的撒的撒 撒打算阿达撒 阿斯顿撒 撒旦阿萨德按时d', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('8', '1', '2014-11-14 12:40:46', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿打算的撒打算的撒打算打算打算啊实打实的撒的撒是阿达撒的撒的撒 撒打算阿达撒 阿斯顿撒 撒旦阿萨德按时d', 'article_comment', 'approved', '0');
INSERT INTO `comment` VALUES ('9', '1', '2014-11-14 12:41:55', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿斯顿撒撒旦', 'article_comment', 'waiting', '0');
INSERT INTO `comment` VALUES ('11', '1', '2014-11-14 12:41:55', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿斯顿撒撒旦', 'article_comment', 'waiting', '0');
INSERT INTO `comment` VALUES ('12', '1', '2014-11-14 12:42:05', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿斯顿撒的撒打算打算打算 ', 'article_comment', 'waiting', '0');
INSERT INTO `comment` VALUES ('13', '1', '2014-11-14 12:42:05', 'adasdas', 'asdadas@qq.com', '', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '阿斯顿撒的撒打算打算打算 ', 'article_comment', 'spam', '0');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `useragent` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('1', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-13 13:27:12');
INSERT INTO `log` VALUES ('2', 'addArticle', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'nginx 反向代理谷歌', 'true', '2014-11-13 13:29:35');
INSERT INTO `log` VALUES ('3', 'addArticle', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', '文字添加测试', 'true', '2014-11-13 16:45:27');
INSERT INTO `log` VALUES ('4', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 12:57:10');
INSERT INTO `log` VALUES ('5', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 13:01:39');
INSERT INTO `log` VALUES ('6', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 13:02:45');
INSERT INTO `log` VALUES ('7', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 13:07:35');
INSERT INTO `log` VALUES ('8', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 17:08:50');
INSERT INTO `log` VALUES ('9', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'username:asd-password:12312', 'false', '2014-11-14 20:04:36');
INSERT INTO `log` VALUES ('10', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'username:asd-password:123123', 'true', '2014-11-14 20:04:40');
INSERT INTO `log` VALUES ('11', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-14 22:01:22');
INSERT INTO `log` VALUES ('12', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'username:asd-password:123123', 'true', '2014-11-15 15:32:43');
INSERT INTO `log` VALUES ('13', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-15 16:53:51');
INSERT INTO `log` VALUES ('14', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 'username:asd-password:123123', 'true', '2014-11-15 16:54:55');
INSERT INTO `log` VALUES ('15', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-15 18:09:28');
INSERT INTO `log` VALUES ('16', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-15 19:48:45');
INSERT INTO `log` VALUES ('17', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-17 13:07:57');
INSERT INTO `log` VALUES ('18', 'login', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36', 'username:asd-password:123123', 'true', '2014-11-17 14:29:31');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `name` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('title', 'sqzr\'s blog');
INSERT INTO `options` VALUES ('url', 'http://127.0.0.1:8080');
INSERT INTO `options` VALUES ('subtitle', '记录学习过程中的点点滴滴');
INSERT INTO `options` VALUES ('description', '可知一生有你我都陪在你身边');
INSERT INTO `options` VALUES ('htmldescription', '主页页面描述\n');
INSERT INTO `options` VALUES ('authorname', 'sqzr');
INSERT INTO `options` VALUES ('htmlkeyword', 'assasasa');
INSERT INTO `options` VALUES ('facebook', '32432');
INSERT INTO `options` VALUES ('googleplus', '54654645645645555');
INSERT INTO `options` VALUES ('twitter', '加快了科技');
INSERT INTO `options` VALUES ('tqq', null);
INSERT INTO `options` VALUES ('weibo', 'sqzr');
INSERT INTO `options` VALUES ('github', '');
INSERT INTO `options` VALUES ('pagenumber', '8');
INSERT INTO `options` VALUES ('authoremail', 'monkeysqzr@gmail.com');
INSERT INTO `options` VALUES ('avatar', '/images/avatar/411bb362-d824-4be5-9030-73a5f44e09df.jpg');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `keeplogin` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `lastloginip` varchar(255) DEFAULT NULL,
  `lastloginuseragent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'asd', '123123', 'ba32b9f55dabd545927b38debe432383', '/images/avatar/sqzr.jpg', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/38.0.2125.111 Safari/537.36');
