/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.17 : Database - cltdemo_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cltdemo_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `cltdemo_db`;

/*Table structure for table `clt_ad` */

DROP TABLE IF EXISTS `clt_ad`;

CREATE TABLE `clt_ad` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告名称',
  `type_id` tinyint(5) NOT NULL COMMENT '所属位置',
  `pic` varchar(200) NOT NULL DEFAULT '' COMMENT '广告图片URL',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '广告链接',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `sort` int(11) NOT NULL COMMENT '排序',
  `open` tinyint(2) NOT NULL COMMENT '1=审核  0=未审核',
  `content` varchar(225) DEFAULT '' COMMENT '广告内容',
  PRIMARY KEY (`ad_id`),
  KEY `plug_ad_adtypeid` (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='广告表';

/*Data for the table `clt_ad` */

insert  into `clt_ad`(`ad_id`,`name`,`type_id`,`pic`,`url`,`addtime`,`sort`,`open`,`content`) values 
(15,'CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站',1,'/uploads/20180611/c09ce57b7b5264ccbefef44c2591117b.png','http://demo.cltphp.com',1480909037,1,1,'虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。'),
(17,'即使是后台我们也极力追求尽善尽美',1,'/uploads/20180611/25e5f5a08933130f026a6119666b44a8.png','http://demo.cltphp.com',1481788850,2,1,'CLTPHP采用了优美的layui框架，一面极简，一面丰盈。加上angular Js，让数据交互变得更为简洁直白。用最基础的代码，实现最强大的效果，让你欲罢不能！'),
(18,'ThinkPHP5极大的提高了CLTPHP的可拓展性',1,'/uploads/20180611/814e5f76ef5dce49dfd3dce771631ecf.png','http://demo.cltphp.com',1481788869,3,1,'CLTPHP采用的ThinkPHP5为基础框架，从而使得CLTPHP的拓展性变的极为强大。从模型构造到栏目建立，再到前台展示，一气呵成，网站后台一条龙式操作，让小白用户能快速掌握CLTPHP管理系统的核心操作，让小白开发者能更好的理解CLTPHP的核心构建价值。');

/*Table structure for table `clt_ad_type` */

DROP TABLE IF EXISTS `clt_ad_type`;

CREATE TABLE `clt_ad_type` (
  `type_id` tinyint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '广告位名称',
  `sort` int(11) NOT NULL COMMENT '广告位排序',
  PRIMARY KEY (`type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='广告分类';

/*Data for the table `clt_ad_type` */

insert  into `clt_ad_type`(`type_id`,`name`,`sort`) values 
(1,'【首页】顶部轮播',1),
(5,'【内页】横幅',2);

/*Table structure for table `clt_admin` */

DROP TABLE IF EXISTS `clt_admin`;

CREATE TABLE `clt_admin` (
  `admin_id` tinyint(4) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(20) NOT NULL COMMENT '管理员用户名',
  `pwd` varchar(70) NOT NULL COMMENT '管理员密码',
  `group_id` mediumint(8) DEFAULT NULL COMMENT '分组ID',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `realname` varchar(10) DEFAULT NULL COMMENT '真实姓名',
  `tel` varchar(30) DEFAULT NULL COMMENT '电话号码',
  `ip` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `mdemail` varchar(50) DEFAULT '0' COMMENT '传递修改密码参数加密',
  `is_open` tinyint(2) DEFAULT '0' COMMENT '审核状态',
  `avatar` varchar(120) DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`admin_id`),
  KEY `admin_username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

/*Data for the table `clt_admin` */

insert  into `clt_admin`(`admin_id`,`username`,`pwd`,`group_id`,`email`,`realname`,`tel`,`ip`,`add_time`,`mdemail`,`is_open`,`avatar`) values 
(1,'admin','0192023a7bbd73250516f069df18b500',1,'1109305454@qq.com','','18792402229','127.0.0.1',1482132862,'0',1,'/uploads/20180625/f266169c2956429d9aaea6cf6f1e51cb.jpg'),
(11,'cltphp','2495caa2aa678121ccc248e530494639',2,'123@qq.com','','15896589568','127.0.0.1',1535512393,'0',1,'');

/*Table structure for table `clt_article` */

DROP TABLE IF EXISTS `clt_article`;

CREATE TABLE `clt_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL COMMENT '内容',
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `copyfrom` varchar(255) NOT NULL DEFAULT 'CLTPHP',
  `fromlink` varchar(255) NOT NULL DEFAULT 'http://www.cltphp.com/',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `title_style` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

/*Data for the table `clt_article` */

insert  into `clt_article`(`id`,`catid`,`userid`,`username`,`title`,`keywords`,`description`,`content`,`template`,`posid`,`status`,`recommend`,`readgroup`,`readpoint`,`sort`,`hits`,`createtime`,`updatetime`,`copyfrom`,`fromlink`,`thumb`,`title_style`) values 
(1,3,1,'admin','你可能忽略掉的后台小功能（一）','你可能忽略掉的后台小功能（一）','你可能忽略掉的后台小功能（一）','<p>刷新：刷新当前标签页</p><p>关闭当前：关闭当前标签页</p><p>关闭其他：除选中的标签页外，关闭其他全部标签页</p><p>关闭所有：关闭全部标签页</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764868495338.png\" title=\"1504764868495338.png\" alt=\"ac (1).png\"/></p>','0',2,'1',0,'',0,0,804,1499760262,1504764870,'CLTPHP','http://www.cltphp.com/','',''),
(2,3,1,'admin','CLTPHP开放式模型设计','CLTPHP开放式模型设计','CLTPHP内容管理系统采用了区别于传统cms的开放式模型设计，让网站的栏目及内容随这站长的想法而设计、改变。','<p>　　CLTPHP内容管理系统采用了区别于传统cms的开放式模型设计，让网站的栏目及内容随这站长的想法而设计、改变。</p><p>　　在网站建设中，我们会把不同的内容以不同的方式展示，传统网站得手动建立不同的数据表，然后通过编码，建立不同的后台栏目，在针对不同的栏目添加各自对应的内容，这期间，还得写不同的添加页面来适应各个分类，最后，再把不同的栏目展示到前台。</p><p>　　CLTPHP的解决方式是，通过后台添加模型，建立不同的表，</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764406381046.png\" title=\"1504764406381046.png\" alt=\"m (1).png\"/></p><p>模型是要和栏目绑定的，不同的栏目就会有不同的内容模型，或者是同一类栏目内容，会归纳到同一模型下。这里产品模型绑定为文章模型。</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764538131048.png\" title=\"1504764538131048.png\" alt=\"cm (1).png\"/></p><p>一个模型可以理解为一张表，模型字段即使这张表的字段。</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764618106985.png\" title=\"1504764618106985.png\" alt=\"mf (1).png\"/></p><p>每一个字段最终呈现的方式可能会不一样，所以，字段属性就应用而生了，</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764686677148.png\" title=\"1504764686677148.png\" alt=\"ef (1).png\"/></p><p>以标题举例，标题会对应自己显示颜色，及是否加粗显示，还有，是否对应一个缩略图。这些通过模型字段的设置，就可以在添加栏目里体现出来，参考下图</p><p><img src=\"/public/uploads/ueditor/image/20170907/1504764760851814.png\" title=\"1504764760851814.png\" alt=\"en (1).png\"/></p><p>通过上图，我们能很清楚知道，这个栏目对应的模型里，标题字段一定设置了标题图片和标题样式。最后，栏目或者某一篇内容可以绑定一个模版，用来前台展示。不同的模版有不同的展示风格，这里，开发者可以扩延出无限的前台展示模版。其规则是，列表页 &nbsp;<strong>表名-list-自定义&nbsp;</strong>&nbsp;内容页 &nbsp;<strong>表名-show-自定义</strong></p>','0',2,'1',0,'',0,0,1298,1499760655,1504764762,'CLTPHP','http://www.cltphp.com/','',''),
(24,5,1,'admin','CLTPHP5.1更新','CLTPHP5.1更新','CLTPHP5.1更新','<p>更新内容：</p><p>1.优化双编辑器（编辑器切换不兼容问题，layedit上传不了图片问题，layedit无法编辑问题）</p><p>2.添加自定义标签（参考首页）</p><p>3.修复前台手机兼容问题</p><p><br/></p><p>下载地址：<a target=\"_self\" href=\"http://o95ehky7c.bkt.clouddn.com/cltphp5.1.zip\">点击下载CLTPHP5.1</a></p><p>升级补丁：<a target=\"_self\" href=\"http://o95ehky7c.bkt.clouddn.com/CLTPHP5.0s%E5%8D%87%E7%BA%A75.1%E5%8C%85.zip\">CLTPHP5.0升级5.1</a></p>','0',0,'1',0,'',0,0,288,1503307064,1505264247,'CLTPHP','http://www.cltphp.com/','',''),
(3,5,1,'admin','关于CLTPHP你错过了什么？','关于CLTPHP你错过了什么？','关于CLTPHP你错过了什么？','<p><a target=\"_blank\" href=\"http://www.cltphp.com\">CLTPHP</a>官方QQ群<a target=\"_blank\" title=\"点击加入\" href=\"http://shang.qq.com/wpa/qunwpa?idkey=003995f61e8bdf5e79e0241b3136b9803ea498833535bbb3aa14004966858349\">229455880</a>，来这里和大家一起讨论更多<a target=\"_blank\" href=\"http://www.cltphp.com\">CLTPHP</a>相关的问题和操作方法，同时可以掌握<a target=\"_self\" href=\"http://www.cltphp.com/home/news/index/catId/49.html\">CLTPHP的最新动态</a>。</p><p>另外，站长会在群里随时更新一些好玩的，或者好用的资源。</p>','0',1,'1',0,'',0,0,355,1498035408,1499834839,'CLTPHP','http://www.cltphp.com/','',''),
(4,5,1,'admin','CLTPHP4.0正式发布','CLTPHP4.0正式发布','CLTPHP4.0正式发布','<p><a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP4.0</a>正式发布，<a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP4.0</a>采用ThinkPHP+Layui+AngularJS实现完成。</p>','0',2,'1',0,'',0,0,1022,1497949408,1504597814,'CLTPHP','http://www.cltphp.com/','',''),
(5,5,1,'admin','CLTPHP4.2版本更新','CLTPHP4.2版本更新,CLTPHP,CLTPHP内容管理系统','CLTPHP4.2版本更新','<p>更新内容</p><p>1.升级ThinkPHP框架到5.0.10</p><p>2.后台栏目添加/编辑文章，点击返回按钮定位到当前栏目</p><p>3.后台增加主站捐献功能</p><p>4.微信管理调整，添加“生成菜单”功能</p><p><br></p><p>推荐环境：apache2.4+php5.5(以上)+mysql5.0(以上)</p><p>开发环境：phpStudy 2016 &nbsp;php5.5.38</p><div><br></div>','0',2,'1',0,'',0,0,619,1499159138,1499916031,'CLTPHP','http://www.cltphp.com/','',''),
(6,5,1,'admin','CLTPHP操作文档不断更新中','CLTPHP操作文档不断更新中','CLTPHP操作文档不断更新中','<p>　　新版<a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP</a>操作及开发手册不断更新中，欢迎大家购买学习。<img src=\"file:///C:/Users/ADMINI~1/AppData/Local/Temp/%W@GJ$ACOF(TYDYECOKVDYB.png\">https://www.kancloud.cn/chichu/cltphp。</p><p>　　文档的延迟更新，给各位爱好者带来的不便，我们深感抱歉，但也请大家理解我们的难处。</p><p>　　开发团队向大家保证，会尽快完善文档，尽量解决大家在开发过程中遇到的种种问题。</p><p>　　文档是收费的，开发的继续开发，骂娘的继续骂娘，收费的或许会越来越贵。</p><div><br></div>','0',2,'1',0,'',0,0,800,1499677661,1504597769,'CLTPHP','http://www.cltphp.com/','',''),
(7,6,1,'admin','ThinkPHP隐藏index.php','ThinkPHP隐藏index.php,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','ThinkPHP隐藏index.php,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','<p>可以通过URL重写隐藏应用的入口文件<code>index.php</code>,下面是相关服务器的配置参考：</p><h2 data-line=\"2\" class=\"line\"><a id=\"_Apache__2\"></a>[ Apache ]</h2><ol><li>httpd.conf配置文件中加载了mod_rewrite.so模块</li><li>AllowOverride None 将None改为 All</li><li>把下面的内容保存为.htaccess文件放到应用入口文件的同级目录下</li></ol><pre><code><span class=\"hljs-section\">&lt;IfModule mod_rewrite.c&gt;</span>\n<span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">Options</span></span> +FollowSymlinks -Multiviews\n<span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">RewriteEngine</span></span> <span class=\"hljs-literal\">on</span>\n\n<span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">RewriteCond</span></span> <span class=\"hljs-variable\">%{REQUEST_FILENAME}</span> !-d\n<span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">RewriteCond</span></span> <span class=\"hljs-variable\">%{REQUEST_FILENAME}</span> !-f\n<span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">RewriteRule</span></span> ^(.*)$ index.php?/<span class=\"hljs-number\">$1</span><span class=\"hljs-meta\"> [QSA,PT,L]</span>\n<span class=\"hljs-section\">&lt;/IfModule&gt;</span>\n</code></pre><h2 data-line=\"18\" class=\"line\"><a id=\"_IIS__18\"></a>[ IIS ]</h2><p>如果你的服务器环境支持ISAPI_Rewrite的话，可以配置httpd.ini文件，添加下面的内容：</p><pre><code><span class=\"hljs-attribute\"><span class=\"hljs-nomarkup\">RewriteRule</span></span> (.*)$ /index\\.php\\?s=<span class=\"hljs-number\">$1</span><span class=\"hljs-meta\"> [I]</span>\n</code></pre><p>在IIS的高版本下面可以配置web.Config，在中间添加rewrite节点：</p><pre><code><span class=\"xml\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">rewrite</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">rules</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">rule</span> <span class=\"hljs-attr\">name</span>=<span class=\"hljs-string\">\"OrgPage\"</span> <span class=\"hljs-attr\">stopProcessing</span>=<span class=\"hljs-string\">\"true\"</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">match</span> <span class=\"hljs-attr\">url</span>=<span class=\"hljs-string\">\"^(.*)$\"</span> /&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">conditions</span> <span class=\"hljs-attr\">logicalGrouping</span>=<span class=\"hljs-string\">\"MatchAll\"</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">add</span> <span class=\"hljs-attr\">input</span>=<span class=\"hljs-string\">\"</span></span></span><span class=\"hljs-template-variable\">{HTTP_HOST}</span><span class=\"xml\"><span class=\"hljs-tag\"><span class=\"hljs-string\">\"</span> <span class=\"hljs-attr\">pattern</span>=<span class=\"hljs-string\">\"^(.*)$\"</span> /&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">add</span> <span class=\"hljs-attr\">input</span>=<span class=\"hljs-string\">\"</span></span></span><span class=\"hljs-template-variable\">{REQUEST_FILENAME}</span><span class=\"xml\"><span class=\"hljs-tag\"><span class=\"hljs-string\">\"</span> <span class=\"hljs-attr\">matchType</span>=<span class=\"hljs-string\">\"IsFile\"</span> <span class=\"hljs-attr\">negate</span>=<span class=\"hljs-string\">\"true\"</span> /&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">add</span> <span class=\"hljs-attr\">input</span>=<span class=\"hljs-string\">\"</span></span></span><span class=\"hljs-template-variable\">{REQUEST_FILENAME}</span><span class=\"xml\"><span class=\"hljs-tag\"><span class=\"hljs-string\">\"</span> <span class=\"hljs-attr\">matchType</span>=<span class=\"hljs-string\">\"IsDirectory\"</span> <span class=\"hljs-attr\">negate</span>=<span class=\"hljs-string\">\"true\"</span> /&gt;</span>\n <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">conditions</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">action</span> <span class=\"hljs-attr\">type</span>=<span class=\"hljs-string\">\"Rewrite\"</span> <span class=\"hljs-attr\">url</span>=<span class=\"hljs-string\">\"index.php/</span></span></span><span class=\"hljs-template-variable\">{R:1}</span><span class=\"xml\"><span class=\"hljs-tag\"><span class=\"hljs-string\">\"</span> /&gt;</span>\n <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">rule</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">rules</span>&gt;</span>\n <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">rewrite</span>&gt;</span>\n</span></code></pre><h2 data-line=\"42\" class=\"line\"><a id=\"_Nginx__42\"></a>[ Nginx ]</h2><p>在Nginx低版本中，是不支持PATHINFO的，但是可以通过在Nginx.conf中配置转发规则实现：</p><pre><code>  location / { // …..省略部分代码\n   <span class=\"hljs-keyword\">if</span> (!<span class=\"hljs-_\">-e</span> <span class=\"hljs-variable\">$request_filename</span>) {\n   rewrite  ^(.*)$  /index.php?s=/<span class=\"hljs-variable\">$1</span>  last;\n   <span class=\"hljs-built_in\">break</span>;\n    }\n }\n</code></pre><blockquote class=\"default\"><p>其实内部是转发到了ThinkPHP提供的兼容URL，利用这种方式，可以解决其他不支持PATHINFO的WEB服务器环境。</p></blockquote><p>如果你的应用安装在二级目录，<code>Nginx</code>的伪静态方法设置如下，其中<code>youdomain</code>是所在的目录名称。</p><pre><code><span class=\"hljs-attribute\">location</span> /youdomain/ {\n    <span class=\"hljs-attribute\">if</span> (!-e <span class=\"hljs-variable\">$request_filename</span>){\n        <span class=\"hljs-attribute\">rewrite</span> <span class=\"hljs-regexp\"> ^/youdomain/(.*)$</span>  /youdomain/index.php?s=/<span class=\"hljs-variable\">$1</span>  <span class=\"hljs-literal\">last</span>;\n    }\n}\n</code></pre><p>原来的访问URL：</p><pre><code><span class=\"hljs-link\">http://serverName/index.php/模块/控制器/操作/</span>[<span class=\"hljs-string\">参数名/参数值...</span>]\n</code></pre><p>设置后，我们可以采用下面的方式访问：</p><pre><code><span class=\"hljs-link\">http://serverName/模块/控制器/操作/</span>[<span class=\"hljs-string\">参数名/参数值...</span>]\n</code></pre><p>如果你没有修改服务器的权限，可以在index.php入口文件做修改，这不是正确的做法，并且不一定成功，视服务器而定，只是在框架执行前补全$_SERVER[‘PATH_INFO’]参数</p><pre><code><span class=\"hljs-meta\">$</span><span class=\"bash\">_SERVER[<span class=\"hljs-string\">\'PATH_INFO\'</span>] = <span class=\"hljs-variable\">$_SERVER</span>[<span class=\"hljs-string\">\'REQUEST_URI\'</span> ];</span></code></pre>','0',2,'1',0,'',0,0,866,1499764536,1500368732,'《ThinkPHP5.0路由完全指南》','','',''),
(8,6,1,'admin','position属性absolute与relative','position属性absolute与relative,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','很多程序猿不清楚absolute与relative怎么区分，怎么用？我们都知道absolute是绝对定位，relative是相对定位，但是这个绝对 与相对是什么意思呢？','<p>很多朋友问过我absolute与relative怎么区分，怎么用？我们都知道absolute是绝对定位，relative是相对定位，但是这个绝对 与相对是什么意思呢？绝对是什么地方的绝对，相对又是相对于什么地方而言的呢？那他们又有什么样的特性，可以做出什么样的效果呢？关于两者之间又有什么样 的技巧呢？下面我们就来一一解读。<br></p><p></p><p>Absolute，CSS中的写法是：position:absolute; 他的意思是绝对定位，他是参照浏览器的左上角，配合TOP、RIGHT、BOTTOM、LEFT(下面简称TRBL)进行定位，在没有设定TRBL，默认 依据父级的做标原始点为原始点。如果设定TRBL并且父级没有设定position属性，那么当前的absolute则以浏览器左上角为原始点进行定位， 位置将由TRBL决定。</p><p><img src=\"http://www.blueidea.com/articleimg/2006/11/4249/absolute.gif\" alt=\"\"></p><p>一般来讲，网页居中的话用Absolute就容易出错，因为网页一直是随着分辨率的大小自动适应的，而Absolute则会以浏览器的左上角为原始 点，不会应为分辨率的变化而变化位置。很多人出错就在于这点上出错。而网页居左其特性与Relative很相似，但是还是有本质的区别的。</p><p>Relative，CSS中的写法是：position:relative;&nbsp; 他的意思是绝对相对定位，他是参照父级的原始点为原始点，无父级则以BODY的原始点为原始点，配合TRBL进行定位，当父级内有padding等CSS属性时，当前级的原始点则参照父级内容区的原始点进行定位。</p><p><img src=\"http://www.blueidea.com/articleimg/2006/11/4249/relative.gif\" alt=\"\"></p><p>有时我们还需要依靠z-index来设定容器的上下关系，数值越大越在最上面，数值范围是自然数。当然有一点要注意，父子关系是无法用z-index来设定上下关系的，一定是子级在上父级在下。</p><p>二 详解定位与定位应用&nbsp;<a href=\"http://blog.sina.com.cn/u/4bcf4a5e010008o0\">http://blog.sina.com.cn/u/4bcf4a5e010008o0</a></p><table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" class=\"ke-zeroborder layui-table\"><tbody><tr><td id=\"labeltag\" align=\"center\" valign=\"top\" width=\"60\"></td><td><a href=\"http://search.blog.sina.com.cn/blog/search?q=css&amp;tag=n&amp;t=tag\" target=\"_blank\">css</a>&nbsp;<a href=\"http://search.blog.sina.com.cn/blog/search?q=%BE%F8%B6%D4%B6%A8%CE%BB&amp;tag=n&amp;t=tag\" target=\"_blank\">绝对定位</a>&nbsp;<a href=\"http://search.blog.sina.com.cn/blog/search?q=%CF%E0%B6%D4%B6%A8%CE%BB&amp;tag=n&amp;t=tag\" target=\"_blank\">相对定位</a></td></tr></tbody></table><div>&nbsp;&nbsp;&nbsp; 定位一直是WEB标准应用中的难点，如果理不清楚定位那么可能应实现的效果实现不了，实现了的效果可能会走样。如果理清了定位的原理，那定位会让网页实现的更加完美。</div><div><strong>&nbsp;&nbsp;&nbsp; 定位的定义：</strong><p>在CSS中关于定位的内容是：</p></div><div align=\"center\"><strong>position:relative | absolute | static | fixed</strong></div><div align=\"left\"><strong>&nbsp;&nbsp;&nbsp; static(静态)</strong>&nbsp;没有特别的设定，遵循基本的定位规定，不能通过z-index进行层次分级。<br><strong>&nbsp;&nbsp;&nbsp; relative(相对定位)</strong>&nbsp;对象不可层叠、不脱离文档流，参考自身静态位置通过 top,bottom,left,right 定位，并且可以通过z-index进行层次分级。<br><strong>absolute(绝对定位)</strong>&nbsp;脱离文档流，通过 top,bottom,left,right 定位。选取其最近一个最有定位设置的父级对象进行绝对定位，如果对象的父级没有设置定位属性，absolute元素将以body坐标原点进行定位，可以通过z-index进行层次分级。<br><strong>&nbsp;&nbsp;&nbsp; fixed（固定定位）</strong>&nbsp;这里所固定的参照对像是<strong>可视窗口</strong>而并非是body或是父级元素。可通过z-index进行层次分级。<br><strong>注</strong>：<br>CSS中定位的层叠分级：<strong>z-index: auto | namber;</strong><p><strong>auto</strong>&nbsp;遵从其父对象的定位<br><strong>namber</strong>&nbsp;&nbsp;无单位的整数值。可为负数</p></div><div align=\"left\"><strong>定位的原理：</strong><p>1.可以位移的元素 （相对定位）</p><p>在本文流中，任何一个元素都被文本流所限制了自身的位置，但是通过CSS我们依然使得这些元素可以改变自己的位置，我们可以通过float来让元素浮 动，也可以通过margin来让元素产生位置移动。但事实上那并非是真实的位移，因为，那只是通过加大margin值来实现的障眼法。而真正意义上的位移 是通过top,right,bottom,left（下称TRBL，TRBL可以折分使用。）针对一个相对定位的元素所产生的。我们看下面的图：</p></div><div align=\"left\">我们看图中是一个相对定位的元素</div><pre class=\"prettyprint lang-css\"><span class=\"com\">#first {</span><span class=\"pln\">\nwidth</span><span class=\"pun\">:</span><span class=\"lit\">200px</span><span class=\"pun\">;</span><span class=\"pln\">\nheight</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">50px</span><span class=\"pun\">;</span><span class=\"pln\">\nmargin</span><span class=\"pun\">:</span><span class=\"lit\">25px</span><span class=\"pun\">;</span><span class=\"pln\">\nborder</span><span class=\"pun\">:</span><span class=\"lit\">25px</span><span class=\"pln\"> solid </span><span class=\"com\">#333;</span><span class=\"pln\">\npadding</span><span class=\"pun\">:</span><span class=\"lit\">25px</span><span class=\"pun\">;</span><span class=\"pln\">\nposition</span><span class=\"pun\">:</span><span class=\"pln\">relative</span><span class=\"pun\">;</span><span class=\"pln\">\ntop</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">50px</span><span class=\"pun\">;</span><span class=\"pln\">\nleft</span><span class=\"pun\">:</span><span class=\"pln\"> </span><span class=\"lit\">50px</span><span class=\"pun\">;</span><span class=\"pln\">\n</span><span class=\"pun\">}</span></pre><p>而下方是一块默认定位的黑色区块<br></p><pre class=\"prettyprint lang-css\"><span class=\"com\">#second {</span><span class=\"pln\">\nwidth</span><span class=\"pun\">:</span><span class=\"lit\">400px</span><span class=\"pun\">;</span><span class=\"pln\">\nheight</span><span class=\"pun\">:</span><span class=\"lit\">75px</span><span class=\"pun\">;</span><span class=\"pln\">\nmargin</span><span class=\"pun\">:</span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">\nborder</span><span class=\"pun\">:</span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">\npadding</span><span class=\"pun\">:</span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">\nbackgroud</span><span class=\"pun\">-</span><span class=\"pln\">color</span><span class=\"pun\">:</span><span class=\"com\">#333;</span><span class=\"pln\">\n</span><span class=\"pun\">}</span></pre><div align=\"left\">我们看到这个处在文本流的区块被上面的相对定位挡住了一部分，这说明：“当元素被设置相对定位或是绝对定位后，将自动产生层叠，他们的层叠级别自然的高于 文本流”。除非设置其z-index值为负值。并且我们发现当相对定位元素进行位移后，表现内容已经脱离了文本流，只是在本文流中还为原来的相对对定位留 下了原有的总宽与总高（内容的高度或是宽度加上 margin\\border\\padding的数值）。这说明在相对定位中，虽然表现区脱离了原来的文本流，但是在文本流中还还有此相对定位的老窩。这点 要特别注意，因为在实际应用中如果相对定位的位移数值过大，那么原有的区域就会形成一块空白。</div><div align=\"left\">&nbsp;&nbsp;&nbsp; 并且我们注意，定位元素的坐标点是在margin值的左上边缘点，即图中的B点。那么所有的位移的计算将以这个点为基础进行元素的推动。</div><p>2.可以在任意一个位置的元素（绝对定位）</p><p>如上所述：相对定位只可以在文本流中进行位置的上下左右的移动，同样存在一定的局限性，虽然他的表现区脱离了文本流，但是在文本流却依然为其保留了一席之 地，这就好比一个打工的人他到了外地，但是在老家依然有一个专属于他的位置，这个位置不随他的移动而改变。但是这样很明显就会空出一块空白来，如果希望文 本流抛弃这个部分就需要用到绝对定位。绝对定位不光脱离了文本流，而且在文本流中也不会给这个绝对定位元素留下专属空位。这就好比是一个工厂里的职位，如 果有一个工人走了自然会要有别的工人来填充这个位置。而移动出去的部分自然也就成为了自由体。绝对定位将可以通过TRBL来设置元素，使之处在任何一个位 置。在父层position属性为默认值时，TRBL的坐标原点以body的坐标原点为起始。</p><div align=\"left\">3.被关联的绝对定位<p>上面说的是单一的绝对定位，而在实际的应用中我们常常会需要用到一种特别的形式。即希望定位元素要有绝对定位的特性，但是又希望绝对定位的坐标原点可以固 定在网页中的某一个点，当这个点被移动时绝对位定元素能保证相对于这个原坐标的相对位置。也就是说需要这个绝对定位要跟着网页移动，而并且是因定在网页的 某一个固定位置。通常当网页是居中形式的时候这种效果就会显得特别的重要。要实现这种效果基本方式就是为这个绝对定位的父级设置为相对定位或是绝对定位。 那么绝对定位的坐标就会以父级为坐标起始点。</p><p>虽然是如此，但是这个坐标原点却并不是父级的坐标原点，这是一个很奇怪的坐标位置。我们看一下模型图示：</p></div><div align=\"left\"><p align=\"left\">我们看到，这个图中父级为黑灰色区块，子级为青色区块。父级是相对定位，子级是绝对定位。子级 设置了顶部位移50个像素，左倾位移50个像素。那么我们看，子级的坐标原点并不是从父级的坐标原点位移50个像素，而是从父级块的padding左上边 缘点为坐标起始点（即A 点）。而父级这里如果要产生位置移动，或是浏览器窗口大小有所变动都不会影响到这个绝对定位元素与父级的相对定位元素之间的位置关系。这个子级也不用调整 数值。</p><p>这是一种很特别并且也是非常实用的应用方式。如果你之前对于定位的控制并不自如的话，相信看完对这里对定位的解释一定可以把定位使用得随心所欲。</p><p>4.总在视线里的元素 （固定定位）</p><p><strong>&nbsp;&nbsp;&nbsp; position:fixed</strong>; 他的含义就是：固定定位。这个固定与绝对定位很像，唯一不同的是绝对定位是被固定在网页中的某一个位置，而固定定位则是固定在浏览器的视框位置。</p></div>','0',2,'1',0,'',0,0,286,1499764652,1499916156,'够过瘾——挨踢男的葵花宝典','','',''),
(9,6,1,'admin','PHP实现长文章分页','PHP实现长文章分页,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','cltphp,当文章内容特长时，为了方便阅读和页面展示我们一般将内容分页来显示，如织梦CMS。而一般分页处理是在后台发布文章的时候就将提交的内容生成多个分页后的静态文件。本文我们结合实例来讲解采用PHP动态将长文章内容进行分页处理。','<h4>如何分页</h4><p>手动分页：一般在编辑内容时加入特殊分页标记，如{pages}，提交后，PHP程序会根据分页符处理分页，生成不同的静态页面。这种分页方法分页准确，但是需要人工手动添加分页符，工作量大。</p><p>自动分页：PHP程序会根据设置好的分页符将内容进行分页，然后生成不同的静态页面。该方法效率高，对处理不同的html代码标签要求高。</p><p>前端JS分页：使用Javascript将长文章内容截取分段，根据请求展示不同的分段内容，达到分页效果。这种方法一次将内容读取，由前端js处理分页，体验好。</p><p>本文实例代码讲解的是采用PHP将长文章内容分页，可以自动和手动分页。至于生成静态html页面不在本文讲解范围内，后面我们会专门讲解生成静态方面的文章介绍。</p><h4>分页类</h4><pre class=\"prettyprint lang-php\"><span class=\"pun\"><span class=\"pln\">php     \n</span><span class=\"com\">/*   \n*  长文章分页类      \n*/</span><span class=\"pln\">   \n    </span><span class=\"kwd\">class</span><span class=\"pln\"> cutpage</span><span class=\"pun\">{</span><span class=\"pln\">     \n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $pagestr</span><span class=\"pun\">;</span><span class=\"pln\">       </span><span class=\"com\">//被切分的内容     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $pagearr</span><span class=\"pun\">;</span><span class=\"pln\">       </span><span class=\"com\">//被切分文字的数组格式     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $sum_word</span><span class=\"pun\">;</span><span class=\"pln\">      </span><span class=\"com\">//总字数(UTF-8格式的中文字符也包括)     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $sum_page</span><span class=\"pun\">;</span><span class=\"pln\">      </span><span class=\"com\">//总页数     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $page_word</span><span class=\"pun\">;</span><span class=\"pln\">     </span><span class=\"com\">//一页多少字     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $cut_tag</span><span class=\"pun\">;</span><span class=\"pln\">       </span><span class=\"com\">//自动分页符     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $cut_custom</span><span class=\"pun\">;</span><span class=\"pln\">    </span><span class=\"com\">//手动分页符     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $ipage</span><span class=\"pun\">;</span><span class=\"pln\">         </span><span class=\"com\">//当前切分的页数，第几页     </span><span class=\"pln\">\n        </span><span class=\"kwd\">private</span><span class=\"pln\"> $url</span><span class=\"pun\">;</span><span class=\"pln\">     \n         \n        </span><span class=\"kwd\">function</span><span class=\"pln\"> __construct</span><span class=\"pun\">(</span><span class=\"pln\">$pagestr</span><span class=\"pun\">,</span><span class=\"pln\">$page_word</span><span class=\"pun\">=</span><span class=\"lit\">1000</span><span class=\"pun\">){</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word </span><span class=\"pun\">=</span><span class=\"pln\"> $page_word</span><span class=\"pun\">;</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_tag </span><span class=\"pun\">=</span><span class=\"pln\"> array</span><span class=\"pun\">(</span><span class=\"str\">\"\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"<p></p>\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"<br>\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"”。\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"。\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\".\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"！\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"……\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\"？\"</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"str\">\",\"</span><span class=\"pun\">);</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_custom </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\"{nextpage}\"</span><span class=\"pun\">;</span><span class=\"pln\">     \n            $tmp_page </span><span class=\"pun\">=</span><span class=\"pln\"> intval</span><span class=\"pun\">(</span><span class=\"pln\">trim</span><span class=\"pun\">(</span><span class=\"pln\">$_GET</span><span class=\"pun\">[</span><span class=\"str\">\"ipage\"</span><span class=\"pun\">]));</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">ipage </span><span class=\"pun\">=</span><span class=\"pln\"> $tmp_page</span><span class=\"pun\">&gt;</span><span class=\"lit\">1</span><span class=\"pun\">?</span><span class=\"pln\">$tmp_page</span><span class=\"pun\">:</span><span class=\"lit\">1</span><span class=\"pun\">;</span><span class=\"pln\">  \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr </span><span class=\"pun\">=</span><span class=\"pln\"> $pagestr</span><span class=\"pun\">;</span><span class=\"pln\"> \n        </span><span class=\"pun\">}</span><span class=\"pln\">     \n         \n        </span><span class=\"kwd\">function</span><span class=\"pln\"> cut_str</span><span class=\"pun\">(){</span><span class=\"pln\">     \n            $str_len_word </span><span class=\"pun\">=</span><span class=\"pln\"> strlen</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">);</span><span class=\"pln\">     </span><span class=\"com\">//获取使用strlen得到的字符总数     </span><span class=\"pln\">\n            $i </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">;</span><span class=\"pln\">     \n            </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$str_len_word</span><span class=\"pun\">&lt;=</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">){</span><span class=\"pln\">   </span><span class=\"com\">//如果总字数小于一页显示字数     </span><span class=\"pln\">\n                $page_arr</span><span class=\"pun\">[</span><span class=\"pln\">$i</span><span class=\"pun\">]</span><span class=\"pln\"> </span><span class=\"pun\">=</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">;</span><span class=\"pln\">     \n            </span><span class=\"pun\">}</span><span class=\"kwd\">else</span><span class=\"pun\">{</span><span class=\"pln\">     \n                </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">strpos</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_custom</span><span class=\"pun\">)){</span><span class=\"pln\">     \n                    $page_arr </span><span class=\"pun\">=</span><span class=\"pln\"> explode</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_custom</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">);</span><span class=\"pln\">     \n                </span><span class=\"pun\">}</span><span class=\"kwd\">else</span><span class=\"pun\">{</span><span class=\"pln\">     \n                    $str_first </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">);</span><span class=\"pln\">   </span><span class=\"com\">//0-page_word个文字    cutStr为func.global中的函数     </span><span class=\"pln\">\n                    </span><span class=\"kwd\">foreach</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_tag </span><span class=\"kwd\">as</span><span class=\"pln\"> $v</span><span class=\"pun\">){</span><span class=\"pln\">     \n                        $cut_start </span><span class=\"pun\">=</span><span class=\"pln\"> strrpos</span><span class=\"pun\">(</span><span class=\"pln\">$str_first</span><span class=\"pun\">,</span><span class=\"pln\"> $v</span><span class=\"pun\">);</span><span class=\"pln\">       </span><span class=\"com\">//逆向查找第一个分页符的位置     </span><span class=\"pln\">\n                        </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$cut_start</span><span class=\"pun\">){</span><span class=\"pln\">     \n                            $page_arr</span><span class=\"pun\">[</span><span class=\"pln\">$i</span><span class=\"pun\">++]</span><span class=\"pln\"> </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">,</span><span class=\"pln\"> $cut_start</span><span class=\"pun\">).</span><span class=\"pln\">$v</span><span class=\"pun\">;</span><span class=\"pln\">     \n                            $cut_start </span><span class=\"pun\">=</span><span class=\"pln\"> $cut_start </span><span class=\"pun\">+</span><span class=\"pln\"> strlen</span><span class=\"pun\">(</span><span class=\"pln\">$v</span><span class=\"pun\">);</span><span class=\"pln\">     \n                            </span><span class=\"kwd\">break</span><span class=\"pun\">;</span><span class=\"pln\">     \n                        </span><span class=\"pun\">}</span><span class=\"pln\">     \n                    </span><span class=\"pun\">}</span><span class=\"pln\">     \n                    </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">((</span><span class=\"pln\">$cut_start</span><span class=\"pun\">+</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">)&gt;=</span><span class=\"pln\">$str_len_word</span><span class=\"pun\">){</span><span class=\"pln\">  </span><span class=\"com\">//如果超过总字数     </span><span class=\"pln\">\n                        $page_arr</span><span class=\"pun\">[</span><span class=\"pln\">$i</span><span class=\"pun\">++]</span><span class=\"pln\"> </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> $cut_start</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">);</span><span class=\"pln\">     \n                    </span><span class=\"pun\">}</span><span class=\"kwd\">else</span><span class=\"pun\">{</span><span class=\"pln\">     \n                        </span><span class=\"kwd\">while</span><span class=\"pln\"> </span><span class=\"pun\">((</span><span class=\"pln\">$cut_start</span><span class=\"pun\">+</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">)&lt;</span><span class=\"pln\">$str_len_word</span><span class=\"pun\">){</span><span class=\"pln\">     \n                            </span><span class=\"kwd\">foreach</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_tag </span><span class=\"kwd\">as</span><span class=\"pln\"> $v</span><span class=\"pun\">){</span><span class=\"pln\">     \n                                $str_tmp </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> $cut_start</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">);</span><span class=\"pln\">        </span><span class=\"com\">//取第cut_start个字后的page_word个字符     </span><span class=\"pln\">\n                                $cut_tmp </span><span class=\"pun\">=</span><span class=\"pln\"> strrpos</span><span class=\"pun\">(</span><span class=\"pln\">$str_tmp</span><span class=\"pun\">,</span><span class=\"pln\"> $v</span><span class=\"pun\">);</span><span class=\"pln\">       </span><span class=\"com\">//找出从第cut_start个字之后，page_word个字之间，逆向查找第一个分页符的位置     </span><span class=\"pln\">\n                                </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">$cut_tmp</span><span class=\"pun\">){</span><span class=\"pln\">     \n                                    $page_arr</span><span class=\"pun\">[</span><span class=\"pln\">$i</span><span class=\"pun\">++]</span><span class=\"pln\"> </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$str_tmp</span><span class=\"pun\">,</span><span class=\"pln\"> </span><span class=\"lit\">0</span><span class=\"pun\">,</span><span class=\"pln\"> $cut_tmp</span><span class=\"pun\">).</span><span class=\"pln\">$v</span><span class=\"pun\">;</span><span class=\"pln\">     \n                                    $cut_start </span><span class=\"pun\">=</span><span class=\"pln\"> $cut_start </span><span class=\"pun\">+</span><span class=\"pln\"> $cut_tmp </span><span class=\"pun\">+</span><span class=\"pln\"> strlen</span><span class=\"pun\">(</span><span class=\"pln\">$v</span><span class=\"pun\">);</span><span class=\"pln\">     \n                                    </span><span class=\"kwd\">break</span><span class=\"pun\">;</span><span class=\"pln\">     \n                                </span><span class=\"pun\">}</span><span class=\"pln\">     \n                            </span><span class=\"pun\">}</span><span class=\"pln\">       \n                        </span><span class=\"pun\">}</span><span class=\"pln\">     \n                        </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">((</span><span class=\"pln\">$cut_start</span><span class=\"pun\">+</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">)&gt;</span><span class=\"pln\">$str_len_word</span><span class=\"pun\">){</span><span class=\"pln\">     \n                            $page_arr</span><span class=\"pun\">[</span><span class=\"pln\">$i</span><span class=\"pun\">++]</span><span class=\"pln\"> </span><span class=\"pun\">=</span><span class=\"pln\"> substr</span><span class=\"pun\">(</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagestr</span><span class=\"pun\">,</span><span class=\"pln\"> $cut_start</span><span class=\"pun\">,</span><span class=\"pln\"> $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">page_word</span><span class=\"pun\">);</span><span class=\"pln\">     \n                        </span><span class=\"pun\">}</span><span class=\"pln\">     \n                    </span><span class=\"pun\">}</span><span class=\"pln\">     \n                </span><span class=\"pun\">}</span><span class=\"pln\">     \n            </span><span class=\"pun\">}</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">sum_page </span><span class=\"pun\">=</span><span class=\"pln\"> count</span><span class=\"pun\">(</span><span class=\"pln\">$page_arr</span><span class=\"pun\">);</span><span class=\"pln\">     </span><span class=\"com\">//总页数     </span><span class=\"pln\">\n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagearr </span><span class=\"pun\">=</span><span class=\"pln\"> $page_arr</span><span class=\"pun\">;</span><span class=\"pln\">   \n            </span><span class=\"kwd\">return</span><span class=\"pln\"> $page_arr</span><span class=\"pun\">;</span><span class=\"pln\"> \n        </span><span class=\"pun\">}</span><span class=\"pln\">     \n        </span><span class=\"com\">//显示上一条，下一条     </span><span class=\"pln\">\n        </span><span class=\"kwd\">function</span><span class=\"pln\"> pagenav</span><span class=\"pun\">(){</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">set_url</span><span class=\"pun\">();</span><span class=\"pln\">     \n            $str </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\'\'</span><span class=\"pun\">;</span><span class=\"pln\"> \n             \n            </span><span class=\"com\">//$str .= $this-&gt;ipage.\'/\'.$this-&gt;sum_page; </span><span class=\"pln\">\n             \n            </span><span class=\"kwd\">for</span><span class=\"pun\">(</span><span class=\"pln\">$i</span><span class=\"pun\">=</span><span class=\"lit\">1</span><span class=\"pun\">;</span><span class=\"pln\">$i</span><span class=\"pun\">&lt;=</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">sum_page</span><span class=\"pun\">;</span><span class=\"pln\">$i</span><span class=\"pun\">++){</span><span class=\"pln\"> \n                </span><span class=\"kwd\">if</span><span class=\"pun\">(</span><span class=\"pln\">$i</span><span class=\"pun\">==</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">ipage</span><span class=\"pun\">)</span><span class=\"pln\"> </span><span class=\"pun\">{</span><span class=\"pln\"> \n                    $str</span><span class=\"pun\">.=</span><span class=\"pln\"> </span><span class=\"str\">\"<a href=\"http://cltphp.com/admin/article/edit.html?id=23&amp;catid=50#\" class=\"cur\">\"</a></span><a href=\"http://cltphp.com/admin/article/edit.html?id=23&amp;catid=50#\" class=\"cur\"><span class=\"pun\">.</span><span class=\"pln\">$i</span><span class=\"pun\">.</span><span class=\"str\">\"</span></a> \"</span><span class=\"pun\">;</span><span class=\"pln\"> \n                </span><span class=\"pun\">}</span><span class=\"kwd\">else</span><span class=\"pun\">{</span><span class=\"pln\"> \n                    $str</span><span class=\"pun\">.=</span><span class=\"pln\"> </span><span class=\"str\">\"<a href=\"http://cltphp.com/admin/article/edit.html?id=23&amp;catid=50\" <=\"\" span=\"\"><span class=\"pun\">.</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">url</span><span class=\"pun\">.</span><span class=\"pln\">$i</span><span class=\"pun\">.</span><span class=\"str\">\"\"&gt;\"</span></a></span><a href=\"http://cltphp.com/admin/article/edit.html?id=23&amp;catid=50\" <=\"\" span=\"\"><span class=\"pun\">.</span><span class=\"pln\">$this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">url</span><span class=\"pun\">.</span><span class=\"pln\">$i</span><span class=\"pun\">.</span><span class=\"str\">\"\"&gt;<span class=\"pun\">.</span><span class=\"pln\">$i</span><span class=\"pun\">.</span><span class=\"str\">\"</span></span></a> \"<span class=\"pun\">;</span><span class=\"pln\"> \n                </span><span class=\"pun\">}</span><span class=\"pln\"> \n            </span><span class=\"pun\">}</span><span class=\"pln\"> \n             \n                    \n            </span><span class=\"kwd\">return</span><span class=\"pln\"> $str</span><span class=\"pun\">;</span><span class=\"pln\">     \n        </span><span class=\"pun\">}</span><span class=\"pln\">     \n           \n        </span><span class=\"kwd\">function</span><span class=\"pln\"> set_url</span><span class=\"pun\">(){</span><span class=\"pln\">     \n            parse_str</span><span class=\"pun\">(</span><span class=\"pln\">$_SERVER</span><span class=\"pun\">[</span><span class=\"str\">\"QUERY_STRING\"</span><span class=\"pun\">],</span><span class=\"pln\"> $arr_url</span><span class=\"pun\">);</span><span class=\"pln\">     \n            unset</span><span class=\"pun\">(</span><span class=\"pln\">$arr_url</span><span class=\"pun\">[</span><span class=\"str\">\"ipage\"</span><span class=\"pun\">]);</span><span class=\"pln\">     \n            </span><span class=\"kwd\">if</span><span class=\"pln\"> </span><span class=\"pun\">(</span><span class=\"pln\">empty</span><span class=\"pun\">(</span><span class=\"pln\">$arr_url</span><span class=\"pun\">)){</span><span class=\"pln\">     \n                $str </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\"ipage=\"</span><span class=\"pun\">;</span><span class=\"pln\">     \n            </span><span class=\"pun\">}</span><span class=\"kwd\">else</span><span class=\"pun\">{</span><span class=\"pln\">     \n                $str </span><span class=\"pun\">=</span><span class=\"pln\"> http_build_query</span><span class=\"pun\">(</span><span class=\"pln\">$arr_url</span><span class=\"pun\">).</span><span class=\"str\">\"&amp;ipage=\"</span><span class=\"pun\">;</span><span class=\"pln\">     \n            </span><span class=\"pun\">}</span><span class=\"pln\">     \n            $this</span><span class=\"pun\">-&gt;</span><span class=\"pln\">url </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"str\">\"http://\"</span><span class=\"pun\">.</span><span class=\"pln\">$_SERVER</span><span class=\"pun\">[</span><span class=\"str\">\"HTTP_HOST\"</span><span class=\"pun\">].</span><span class=\"pln\">$_SERVER</span><span class=\"pun\">[</span><span class=\"str\">\"PHP_SELF\"</span><span class=\"pun\">].</span><span class=\"str\">\"?\"</span><span class=\"pun\">.</span><span class=\"pln\">$str</span><span class=\"pun\">;</span><span class=\"pln\">     \n        </span><span class=\"pun\">}</span><span class=\"pln\">     \n    </span><span class=\"pun\">}</span><span class=\"pln\">     \n</span><span class=\"pun\">?&gt;</span><span class=\"pln\"> </span></pre><p>以上cutpage类可以非常好的处理内容分页，能处理不同html标签给分页带来的麻烦。如果内容设置了分页符{nextpage}，则会优先自动将内容按分页符分页。</p><h4>调用分页类</h4><p>我们假设读取了文件text.txt的文章内容，实际项目中应该是表单提交长内容或者读取数据库相关表的内容。然后实例化分页类，然后根据当前页调用对应分页的内容并输出，以及输出分页条。</p><pre class=\"prettyprint lang-php\"><span class=\"pun\"><span class=\"pln\">php \n$content </span><span class=\"pun\">=</span><span class=\"pln\"> file_get_contents</span><span class=\"pun\">(</span><span class=\"str\">\'text.txt\'</span><span class=\"pun\">);</span><span class=\"pln\">     \n    $ipage </span><span class=\"pun\">=</span><span class=\"pln\"> $_GET</span><span class=\"pun\">[</span><span class=\"str\">\"ipage\"</span><span class=\"pun\">]?</span><span class=\"pln\"> intval</span><span class=\"pun\">(</span><span class=\"pln\">$_GET</span><span class=\"pun\">[</span><span class=\"str\">\"ipage\"</span><span class=\"pun\">]):</span><span class=\"lit\">1</span><span class=\"pun\">;</span><span class=\"pln\">     \n    $CP </span><span class=\"pun\">=</span><span class=\"pln\"> </span><span class=\"kwd\">new</span><span class=\"pln\"> cutpage</span><span class=\"pun\">(</span><span class=\"pln\">$content</span><span class=\"pun\">);</span><span class=\"pln\">     \n    $page </span><span class=\"pun\">=</span><span class=\"pln\"> $CP</span><span class=\"pun\">-&gt;</span><span class=\"pln\">cut_str</span><span class=\"pun\">();</span><span class=\"pln\">   \n    echo $page</span><span class=\"pun\">[</span><span class=\"pln\">$ipage</span><span class=\"pun\">-</span><span class=\"lit\">1</span><span class=\"pun\">];</span><span class=\"pln\">    \n    echo $CP</span><span class=\"pun\">-&gt;</span><span class=\"pln\">pagenav</span><span class=\"pun\">();</span><span class=\"pln\"> \n</span><span class=\"pun\">?&gt;</span><span class=\"pln\"> </span></span></pre><p>值得注意的是，使用统一UTF-8的文件编码，会让你的编码工作更加顺畅。</p>','0',2,'1',0,'',0,0,311,1499764826,1499916131,'够过瘾——挨踢男的葵花宝典','','',''),
(10,6,1,'admin','PHP 汉字转拼音函数','PHP 汉字转拼音函数,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','PHP 汉字转拼音函数,CLTPHP,CLTPHP内容管理系统,thinkphp,thinkphp内容管理系统','<p><pre><span>function </span><span>Pinyin</span><span>(</span><span>$_String</span><span>, </span><span>$_Code</span><span>=</span><span>\'UTF8\'</span><span>){ </span><span>//GBK页面可改为gb2312，其他随意填写为UTF8<br></span><span>    </span><span>$_DataKey </span><span>= </span><span>\"a|ai|an|ang|ao|ba|bai|ban|bang|bao|bei|ben|beng|bi|bian|biao|bie|bin|bing|bo|bu|ca|cai|can|cang|cao|ce|ceng|cha\"</span><span>.<br></span><span>        </span><span>\"|chai|chan|chang|chao|che|chen|cheng|chi|chong|chou|chu|chuai|chuan|chuang|chui|chun|chuo|ci|cong|cou|cu|\"</span><span>.<br></span><span>        </span><span>\"cuan|cui|cun|cuo|da|dai|dan|dang|dao|de|deng|di|dian|diao|die|ding|diu|dong|dou|du|duan|dui|dun|duo|e|en|er\"</span><span>.<br></span><span>        </span><span>\"|fa|fan|fang|fei|fen|feng|fo|fou|fu|ga|gai|gan|gang|gao|ge|gei|gen|geng|gong|gou|gu|gua|guai|guan|guang|gui\"</span><span>.<br></span><span>        </span><span>\"|gun|guo|ha|hai|han|hang|hao|he|hei|hen|heng|hong|hou|hu|hua|huai|huan|huang|hui|hun|huo|ji|jia|jian|jiang\"</span><span>.<br></span><span>        </span><span>\"|jiao|jie|jin|jing|jiong|jiu|ju|juan|jue|jun|ka|kai|kan|kang|kao|ke|ken|keng|kong|kou|ku|kua|kuai|kuan|kuang\"</span><span>.<br></span><span>        </span><span>\"|kui|kun|kuo|la|lai|lan|lang|lao|le|lei|leng|li|lia|lian|liang|liao|lie|lin|ling|liu|long|lou|lu|lv|luan|lue\"</span><span>.<br></span><span>        </span><span>\"|lun|luo|ma|mai|man|mang|mao|me|mei|men|meng|mi|mian|miao|mie|min|ming|miu|mo|mou|mu|na|nai|nan|nang|nao|ne\"</span><span>.<br></span><span>        </span><span>\"|nei|nen|neng|ni|nian|niang|niao|nie|nin|ning|niu|nong|nu|nv|nuan|nue|nuo|o|ou|pa|pai|pan|pang|pao|pei|pen\"</span><span>.<br></span><span>        </span><span>\"|peng|pi|pian|piao|pie|pin|ping|po|pu|qi|qia|qian|qiang|qiao|qie|qin|qing|qiong|qiu|qu|quan|que|qun|ran|rang\"</span><span>.<br></span><span>        </span><span>\"|rao|re|ren|reng|ri|rong|rou|ru|ruan|rui|run|ruo|sa|sai|san|sang|sao|se|sen|seng|sha|shai|shan|shang|shao|\"</span><span>.<br></span><span>        </span><span>\"she|shen|sheng|shi|shou|shu|shua|shuai|shuan|shuang|shui|shun|shuo|si|song|sou|su|suan|sui|sun|suo|ta|tai|\"</span><span>.<br></span><span>        </span><span>\"tan|tang|tao|te|teng|ti|tian|tiao|tie|ting|tong|tou|tu|tuan|tui|tun|tuo|wa|wai|wan|wang|wei|wen|weng|wo|wu\"</span><span>.<br></span><span>        </span><span>\"|xi|xia|xian|xiang|xiao|xie|xin|xing|xiong|xiu|xu|xuan|xue|xun|ya|yan|yang|yao|ye|yi|yin|ying|yo|yong|you\"</span><span>.<br></span><span>        </span><span>\"|yu|yuan|yue|yun|za|zai|zan|zang|zao|ze|zei|zen|zeng|zha|zhai|zhan|zhang|zhao|zhe|zhen|zheng|zhi|zhong|\"</span><span>.<br></span><span>        </span><span>\"zhou|zhu|zhua|zhuai|zhuan|zhuang|zhui|zhun|zhuo|zi|zong|zou|zu|zuan|zui|zun|zuo\"</span><span>;<br></span><span>    </span><span>$_DataValue </span><span>= </span><span>\"-20319|-20317|-20304|-20295|-20292|-20283|-20265|-20257|-20242|-20230|-20051|-20036|-20032|-20026|-20002|-19990\"</span><span>.<br></span><span>        </span><span>\"|-19986|-19982|-19976|-19805|-19784|-19775|-19774|-19763|-19756|-19751|-19746|-19741|-19739|-19728|-19725\"</span><span>.<br></span><span>        </span><span>\"|-19715|-19540|-19531|-19525|-19515|-19500|-19484|-19479|-19467|-19289|-19288|-19281|-19275|-19270|-19263\"</span><span>.<br></span><span>        </span><span>\"|-19261|-19249|-19243|-19242|-19238|-19235|-19227|-19224|-19218|-19212|-19038|-19023|-19018|-19006|-19003\"</span><span>.<br></span><span>        </span><span>\"|-18996|-18977|-18961|-18952|-18783|-18774|-18773|-18763|-18756|-18741|-18735|-18731|-18722|-18710|-18697\"</span><span>.<br></span><span>        </span><span>\"|-18696|-18526|-18518|-18501|-18490|-18478|-18463|-18448|-18447|-18446|-18239|-18237|-18231|-18220|-18211\"</span><span>.<br></span><span>        </span><span>\"|-18201|-18184|-18183|-18181|-18012|-17997|-17988|-17970|-17964|-17961|-17950|-17947|-17931|-17928|-17922\"</span><span>.<br></span><span>        </span><span>\"|-17759|-17752|-17733|-17730|-17721|-17703|-17701|-17697|-17692|-17683|-17676|-17496|-17487|-17482|-17468\"</span><span>.<br></span><span>        </span><span>\"|-17454|-17433|-17427|-17417|-17202|-17185|-16983|-16970|-16942|-16915|-16733|-16708|-16706|-16689|-16664\"</span><span>.<br></span><span>        </span><span>\"|-16657|-16647|-16474|-16470|-16465|-16459|-16452|-16448|-16433|-16429|-16427|-16423|-16419|-16412|-16407\"</span><span>.<br></span><span>        </span><span>\"|-16403|-16401|-16393|-16220|-16216|-16212|-16205|-16202|-16187|-16180|-16171|-16169|-16158|-16155|-15959\"</span><span>.<br></span><span>        </span><span>\"|-15958|-15944|-15933|-15920|-15915|-15903|-15889|-15878|-15707|-15701|-15681|-15667|-15661|-15659|-15652\"</span><span>.<br></span><span>        </span><span>\"|-15640|-15631|-15625|-15454|-15448|-15436|-15435|-15419|-15416|-15408|-15394|-15385|-15377|-15375|-15369\"</span><span>.<br></span><span>        </span><span>\"|-15363|-15362|-15183|-15180|-15165|-15158|-15153|-15150|-15149|-15144|-15143|-15141|-15140|-15139|-15128\"</span><span>.<br></span><span>        </span><span>\"|-15121|-15119|-15117|-15110|-15109|-14941|-14937|-14933|-14930|-14929|-14928|-14926|-14922|-14921|-14914\"</span><span>.<br></span><span>        </span><span>\"|-14908|-14902|-14894|-14889|-14882|-14873|-14871|-14857|-14678|-14674|-14670|-14668|-14663|-14654|-14645\"</span><span>.<br></span><span>        </span><span>\"|-14630|-14594|-14429|-14407|-14399|-14384|-14379|-14368|-14355|-14353|-14345|-14170|-14159|-14151|-14149\"</span><span>.<br></span><span>        </span><span>\"|-14145|-14140|-14137|-14135|-14125|-14123|-14122|-14112|-14109|-14099|-14097|-14094|-14092|-14090|-14087\"</span><span>.<br></span><span>        </span><span>\"|-14083|-13917|-13914|-13910|-13907|-13906|-13905|-13896|-13894|-13878|-13870|-13859|-13847|-13831|-13658\"</span><span>.<br></span><span>        </span><span>\"|-13611|-13601|-13406|-13404|-13400|-13398|-13395|-13391|-13387|-13383|-13367|-13359|-13356|-13343|-13340\"</span><span>.<br></span><span>        </span><span>\"|-13329|-13326|-13318|-13147|-13138|-13120|-13107|-13096|-13095|-13091|-13076|-13068|-13063|-13060|-12888\"</span><span>.<br></span><span>        </span><span>\"|-12875|-12871|-12860|-12858|-12852|-12849|-12838|-12831|-12829|-12812|-12802|-12607|-12597|-12594|-12585\"</span><span>.<br></span><span>        </span><span>\"|-12556|-12359|-12346|-12320|-12300|-12120|-12099|-12089|-12074|-12067|-12058|-12039|-11867|-11861|-11847\"</span><span>.<br></span><span>        </span><span>\"|-11831|-11798|-11781|-11604|-11589|-11536|-11358|-11340|-11339|-11324|-11303|-11097|-11077|-11067|-11055\"</span><span>.<br></span><span>        </span><span>\"|-11052|-11045|-11041|-11038|-11024|-11020|-11019|-11018|-11014|-10838|-10832|-10815|-10800|-10790|-10780\"</span><span>.<br></span><span>        </span><span>\"|-10764|-10587|-10544|-10533|-10519|-10331|-10329|-10328|-10322|-10315|-10309|-10307|-10296|-10281|-10274\"</span><span>.<br></span><span>        </span><span>\"|-10270|-10262|-10260|-10256|-10254\"</span><span>;<br></span><span>    </span><span>$_TDataKey </span><span>= explode(</span><span>\'|\'</span><span>, </span><span>$_DataKey</span><span>)</span><span>;<br></span><span>    </span><span>$_TDataValue </span><span>= explode(</span><span>\'|\'</span><span>, </span><span>$_DataValue</span><span>)</span><span>;<br></span><span>    </span><span>$_Data </span><span>= array_combine(</span><span>$_TDataKey</span><span>, </span><span>$_TDataValue</span><span>)</span><span>;<br></span><span>    </span><span>arsort(</span><span>$_Data</span><span>)</span><span>;<br></span><span>    </span><span>reset(</span><span>$_Data</span><span>)</span><span>;<br></span><span>    </span><span>if</span><span>(</span><span>$_Code</span><span>!= </span><span>\'gb2312\'</span><span>) </span><span>$_String </span><span>= _U2_Utf8_Gb(</span><span>$_String</span><span>)</span><span>;<br></span><span>    </span><span>$_Res </span><span>= </span><span>\'\'</span><span>;<br></span><span>    </span><span>for</span><span>(</span><span>$i</span><span>=</span><span>0</span><span>; </span><span>$i$_P </span><span>= ord(substr(</span><span>$_String</span><span>, </span><span>$i</span><span>, </span><span>1</span><span>))</span><span>;<br></span><span>    </span><span>if</span><span>(</span><span>$_P</span><span>&gt;</span><span>160</span><span>) {<br></span><span>        </span><span>$_Q </span><span>= ord(substr(</span><span>$_String</span><span>, </span><span>++</span><span>$i</span><span>, </span><span>1</span><span>))</span><span>; </span><span>$_P </span><span>= </span><span>$_P</span><span>*</span><span>256 </span><span>+ </span><span>$_Q </span><span>- </span><span>65536</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>$_Res </span><span>.= _Pinyin(</span><span>$_P</span><span>, </span><span>$_Data</span><span>)</span><span>;<br></span><span>}<br></span><span>return </span><span>preg_replace(</span><span>\"/[^a-z0-9]*/\"</span><span>, </span><span>\'\'</span><span>, </span><span>$_Res</span><span>)</span><span>;<br></span><span>}<br></span><span>function </span><span>_Pinyin</span><span>(</span><span>$_Num</span><span>, </span><span>$_Data</span><span>){<br></span><span>    </span><span>if</span><span>(</span><span>$_Num</span><span>&gt;</span><span>0 </span><span>&amp;&amp; </span><span>$_Num</span><span>&lt;</span><span>160 </span><span>){<br></span><span>        </span><span>return </span><span>chr(</span><span>$_Num</span><span>)</span><span>;<br></span><span>    </span><span>}</span><span>elseif</span><span>(</span><span>$_Num</span><span>&lt;-</span><span>20319 </span><span>|| </span><span>$_Num</span><span>&gt;-</span><span>10247</span><span>){<br></span><span>        </span><span>return </span><span>\'\'</span><span>;<br></span><span>    </span><span>}</span><span>else</span><span>{<br></span><span>        </span><span>foreach</span><span>(</span><span>$_Data </span><span>as </span><span>$k</span><span>=&gt;</span><span>$v</span><span>){ </span><span>if</span><span>(</span><span>$v</span><span>&lt;=</span><span>$_Num</span><span>) </span><span>break</span><span>; </span><span>}<br></span><span>        </span><span>return </span><span>$k</span><span>;<br></span><span>    </span><span>}<br></span><span>}<br></span><span>function </span><span>_U2_Utf8_Gb</span><span>(</span><span>$_C</span><span>){<br></span><span>    </span><span>$_String </span><span>= </span><span>\'\'</span><span>;<br></span><span>    </span><span>if</span><span>(</span><span>$_C </span><span>&lt; </span><span>0x80</span><span>){<br></span><span>        </span><span>$_String </span><span>.= </span><span>$_C</span><span>;<br></span><span>    </span><span>}</span><span>elseif</span><span>(</span><span>$_C </span><span>&lt; </span><span>0x800</span><span>) {<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0xC0 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>6</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>    </span><span>}</span><span>elseif</span><span>(</span><span>$_C </span><span>&lt; </span><span>0x10000</span><span>){<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0xE0 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>12</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>6 </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>    </span><span>}</span><span>elseif</span><span>(</span><span>$_C </span><span>&lt; </span><span>0x200000</span><span>) {<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0xF0 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>18</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>12 </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C</span><span>&gt;&gt;</span><span>6 </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>        </span><span>$_String </span><span>.= chr(</span><span>0x80 </span><span>| </span><span>$_C </span><span>&amp; </span><span>0x3F</span><span>)</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>return </span><span>iconv(</span><span>\'UTF-8\'</span><span>, </span><span>\'GB2312\'</span><span>, </span><span>$_String</span><span>)</span><span>;<br></span><span>}<br></span><span><br></span><span><br></span><span>//echo Pinyin(\'汉字\');<br></span><span>//测试<br></span><span>echo </span><span>Pinyin(</span><span>\'中文字\'</span><span>,</span><span>\'gb2312\'</span><span>)</span><span>; </span><span>//第二个参数“1”可随意设置即为utf8编码</span></pre></p><p><strlen($_string); $i++)=\"\" { <br=\"\"></strlen($_string);></p>','0',2,'1',0,'1,2,3,4',0,0,740,1499828506,1501139662,'博客园','','',''),
(11,5,1,'admin','CLTPHP4.3版本更新','CLTPHP4.3版本更新,CLTPHP,CLTPHP内容管理系统','CLTPHP4.3版本更新,CLTPHP,CLTPHP内容管理系统','<p>更新内容</p><p>1.后台模型建立重构</p><p>2.新增文件上传</p><p>3.更改标题样式和缩略图数据库存放方式</p><p>4.后台文章栏目标题样式添加</p><p>5.修改部分bug，删减了系统冗余内容</p><p><strong><em>注意：本次修改重构了模型，4.2及以前版本不可直接覆盖代码</em></strong></p><p>推荐环境：apache2.4+php5.5(以上)+mysql5.0(以上)</p><p>开发环境：phpStudy 2016 &nbsp;php5.5.38</p>','0',0,'1',0,'',0,0,807,1499828638,1505264287,'CLTPHP','http://www.cltphp.com/','',''),
(12,5,1,'admin','CLTPHP手册栏目管理更新，CLTPHP核心价值，尽在其中！','CLTPHP手册栏目管理更新，CLTPHP核心价值，尽在其中！','CLTPHP手册栏目管理更新，CLTPHP核心价值，尽在其中！','<p><a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP</a>手册栏目管理更新，CLTPHP核心价值，尽在其中。</p><p>喜欢的朋友可以购买参考</p><p>同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p>手册地址：https://www.kancloud.cn/chichu/cltphp/</p>','0',2,'1',0,'',0,0,763,1500014331,1501031503,'CLTPHP','http://www.cltphp.com/','',''),
(13,6,1,'admin','PHP获取客户端浏览器类型以及版本号','PHP获取客户端浏览器类型以及版本号','PHP获取客户端浏览器类型以及版本号','<article class=\"post-item clearfix\"><section class=\"post-entry\"><pre class=\"prettyprint lang-php\"><div class=\"line number1 index0 alt2\"><code class=\"php comments\">/**</code></div><div class=\"line number2 index1 alt1\"><code class=\"php spaces\">&nbsp;</code><code class=\"php comments\">*&nbsp;获取客户端浏览器类型</code></div><div class=\"line number3 index2 alt2\"><code class=\"php spaces\">&nbsp;</code><code class=\"php comments\">*&nbsp;@param&nbsp;&nbsp;string&nbsp;$glue&nbsp;浏览器类型和版本号之间的连接符</code></div><div class=\"line number4 index3 alt1\"><code class=\"php spaces\">&nbsp;</code><code class=\"php comments\">*&nbsp;@return&nbsp;string|array&nbsp;传递连接符则连接浏览器类型和版本号返回字符串否则直接返回数组&nbsp;false为未知浏览器类型</code></div><div class=\"line number5 index4 alt2\"><code class=\"php spaces\">&nbsp;</code><code class=\"php comments\">*/</code></div><div class=\"line number6 index5 alt1\"><code class=\"php spaces\">&nbsp;</code><code class=\"php keyword\">function</code>&nbsp;<code class=\"php plain\">get_client_browser(</code><code class=\"php variable\">$glue</code>&nbsp;<code class=\"php plain\">=&nbsp;null)&nbsp;{</code></div><div class=\"line number7 index6 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php variable\">$browser</code>&nbsp;<code class=\"php plain\">=&nbsp;</code><code class=\"php keyword\">array</code><code class=\"php plain\">();</code></div><div class=\"line number8 index7 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php variable\">$agent</code>&nbsp;<code class=\"php plain\">=&nbsp;</code><code class=\"php variable\">$_SERVER</code><code class=\"php plain\">[</code><code class=\"php string\">\'HTTP_USER_AGENT\'</code><code class=\"php plain\">];&nbsp;</code><code class=\"php comments\">//获取客户端信息</code></div><div class=\"line number9 index8 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php comments\">/*&nbsp;定义浏览器特性正则表达式&nbsp;*/</code></div><div class=\"line number10 index9 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php variable\">$regex</code>&nbsp;<code class=\"php plain\">=&nbsp;</code><code class=\"php keyword\">array</code><code class=\"php plain\">(</code></div><div class=\"line number11 index10 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php string\">\'ie\'</code>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php string\">\'/(MSIE)&nbsp;(\\d+\\.\\d)/\'</code><code class=\"php plain\">,</code></div><div class=\"line number12 index11 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php string\">\'chrome\'</code>&nbsp;&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php string\">\'/(Chrome)\\/(\\d+\\.\\d+)/\'</code><code class=\"php plain\">,</code></div><div class=\"line number13 index12 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php string\">\'firefox\'</code>&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php string\">\'/(Firefox)\\/(\\d+\\.\\d+)/\'</code><code class=\"php plain\">,</code></div><div class=\"line number14 index13 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php string\">\'opera\'</code>&nbsp;&nbsp;&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php string\">\'/(Opera)\\/(\\d+\\.\\d+)/\'</code><code class=\"php plain\">,</code></div><div class=\"line number15 index14 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php string\">\'safari\'</code>&nbsp;&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php string\">\'/Version\\/(\\d+\\.\\d+\\.\\d)&nbsp;(Safari)/\'</code><code class=\"php plain\">,</code></div><div class=\"line number16 index15 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php plain\">);</code></div><div class=\"line number17 index16 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php keyword\">foreach</code><code class=\"php plain\">(</code><code class=\"php variable\">$regex</code>&nbsp;<code class=\"php keyword\">as</code>&nbsp;<code class=\"php variable\">$type</code>&nbsp;<code class=\"php plain\">=&gt;&nbsp;</code><code class=\"php variable\">$reg</code><code class=\"php plain\">)&nbsp;{</code></div><div class=\"line number18 index17 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php plain\">preg_match(</code><code class=\"php variable\">$reg</code><code class=\"php plain\">,&nbsp;</code><code class=\"php variable\">$agent</code><code class=\"php plain\">,&nbsp;</code><code class=\"php variable\">$data</code><code class=\"php plain\">);</code></div><div class=\"line number19 index18 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php keyword\">if</code><code class=\"php plain\">(!</code><code class=\"php functions\">empty</code><code class=\"php plain\">(</code><code class=\"php variable\">$data</code><code class=\"php plain\">)&nbsp;&amp;&amp;&nbsp;</code><code class=\"php functions\">is_array</code><code class=\"php plain\">(</code><code class=\"php variable\">$data</code><code class=\"php plain\">)){</code></div><div class=\"line number20 index19 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php variable\">$browser</code>&nbsp;<code class=\"php plain\">=&nbsp;</code><code class=\"php variable\">$type</code>&nbsp;<code class=\"php plain\">===&nbsp;</code><code class=\"php string\">\'safari\'</code>&nbsp;<code class=\"php plain\">?&nbsp;</code><code class=\"php keyword\">array</code><code class=\"php plain\">(</code><code class=\"php variable\">$data</code><code class=\"php plain\">[2],&nbsp;</code><code class=\"php variable\">$data</code><code class=\"php plain\">[1])&nbsp;:&nbsp;</code><code class=\"php keyword\">array</code><code class=\"php plain\">(</code><code class=\"php variable\">$data</code><code class=\"php plain\">[1],&nbsp;</code><code class=\"php variable\">$data</code><code class=\"php plain\">[2]);</code></div><div class=\"line number21 index20 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php keyword\">break</code><code class=\"php plain\">;</code></div><div class=\"line number22 index21 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php plain\">}</code></div><div class=\"line number23 index22 alt2\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php plain\">}</code></div><div class=\"line number24 index23 alt1\"><code class=\"php spaces\">&nbsp;&nbsp;&nbsp;&nbsp;</code><code class=\"php keyword\">return</code>&nbsp;<code class=\"php functions\">empty</code><code class=\"php plain\">(</code><code class=\"php variable\">$browser</code><code class=\"php plain\">)&nbsp;?&nbsp;false&nbsp;:&nbsp;(</code><code class=\"php functions\">is_null</code><code class=\"php plain\">(</code><code class=\"php variable\">$glue</code><code class=\"php plain\">)&nbsp;?&nbsp;</code><code class=\"php variable\">$browser</code>&nbsp;<code class=\"php plain\">:&nbsp;implode(</code><code class=\"php variable\">$glue</code><code class=\"php plain\">,&nbsp;</code><code class=\"php variable\">$browser</code><code class=\"php plain\">));</code></div><div class=\"line number25 index24 alt2\"><code class=\"php spaces\">&nbsp;</code><code class=\"php plain\">}</code></div></pre><p><br></p><p></p></section></article>','0',2,'1',0,'',0,0,286,1500432973,1501031353,'PHP博客','','',''),
(14,6,1,'admin','CLTPHP产生随机字符串','CLTPHP产生随机字符串','CLTPHP产生随机字符串','<p>CLTPHP产生随机字符串</p><pre><span>/**<br></span><span>+----------------------------------------------------------<br></span><span> * 产生随机字串，可用来自动生成密码 默认长度6位 字母和数字混合<br></span><span>+----------------------------------------------------------<br></span><span> * </span><span>@param </span><span>string $len 长度<br></span><span> * </span><span>@param </span><span>string $type 字串类型<br></span><span> * 0 字母 1 数字 其它 混合<br></span><span> * </span><span>@param </span><span>string $addChars 额外字符<br></span><span>+----------------------------------------------------------<br></span><span> * </span><span>@return </span><span>string<br></span><span>+----------------------------------------------------------<br></span><span> */<br></span><span>function </span><span>rand_string</span><span>(</span><span>$len</span><span>=</span><span>6</span><span>,</span><span>$type</span><span>=</span><span>\'\'</span><span>,</span><span>$addChars</span><span>=</span><span>\'\'</span><span>) {<br></span><span>    </span><span>$str </span><span>=</span><span>\'\'</span><span>;<br></span><span>    </span><span>switch</span><span>(</span><span>$type</span><span>) {<br></span><span>        </span><span>case </span><span>0</span><span>:<br></span><span>            </span><span>$chars</span><span>=</span><span>\'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz\'</span><span>.</span><span>$addChars</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>        </span><span>case </span><span>1</span><span>:<br></span><span>            </span><span>$chars</span><span>= str_repeat(</span><span>\'0123456789\'</span><span>,</span><span>3</span><span>)</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>        </span><span>case </span><span>2</span><span>:<br></span><span>            </span><span>$chars</span><span>=</span><span>\'ABCDEFGHIJKLMNOPQRSTUVWXYZ\'</span><span>.</span><span>$addChars</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>        </span><span>case </span><span>3</span><span>:<br></span><span>            </span><span>$chars</span><span>=</span><span>\'abcdefghijklmnopqrstuvwxyz\'</span><span>.</span><span>$addChars</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>        </span><span>case </span><span>4</span><span>:<br></span><span>            </span><span>$chars </span><span>= </span><span>\"们以我到他会作时要动国产的一是工就年阶义发成部民可出能方进在了不和有大这主中人上为来分生对于学下级地个用同行面说种过命度革而多子后自社加小机也经力线本电高量长党得实家定深法表着水理化争现所二起政三好十战无农使性前等反体合斗路图把结第里正新开论之物从当两些还天资事队批点育重其思与间内去因件日利相由压员气业代全组数果期导平各基或月毛然如应形想制心样干都向变关问比展那它最及外没看治提五解系林者米群头意只明四道马认次文通但条较克又公孔领军流入接席位情运器并飞原油放立题质指建区验活众很教决特此常石强极土少已根共直团统式转别造切九你取西持总料连任志观调七么山程百报更见必真保热委手改管处己将修支识病象几先老光专什六型具示复安带每东增则完风回南广劳轮科北打积车计给节做务被整联步类集号列温装即毫知轴研单色坚据速防史拉世设达尔场织历花受求传口断况采精金界品判参层止边清至万确究书术状厂须离再目海交权且儿青才证低越际八试规斯近注办布门铁需走议县兵固除般引齿千胜细影济白格效置推空配刀叶率述今选养德话查差半敌始片施响收华觉备名红续均药标记难存测士身紧液派准斤角降维板许破述技消底床田势端感往神便贺村构照容非搞亚磨族火段算适讲按值美态黄易彪服早班麦削信排台声该击素张密害侯草何树肥继右属市严径螺检左页抗苏显苦英快称坏移约巴材省黑武培著河帝仅针怎植京助升王眼她抓含苗副杂普谈围食射源例致酸旧却充足短划剂宣环落首尺波承粉践府鱼随考刻靠够满夫失包住促枝局菌杆周护岩师举曲春元超负砂封换太模贫减阳扬江析亩木言球朝医校古呢稻宋听唯输滑站另卫字鼓刚写刘微略范供阿块某功套友限项余倒卷创律雨让骨远帮初皮播优占死毒圈伟季训控激找叫云互跟裂粮粒母练塞钢顶策双留误础吸阻故寸盾晚丝女散焊功株亲院冷彻弹错散商视艺灭版烈零室轻血倍缺厘泵察绝富城冲喷壤简否柱李望盘磁雄似困巩益洲脱投送奴侧润盖挥距触星松送获兴独官混纪依未突架宽冬章湿偏纹吃执阀矿寨责熟稳夺硬价努翻奇甲预职评读背协损棉侵灰虽矛厚罗泥辟告卵箱掌氧恩爱停曾溶营终纲孟钱待尽俄缩沙退陈讨奋械载胞幼哪剥迫旋征槽倒握担仍呀鲜吧卡粗介钻逐弱脚怕盐末阴丰雾冠丙街莱贝辐肠付吉渗瑞惊顿挤秒悬姆烂森糖圣凹陶词迟蚕亿矩康遵牧遭幅园腔订香肉弟屋敏恢忘编印蜂急拿扩伤飞露核缘游振操央伍域甚迅辉异序免纸夜乡久隶缸夹念兰映沟乙吗儒杀汽磷艰晶插埃燃欢铁补咱芽永瓦倾阵碳演威附牙芽永瓦斜灌欧献顺猪洋腐请透司危括脉宜笑若尾束壮暴企菜穗楚汉愈绿拖牛份染既秋遍锻玉夏疗尖殖井费州访吹荣铜沿替滚客召旱悟刺脑措贯藏敢令隙炉壳硫煤迎铸粘探临薄旬善福纵择礼愿伏残雷延烟句纯渐耕跑泽慢栽鲁赤繁境潮横掉锥希池败船假亮谓托伙哲怀割摆贡呈劲财仪沉炼麻罪祖息车穿货销齐鼠抽画饲龙库守筑房歌寒喜哥洗蚀废纳腹乎录镜妇恶脂庄擦险赞钟摇典柄辩竹谷卖乱虚桥奥伯赶垂途额壁网截野遗静谋弄挂课镇妄盛耐援扎虑键归符庆聚绕摩忙舞遇索顾胶羊湖钉仁音迹碎伸灯避泛亡答勇频皇柳哈揭甘诺概宪浓岛袭谁洪谢炮浇斑讯懂灵蛋闭孩释乳巨徒私银伊景坦累匀霉杜乐勒隔弯绩招绍胡呼痛峰零柴簧午跳居尚丁秦稍追梁折耗碱殊岗挖氏刃剧堆赫荷胸衡勤膜篇登驻案刊秧缓凸役剪川雪链渔啦脸户洛孢勃盟买杨宗焦赛旗滤硅炭股坐蒸凝竟陷枪黎救冒暗洞犯筒您宋弧爆谬涂味津臂障褐陆啊健尊豆拔莫抵桑坡缝警挑污冰柬嘴啥饭塑寄赵喊垫丹渡耳刨虎笔稀昆浪萨茶滴浅拥穴覆伦娘吨浸袖珠雌妈紫戏塔锤震岁貌洁剖牢锋疑霸闪埔猛诉刷狠忽灾闹乔唐漏闻沈熔氯荒茎男凡抢像浆旁玻亦忠唱蒙予纷捕锁尤乘乌智淡允叛畜俘摸锈扫毕璃宝芯爷鉴秘净蒋钙肩腾枯抛轨堂拌爸循诱祝励肯酒绳穷塘燥泡袋朗喂铝软渠颗惯贸粪综墙趋彼届墨碍启逆卸航衣孙龄岭骗休借\"</span><span>.</span><span>$addChars</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>        </span><span>default </span><span>:<br></span><span>            </span><span>// 默认去掉了容易混淆的字符oOLl和数字01，要添加请使用addChars参数<br></span><span>            </span><span>$chars</span><span>=</span><span>\'ABCDEFGHIJKMNPQRSTUVWXYZabcdefghijkmnpqrstuvwxyz23456789\'</span><span>.</span><span>$addChars</span><span>;<br></span><span>            </span><span>break</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>if</span><span>(</span><span>$len</span><span>&gt;</span><span>10 </span><span>) {</span><span>//位数过长重复字符串一定次数<br></span><span>        </span><span>$chars</span><span>= </span><span>$type</span><span>==</span><span>1</span><span>? str_repeat(</span><span>$chars</span><span>,</span><span>$len</span><span>) : str_repeat(</span><span>$chars</span><span>,</span><span>5</span><span>)</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>if</span><span>(</span><span>$type</span><span>!=</span><span>4</span><span>) {<br></span><span>        </span><span>$chars   </span><span>=   str_shuffle(</span><span>$chars</span><span>)</span><span>;<br></span><span>        </span><span>$str     </span><span>=   substr(</span><span>$chars</span><span>,</span><span>0</span><span>,</span><span>$len</span><span>)</span><span>;<br></span><span>    </span><span>}</span><span>else</span><span>{<br></span><span>        </span><span>// 中文随机字<br></span><span>        </span><span>for</span><span>(</span><span>$i</span><span>=</span><span>0</span><span>;</span><span>$i</span><span>&lt;</span><span>$len</span><span>;</span><span>$i</span><span>++){<br></span><span>            </span><span>$str</span><span>.= msubstr(</span><span>$chars</span><span>, </span><span>floor(mt_rand(</span><span>0</span><span>,</span><span>mb_strlen(</span><span>$chars</span><span>,</span><span>\'utf-8\'</span><span>)-</span><span>1</span><span>))</span><span>,</span><span>1</span><span>)</span><span>;<br></span><span>        </span><span>}<br></span><span>    }<br></span><span>    </span><span>return </span><span>$str</span><span>;<br></span><span>}</span></pre><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"syntaxhighlighter  php layui-table\"><tbody><tr><td class=\"gutter\"><br></td><td class=\"code\"><br></td></tr></tbody></table>','0',2,'1',0,'',0,0,428,1500867996,1501204238,'CLTPHP','http://www.cltphp.com/','',''),
(15,6,1,'admin','CLTPHP字符串截取','CLTPHP字符串截取','CLTPHP字符串截取','<pre><span>//字符串截取<br></span><span>function </span><span>str_cut</span><span>(</span><span>$sourcestr</span><span>,</span><span>$cutlength</span><span>,</span><span>$suffix</span><span>=</span><span>\'...\'</span><span>)<br></span><span>{<br></span><span>    </span><span>$returnstr</span><span>=</span><span>\'\'</span><span>;<br></span><span>    </span><span>$i</span><span>=</span><span>0</span><span>;<br></span><span>    </span><span>$n</span><span>=</span><span>0</span><span>;<br></span><span>    </span><span>$str_length</span><span>=strlen(</span><span>$sourcestr</span><span>)</span><span>;</span><span>//字符串的字节数<br></span><span>    </span><span>while </span><span>((</span><span>$n</span><span>&lt;</span><span>$cutlength</span><span>) </span><span>and </span><span>(</span><span>$i</span><span>&lt;=</span><span>$str_length</span><span>))<br></span><span>    {<br></span><span>        </span><span>$temp_str</span><span>=substr(</span><span>$sourcestr</span><span>,</span><span>$i</span><span>,</span><span>1</span><span>)</span><span>;<br></span><span>        </span><span>$ascnum</span><span>=Ord(</span><span>$temp_str</span><span>)</span><span>;</span><span>//得到字符串中第$i位字符的ascii码<br></span><span>        </span><span>if </span><span>(</span><span>$ascnum</span><span>&gt;=</span><span>224</span><span>)    </span><span>//如果ASCII位高与224，<br></span><span>        </span><span>{<br></span><span>            </span><span>$returnstr</span><span>=</span><span>$returnstr</span><span>.substr(</span><span>$sourcestr</span><span>,</span><span>$i</span><span>,</span><span>3</span><span>)</span><span>; </span><span>//根据UTF-8编码规范，将3个连续的字符计为单个字符<br></span><span>            </span><span>$i</span><span>=</span><span>$i</span><span>+</span><span>3</span><span>;            </span><span>//实际Byte计为3<br></span><span>            </span><span>$n</span><span>++</span><span>;            </span><span>//字串长度计1<br></span><span>        </span><span>}<br></span><span>        </span><span>elseif </span><span>(</span><span>$ascnum</span><span>&gt;=</span><span>192</span><span>) </span><span>//如果ASCII位高与192，<br></span><span>        </span><span>{<br></span><span>            </span><span>$returnstr</span><span>=</span><span>$returnstr</span><span>.substr(</span><span>$sourcestr</span><span>,</span><span>$i</span><span>,</span><span>2</span><span>)</span><span>; </span><span>//根据UTF-8编码规范，将2个连续的字符计为单个字符<br></span><span>            </span><span>$i</span><span>=</span><span>$i</span><span>+</span><span>2</span><span>;            </span><span>//实际Byte计为2<br></span><span>            </span><span>$n</span><span>++</span><span>;            </span><span>//字串长度计1<br></span><span>        </span><span>}<br></span><span>        </span><span>elseif </span><span>(</span><span>$ascnum</span><span>&gt;=</span><span>65 </span><span>&amp;&amp; </span><span>$ascnum</span><span>&lt;=</span><span>90</span><span>) </span><span>//如果是大写字母，<br></span><span>        </span><span>{<br></span><span>            </span><span>$returnstr</span><span>=</span><span>$returnstr</span><span>.substr(</span><span>$sourcestr</span><span>,</span><span>$i</span><span>,</span><span>1</span><span>)</span><span>;<br></span><span>            </span><span>$i</span><span>=</span><span>$i</span><span>+</span><span>1</span><span>;            </span><span>//实际的Byte数仍计1个<br></span><span>            </span><span>$n</span><span>++</span><span>;            </span><span>//但考虑整体美观，大写字母计成一个高位字符<br></span><span>        </span><span>}<br></span><span>        </span><span>else                </span><span>//其他情况下，包括小写字母和半角标点符号，<br></span><span>        </span><span>{<br></span><span>            </span><span>$returnstr</span><span>=</span><span>$returnstr</span><span>.substr(</span><span>$sourcestr</span><span>,</span><span>$i</span><span>,</span><span>1</span><span>)</span><span>;<br></span><span>            </span><span>$i</span><span>=</span><span>$i</span><span>+</span><span>1</span><span>;            </span><span>//实际的Byte数计1个<br></span><span>            </span><span>$n</span><span>=</span><span>$n</span><span>+</span><span>0.5</span><span>;        </span><span>//小写字母和半角标点等与半个高位字符宽...<br></span><span>        </span><span>}<br></span><span>    }<br></span><span>    </span><span>if </span><span>(</span><span>$n</span><span>&gt;</span><span>$cutlength</span><span>){<br></span><span>        </span><span>$returnstr </span><span>= </span><span>$returnstr </span><span>. </span><span>$suffix</span><span>;</span><span>//超过长度时在尾处加上省略号<br></span><span>    </span><span>}<br></span><span>    </span><span>return </span><span>$returnstr</span><span>;<br></span><span>}</span></pre>','0',2,'1',0,'',0,0,336,1501031299,1502067767,'CLTPHP','http://www.cltphp.com/','',''),
(16,5,1,'admin','CLTPHP操作开发手册已完全更新','CLTPHP操作开发手册已完全更新','CLTPHP操作开发手册已完全更新','<p>CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。</p><p>喜欢的朋友可以购买参考</p><p>同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p>手册地址：https://www.kancloud.cn/chichu/cltphp/</p>','0',2,'1',0,'',0,0,1895,1501031404,1502068026,'CLTPHP','http://www.cltphp.com/','',''),
(17,6,1,'admin','CLTPHP判断当前访问的用户是  PC端  还是 手机端','CLTPHP判断当前访问的用户是  PC端  还是 手机端','CLTPHP判断当前访问的用户是  PC端  还是 手机端','<pre><span>/**<br></span><span> * 判断当前访问的用户是  PC端  还是 手机端  返回true 为手机端  false 为PC 端<br></span><span> *  是否移动端访问访问<br></span><span> * </span><span>@return </span><span>boolean<br></span><span> */<br></span><span>function </span><span>isMobile</span><span>()<br></span><span>{<br></span><span>    </span><span>// 如果有HTTP_X_WAP_PROFILE则一定是移动设备<br></span><span>    </span><span>if </span><span>(</span><span>isset </span><span>(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_X_WAP_PROFILE\'</span><span>]))<br></span><span>        </span><span>return true</span><span>;<br></span><span><br></span><span>    </span><span>// 如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息<br></span><span>    </span><span>if </span><span>(</span><span>isset </span><span>(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_VIA\'</span><span>]))<br></span><span>    {<br></span><span>        </span><span>// 找不到为flase,否则为true<br></span><span>        </span><span>return </span><span>stristr(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_VIA\'</span><span>]</span><span>, </span><span>\"wap\"</span><span>) ? </span><span>true </span><span>: </span><span>false</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>// 脑残法，判断手机发送的客户端标志,兼容性有待提高<br></span><span>    </span><span>if </span><span>(</span><span>isset </span><span>(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_USER_AGENT\'</span><span>]))<br></span><span>    {<br></span><span>        </span><span>$clientkeywords </span><span>= </span><span>array </span><span>(</span><span>\'nokia\'</span><span>,</span><span>\'sony\'</span><span>,</span><span>\'ericsson\'</span><span>,</span><span>\'mot\'</span><span>,</span><span>\'samsung\'</span><span>,</span><span>\'htc\'</span><span>,</span><span>\'sgh\'</span><span>,</span><span>\'lg\'</span><span>,</span><span>\'sharp\'</span><span>,</span><span>\'sie-\'</span><span>,</span><span>\'philips\'</span><span>,</span><span>\'panasonic\'</span><span>,</span><span>\'alcatel\'</span><span>,</span><span>\'lenovo\'</span><span>,</span><span>\'iphone\'</span><span>,</span><span>\'ipod\'</span><span>,</span><span>\'blackberry\'</span><span>,</span><span>\'meizu\'</span><span>,</span><span>\'android\'</span><span>,</span><span>\'netfront\'</span><span>,</span><span>\'symbian\'</span><span>,</span><span>\'ucweb\'</span><span>,</span><span>\'windowsce\'</span><span>,</span><span>\'palm\'</span><span>,</span><span>\'operamini\'</span><span>,</span><span>\'operamobi\'</span><span>,</span><span>\'openwave\'</span><span>,</span><span>\'nexusone\'</span><span>,</span><span>\'cldc\'</span><span>,</span><span>\'midp\'</span><span>,</span><span>\'wap\'</span><span>,</span><span>\'mobile\'</span><span>)</span><span>;<br></span><span>        </span><span>// 从HTTP_USER_AGENT中查找手机浏览器的关键字<br></span><span>        </span><span>if </span><span>(preg_match(</span><span>\"/(\" </span><span>. implode(</span><span>\'|\'</span><span>, </span><span>$clientkeywords</span><span>) . </span><span>\")/i\"</span><span>, </span><span>strtolower(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_USER_AGENT\'</span><span>])))<br></span><span>            </span><span>return true</span><span>;<br></span><span>    </span><span>}<br></span><span>    </span><span>// 协议法，因为有可能不准确，放到最后判断<br></span><span>    </span><span>if </span><span>(</span><span>isset </span><span>(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_ACCEPT\'</span><span>]))<br></span><span>    {<br></span><span>        </span><span>// 如果只支持wml并且不支持html那一定是移动设备<br></span><span>        // 如果支持wml和html但是wml在html之前则是移动设备<br></span><span>        </span><span>if </span><span>((strpos(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_ACCEPT\'</span><span>]</span><span>, </span><span>\'vnd.wap.wml\'</span><span>) !== </span><span>false</span><span>) &amp;&amp; (strpos(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_ACCEPT\'</span><span>]</span><span>, </span><span>\'text/html\'</span><span>) === </span><span>false </span><span>|| (strpos(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_ACCEPT\'</span><span>]</span><span>, </span><span>\'vnd.wap.wml\'</span><span>) &lt; strpos(</span><span>$_SERVER</span><span>[</span><span>\'HTTP_ACCEPT\'</span><span>]</span><span>, </span><span>\'text/html\'</span><span>))))<br></span><span>        {<br></span><span>            </span><span>return true</span><span>;<br></span><span>        </span><span>}<br></span><span>    }<br></span><span>    </span><span>return false</span><span>;<br></span><span>}</span></pre>','0',2,'1',0,'',0,0,350,1501204163,1501204249,'CLTPHP','http://www.cltphp.com/','',''),
(18,3,1,'admin','关于收费文档的误解','关于收费文档的误解','关于收费文档的误解','<p>　　cltphp的文档收费20，靠20块文档赚钱，有点夸大了，定2000，万一有一个人付费，那就是100个20，也能算挣点小钱。</p><p>　　不花钱的东西，没有价值，也无所谓去骂娘。花了钱，大多人会去看，有价值的部分，自然会学习到。没价值的部分，一些人会骂娘，骂娘的同时，或许会说：这里怎样改一下不久好了嘛！对于这样的骂娘，我们很是支持。</p><p>　　另外赋上文档的初始态度：<a href=\"http://cltphp.com/newsInfo-16-5.html\" target=\"_self\" style=\"text-decoration: none;\"><strong>CLTPHP操作文档不断更新中</strong></a></p><h4><br/></h4>','0',2,'1',0,'',0,0,1390,1501552272,1505373009,'CLTPHP','http://www.cltphp.com/','',''),
(19,3,1,'admin','关于捐赠的一些说明','关于捐赠的一些说明','关于捐赠的一些说明','<p>首先非常感谢您对我们的支持。</p><p>近期发现，一部分朋友对我们捐赠时，并未留下名称或者其他称呼。</p><p>目前官网只接受微信扫码捐赠，所以，请您务必点击留言，留下您的大名，便于我们做捐赠名的展示。<img src=\"/public/uploads/20170904/a1bb03cea85aafd3bca3287ef3ade719.png\" alt=\"20170904/a1bb03cea85aafd3bca3287ef3ade719.png\"></p>','0',0,'1',0,'',0,0,536,1501827480,1504516379,'CLTPHP','http://www.cltphp.com/','',''),
(20,6,1,'admin','PHP格式化字节大小','PHP格式化字节大小','PHP格式化字节大小','<pre><span>/**<br></span><span> * PHP格式化字节大小<br></span><span> * </span><span>@param  </span><span>number $size      字节数<br></span><span> * </span><span>@param  </span><span>string $delimiter 数字和单位分隔符<br></span><span> * </span><span>@return </span><span>string            格式化后的带单位的大小<br></span><span> */<br></span><span>function </span><span>format_bytes</span><span>(</span><span>$size</span><span>, </span><span>$delimiter </span><span>= </span><span>\'\'</span><span>) {<br></span><span>    </span><span>$units </span><span>= </span><span>array</span><span>(</span><span>\'B\'</span><span>, </span><span>\'KB\'</span><span>, </span><span>\'MB\'</span><span>, </span><span>\'GB\'</span><span>, </span><span>\'TB\'</span><span>, </span><span>\'PB\'</span><span>)</span><span>;<br></span><span>    </span><span>for </span><span>(</span><span>$i </span><span>= </span><span>0</span><span>; </span><span>$size </span><span>&gt;= </span><span>1024 </span><span>&amp;&amp; </span><span>$i </span><span>&lt; </span><span>5</span><span>; </span><span>$i</span><span>++) </span><span>$size </span><span>/= </span><span>1024</span><span>;<br></span><span>    </span><span>return </span><span>round(</span><span>$size</span><span>, </span><span>2</span><span>) . </span><span>$delimiter </span><span>. </span><span>$units</span><span>[</span><span>$i</span><span>]</span><span>;<br></span><span>}</span></pre>','0',1,'1',0,'',0,0,409,1502067689,1502067893,'CLTPHP','http://www.cltphp.com/','',''),
(23,3,1,'admin','清除缓存和添加字段的错误修正方法','清除缓存和添加字段的错误修正方法','清除缓存和添加字段的错误修正方法','<p>问题：</p><pre>Deprecated:&nbsp;Automatically&nbsp;populating&nbsp;$HTTP_RAW_POST_DATA&nbsp;is&nbsp;deprecated&nbsp;and&nbsp;will&nbsp;be&nbsp;removed&nbsp;in&nbsp;a&nbsp;future&nbsp;version.&nbsp;To&nbsp;avoid&nbsp;this&nbsp;warning&nbsp;set&nbsp;&#39;always_populate_raw_post_data&#39;&nbsp;to&nbsp;&#39;-1&#39;&nbsp;in&nbsp;php.ini&nbsp;and&nbsp;use&nbsp;the&nbsp;php://input&nbsp;stream&nbsp;instead.&nbsp;in&nbsp;Unknown&nbsp;on&nbsp;line&nbsp;0</pre><p><br/></p><p>修正方法：</p><p>去掉php.in配置文件always_populate_raw_post_data前面的分号</p><p><br/></p><p><br/></p>','0',0,'1',0,'',0,0,276,1502761583,1504763357,'CLTPHP','http://www.cltphp.com/','',''),
(25,5,1,'admin','CLTPHP手册更新自定义标签','CLTPHP手册更新自定义标签','CLTPHP手册更新自定义标签','<p>CLTPHP手册更新自定义标签，文档详细讲述了 {clt:list}{/clt:list} 和 {clt:info}{/clt:info} 两个标签的参数和调用方法。</p>','0',1,'1',0,'',0,0,1099,1503365502,0,'CLTPHP','http://www.cltphp.com/','',''),
(36,5,1,'admin','CLTPHP5.1.1更新','CLTPHP5.1.1更新  cltphp cltphp内容管理系统 php','CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站，虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。','<p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">更新内容</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">1、前台自定义标签完善</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">2、自定义分页，优化了系统分页（为了保持框架文件的纯净度，并没有改动TP原有分页代码）</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">3、更新对应文档</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">下载地址：<a target=\"_self\" href=\"http://qiniu.cltphp.com/cltphp5.1.1.zip\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP5.1.1下载</span></a></p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(151, 151, 151); white-space: normal; background-color: rgb(255, 255, 255);\">更新包下载：<a target=\"_self\" href=\"http://qiniu.cltphp.com/CLTPHP5.1%E5%88%B05.1.1%E5%8D%87%E7%BA%A7.zip\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; outline: 0px; color: rgb(146, 208, 80); text-decoration: none;\"><span style=\"color: rgb(146, 208, 80);\">CLTPHP5.1到5.1.1更新</span></a></p><p><br/></p>','0',0,'1',0,'',0,0,225,1504765025,1505355804,'CLTPHP','http://www.cltphp.com/','',''),
(37,5,1,'admin','CLTPHP5.1.2发布','CLTPHP5.1.2发布  cltphp cltphp内容管理系统 php','CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站，虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。','<p>更新内容</p><p>1、<strong>CLTPHP</strong>核心框架thinkphp升级</p><p>2、分类，广告，友链的前后台缓存机制</p><p>下载地址：<strong style=\"color: rgb(118, 146, 60); text-decoration: none;\"><span style=\"color: rgb(118, 146, 60);\"><a href=\"http://qiniu.cltphp.com/cltphp5.1.2.zip\" target=\"_self\" title=\"CLTPHP5.1.2下载\" style=\"color: rgb(118, 146, 60); text-decoration: none;\">CLTPHP5.1.2</a></span></strong></p><p><br/></p><p><br/></p>','0',0,'1',0,'',0,0,143,1505264091,1505355785,'CLTPHP','http://www.cltphp.com/','',''),
(38,3,1,'admin','关于CLTPHP的一些琐碎事','关于CLTPHP的一些琐碎事 cltphp cltphp内容管理系统 php','CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站，虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。','<p>CLTPHP是开源的</p><p><a href=\"http://demo.cltphp.com\" target=\"_self\">CLTPHP演示站</a>的后台用户名：admin &nbsp;密码：admin123</p><p>版本更新包的后台用户名：admin &nbsp;密码：admin123</p><p>新版本发布，请登录后台，清空缓存后再打开前台，不然，前台可能会报错。</p><p><span style=\"color:#953734;\">如果没有意外（睡眼忪惺）的时候，以上永久不变。</span></p>','0',1,'1',0,'',0,0,1286,1505264319,1535005747,'CLTPHP','http://www.cltphp.com/','','color:;font-weight:normal;'),
(40,6,1,'admin','php验证输入的邮件地址是否合法','php验证输入的邮件地址是否合法','php验证输入的邮件地址是否合法','<pre class=\"brush:php;toolbar:false\">/**\n&nbsp;*&nbsp;验证输入的邮件地址是否合法\n&nbsp;*/\nfunction&nbsp;is_email($user_email)\n{\n&nbsp;&nbsp;&nbsp;&nbsp;$chars&nbsp;=&nbsp;&quot;/^([a-z0-9+_]|\\\\-|\\\\.)+@(([a-z0-9_]|\\\\-)+\\\\.)+[a-z]{2,6}\\$/i&quot;;\n&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(strpos($user_email,&nbsp;&#39;@&#39;)&nbsp;!==&nbsp;false&nbsp;&amp;&amp;&nbsp;strpos($user_email,&nbsp;&#39;.&#39;)&nbsp;!==&nbsp;false)&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if&nbsp;(preg_match($chars,&nbsp;$user_email))&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;true;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;}\n&nbsp;&nbsp;&nbsp;&nbsp;}&nbsp;else&nbsp;{\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;false;\n&nbsp;&nbsp;&nbsp;&nbsp;}\n}</pre><p><br/></p>','0',2,'1',0,'',0,0,176,1505355407,1505355561,'CLTPHP','http://www.cltphp.com/','',''),
(39,5,1,'admin','CLTPHP5.1.3发布','CLTPHP5.1.3发布 cltphp cltphp内容管理系统 php','CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站，虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。','<p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">更新内容</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">1、修复多图上传bug</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">2、修复后台栏目二级目录下路径问题</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">3、修改TP自带提示文件正确状态下的图标</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">4、修改模型字段编辑表单显示与数据库不一致问题</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">5、修复QQ绑定bug</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">6、修复5.1.2版本数据库备份问题</p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">下载地址：<a href=\"http://qiniu.cltphp.com/CLTPHP5.1.3.zip\" target=\"_self\" title=\"CLTPHP5.1.3下载\" style=\"text-decoration: none;\"><strong><span style=\"color: rgb(0, 176, 80);\">CLTPHP5.1.3</span></strong><strong><span style=\"color: rgb(0, 176, 80);\"></span></strong></a></p><p style=\"box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 20px; color: rgb(102, 102, 102); white-space: normal; background-color: rgb(255, 255, 255);\">更新包下载：<a href=\"http://qiniu.cltphp.com/5.1.2%E5%8D%875.1.3%E8%A1%A5%E4%B8%81.zip\" target=\"_self\" title=\"CLTPHP5.1.2到5.1.3更新\" style=\"color: rgb(0, 176, 80); text-decoration: none;\"><strong><span style=\"color: rgb(0, 176, 80);\">CLTPHP5.1.2到5.1.3更新</span></strong></a></p><p><br/></p>','0',2,'1',0,'',0,0,701,1505353199,1505872972,'CLTPHP','http://www.cltphp.com/','',''),
(41,5,1,'admin','CLTPHP5.2发布','CLTPHP5.2发布','CLTPHP5.2发布','<p>更新内容</p><p>1.后台核心框架升级为ThinkPHP5.0.11版本</p><p>2.后台及会员中心UI框架升级为layui2.1.5版本</p><p>3.碎片修改为以碎片分类来管理</p><p>4.优化图片、文件上传</p><p>5.优化双编辑器切换</p><p>6.后台增加主题切换功能</p><p>7.后台全屏状态，点击全屏按钮可收起全屏</p><p><span style=\"color: rgb(255, 0, 0);\">注意事项</span></p><p><span style=\"color: rgb(255, 0, 0);\">1.遇到问题，先去官网找答案。</span></p><p><span style=\"color: rgb(255, 0, 0);\">2.CLTPHP5.2是一个大面积修改升级版，不支持之前任何版本的无缝升级。</span></p><p>下载地址：<a href=\"http://qiniu.cltphp.com/cltphp5.2.zip\" target=\"_self\" title=\"CLTPHP5.2\" style=\"color: rgb(0, 176, 80); text-decoration: none;\"><strong><span style=\"color: rgb(0, 176, 80);\">CLTPHP5.2</span></strong></a></p><p><br/></p>','0',2,'1',0,'',0,0,1554,1505871918,1529458978,'CLTPHP','http://www.cltphp.com/','','color:rgb(95, 184, 120);font-weight:bold;'),
(42,5,1,'admin','CLTPHP5.2.1发布','CLTPHP5.2.1发布 cltphp cltphp内容管理系统 php','CLTPHP的目的是 让所有人都能 高效 简洁 的建立网站，虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。','<p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; padding: 0px 0px 20px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">更新内容</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; padding: 0px 0px 20px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">1、修改会员中心无法解绑QQbug</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; padding: 0px 0px 20px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">2、修复后台多图上传bug</p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; padding: 0px 0px 20px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\">下载地址：<a href=\"http://qiniu.cltphp.com/CLTPHP5.2.1.zip\" target=\"_self\" title=\"CLTPHP5.2.1下载\"><strong style=\"text-decoration: none; white-space: normal; color: rgb(118, 146, 60);\">CLTPHP5.2.1</strong></a><a href=\"http://qiniu.cltphp.com/cltphp5.2.1.zip\" target=\"_self\" title=\"CLTPHP5.2.1下载\"><strong style=\"white-space: normal; color: rgb(118, 146, 60);\"></strong></a></p><p style=\"margin-top: 0px; margin-bottom: 0px; white-space: normal; box-sizing: border-box; border: 0px; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; vertical-align: baseline; padding: 0px 0px 20px; color: rgb(102, 102, 102); background-color: rgb(255, 255, 255);\"><span style=\"color: rgb(102, 102, 102); font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">补丁地址：</span><a href=\"http://qiniu.cltphp.com/CLTPHP5.2%E5%88%B05.2.1%E8%A1%A5%E4%B8%81.zip\" target=\"_self\" title=\"CLTPHP5.2升5.2.1补丁\" style=\"color: rgb(118, 146, 60); text-decoration: none;\"><strong><span style=\"color: rgb(146, 208, 80);\">CLTPHP5.2升5.2.1补丁</span></strong></a></p><p><br/></p>','0',0,'1',0,'',0,0,250,1506475263,1506475718,'CLTPHP','http://www.cltphp.com/','',''),
(43,6,1,'admin','纯CSS实现页面的尖角、小三角、不同方向尖角的方法小结','','','<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\">效果图：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\">方法一的效果图：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/public/uploads/ueditor/image/20171008/1507425192923475.png\" alt=\"\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\">方法二的效果图：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/public/uploads/ueditor/image/20171008/1507425192357806.png\" alt=\"\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\">方法三的效果图：</p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; text-align: center; background-color: rgb(255, 255, 255);\"><img src=\"/public/uploads/ueditor/image/20171008/1507425192288407.png\" alt=\"\"/></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(255, 0, 0);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">方法1：因为有背景，所有实现起来比较方便，尖角的内部同个颜色就可以不用考虑遮挡问题</span></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">html:</span></p><pre class=\"brush:xhtml;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">&lt;div&nbsp;id=&quot;first&quot;&gt;&nbsp;&nbsp;\n&lt;p&gt;带背景颜色的小三角实现是比较简单的！&lt;/p&gt;&nbsp;&nbsp;\n&nbsp;&nbsp;&lt;span&nbsp;id=&quot;top&quot;&gt;&lt;/span&gt;&nbsp;&nbsp;\n&lt;/div&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">css</span></p><pre class=\"brush:sql;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">#top&nbsp;{&nbsp;&nbsp;\n&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;position:&nbsp;absolute;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;0px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;0px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;line-height:&nbsp;0px;/*为了防止ie下出现题型*/&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;border-bottom:&nbsp;10px&nbsp;solid&nbsp;#89b007;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;border-left:&nbsp;10px&nbsp;solid&nbsp;#fff;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;border-right:&nbsp;10px&nbsp;solid&nbsp;#fff;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;left:&nbsp;76px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;top:&nbsp;-10px;&nbsp;&nbsp;\n}&nbsp;&nbsp;\n#first&nbsp;{&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;border-radius:8px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;-moz-border-radius:8px;-ms-border-radius:8px;-o-border-radius:8px;-webkit-border-radius:8px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;position:&nbsp;absolute;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;height:&nbsp;150px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;width:&nbsp;300px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;background:&nbsp;#89b007;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;left:&nbsp;22px;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;top:&nbsp;33px;&nbsp;&nbsp;\n}&nbsp;&nbsp;\n#first&nbsp;p{&nbsp;padding:10px;&nbsp;line-height:1.5;&nbsp;color:#FFF;}</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(255, 0, 0);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">方法2：</span></span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">html</span></p><pre class=\"brush:xhtml;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">&lt;div&nbsp;class=&quot;w&quot;&gt;&nbsp;&nbsp;\n&nbsp;&nbsp;&lt;div&nbsp;class=&quot;x&quot;&gt;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;p&gt;&lt;a&nbsp;href=&quot;#&quot;&gt;用面向对象的思想去书写css,用面向对象的心态去书写css。&lt;/a&gt;&lt;/p&gt;&nbsp;&nbsp;\n&nbsp;&nbsp;&nbsp;&nbsp;&lt;span&nbsp;class=&quot;z&quot;&gt;◆&lt;/span&gt;&nbsp;&lt;span&nbsp;class=&quot;y&quot;&gt;◆&lt;/span&gt;&nbsp;&lt;/div&gt;&nbsp;&nbsp;\n&lt;/div&gt;</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">css</span></p><pre class=\"brush:css;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">*&nbsp;{&nbsp;&nbsp;\nmargin:&nbsp;0;&nbsp;&nbsp;\npadding:&nbsp;0;&nbsp;&nbsp;\n}&nbsp;&nbsp;\na{&nbsp;color:#666;&nbsp;text-decoration:none;&nbsp;line-height:25px;&nbsp;text-indent:24px;}&nbsp;&nbsp;\n.w{&nbsp;width:200px;&nbsp;position:absolute;&nbsp;background:#999;&nbsp;left:400px;&nbsp;top:200px;&nbsp;font-size:12px;&nbsp;text-align:left}/*模拟灰色阴影背景层*/&nbsp;&nbsp;\n.x{&nbsp;width:180px;&nbsp;position:relative;&nbsp;background:#fff;&nbsp;&nbsp;border:1px&nbsp;solid&nbsp;#ccc;&nbsp;padding:10px;&nbsp;left:-4px;&nbsp;top:-4px;}/*内容div*/&nbsp;&nbsp;\n.y&nbsp;,&nbsp;.z{&nbsp;&nbsp;\nposition:&nbsp;absolute;&nbsp;&nbsp;\nleft:&nbsp;141px;&nbsp;&nbsp;\n}&nbsp;&nbsp;\n.y{&nbsp;&nbsp;\ncolor:&nbsp;#ccc;&nbsp;&nbsp;\nfont-size:&nbsp;19px;&nbsp;&nbsp;\ntop:-12px;&nbsp;&nbsp;\nz-index:1;&nbsp;&nbsp;\n}/*模拟小三角*/&nbsp;&nbsp;\n.z{&nbsp;&nbsp;\ncolor:&nbsp;#fff;&nbsp;&nbsp;\nfont-size:&nbsp;19px;&nbsp;&nbsp;\ntop:-11px;&nbsp;&nbsp;z-index:3;&nbsp;&nbsp;\n}/*模拟小三角*/</pre><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(51, 51, 51); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 13px; line-height: 19.5px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); color: rgb(255, 0, 0);\"><span style=\"box-sizing: border-box; margin: 0px; padding: 0px; font-weight: 700; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);\">方法3：</span></span></p><pre class=\"brush:xhtml;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">&lt;div&nbsp;id=&quot;content&quot;&gt;&nbsp;&lt;span&nbsp;class=&quot;out&quot;&gt;&lt;/span&gt;&lt;span&nbsp;class=&quot;iner&quot;&gt;&lt;/span&gt;&nbsp;&lt;span&nbsp;class=&quot;right&quot;&gt;&lt;/span&gt;&nbsp;&nbsp;\n&nbsp;&nbsp;&lt;p&gt;不管写什么内容，总之就是要实现无图小三角，要是有背景颜色那倒是极好的，没有的话也可以，就是稍微麻烦一点&lt;/p&gt;&nbsp;&nbsp;\n&lt;/div&gt;</pre><pre class=\"brush:css;\" style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: auto; font-family: monospace, monospace; font-size: 1em; line-height: 1.42857; word-break: break-all; word-wrap: break-word; border: 1px solid rgb(204, 204, 204); border-radius: 4px; outline: 0px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); background-color: rgb(245, 245, 245);\">#content&nbsp;{&nbsp;&nbsp;\ntext-indent:&nbsp;2em;&nbsp;&nbsp;\nbox-shadow:&nbsp;0px&nbsp;0px&nbsp;10px&nbsp;#999;&nbsp;&nbsp;\npadding:&nbsp;10px;&nbsp;&nbsp;\nfont-size:&nbsp;12px;&nbsp;&nbsp;\nline-height:&nbsp;1.5;&nbsp;&nbsp;\nborder-radius:&nbsp;5px;&nbsp;&nbsp;\nheight:&nbsp;100px;&nbsp;&nbsp;\nwidth:&nbsp;250px;&nbsp;&nbsp;\nposition:&nbsp;relative;&nbsp;&nbsp;\nmargin:&nbsp;200px&nbsp;auto;&nbsp;&nbsp;\nborder:&nbsp;1px&nbsp;solid&nbsp;#CCC;&nbsp;&nbsp;\n}&nbsp;&nbsp;\nspan&nbsp;{&nbsp;&nbsp;\nposition:&nbsp;absolute;&nbsp;&nbsp;\nleft:&nbsp;25px;&nbsp;&nbsp;\nheight:&nbsp;0px;&nbsp;&nbsp;\nwidth:&nbsp;0px;&nbsp;&nbsp;\n}&nbsp;&nbsp;\n/*上部小三角实现样式开始*/&nbsp;&nbsp;\nspan.out&nbsp;{&nbsp;&nbsp;\nline-height:&nbsp;0;&nbsp;&nbsp;\nborder-width:&nbsp;10px;&nbsp;&nbsp;\nborder-color:&nbsp;transparent&nbsp;transparent&nbsp;#CCC&nbsp;transparent;&nbsp;&nbsp;\nborder-style:&nbsp;dashed&nbsp;dashed&nbsp;solid&nbsp;dashed;&nbsp;&nbsp;\ntop:&nbsp;-20px;&nbsp;&nbsp;\n}&nbsp;&nbsp;\nspan.iner&nbsp;{&nbsp;&nbsp;\nborder-width:&nbsp;10px;&nbsp;&nbsp;\nborder-color:&nbsp;#fff&nbsp;transparent&nbsp;#FFF&nbsp;transparent;&nbsp;&nbsp;\nborder-style:&nbsp;dashed&nbsp;dashed&nbsp;solid&nbsp;dashed;&nbsp;&nbsp;\ntop:&nbsp;-19px;&nbsp;&nbsp;\nline-height:&nbsp;0;&nbsp;&nbsp;\n}&nbsp;&nbsp;\n/*右部小三角实现样式开始*/&nbsp;&nbsp;\nspan.right&nbsp;{&nbsp;&nbsp;\nbackground:&nbsp;#FFF;&nbsp;&nbsp;\nborder-width:&nbsp;1px;&nbsp;&nbsp;\nwidth:&nbsp;16px;&nbsp;&nbsp;\nheight:&nbsp;16px;&nbsp;&nbsp;\nborder-color:&nbsp;#CCC&nbsp;#CCC&nbsp;transparent&nbsp;transparent;&nbsp;&nbsp;\nborder-style:&nbsp;solid&nbsp;solid&nbsp;dashed&nbsp;dashed;&nbsp;&nbsp;\nleft:&nbsp;270px;&nbsp;&nbsp;\ntop:&nbsp;30px;&nbsp;&nbsp;\nborder-radius:&nbsp;0&nbsp;0&nbsp;100%&nbsp;0;/*这里radius的值不要选取绝对值因为在放大或者缩小的过程中会产生封不住口的现象*/&nbsp;&nbsp;\nline-height:&nbsp;0;&nbsp;&nbsp;\nbox-shadow:&nbsp;5px&nbsp;0&nbsp;10px&nbsp;#aaa;&nbsp;&nbsp;\n}</pre><p><br/></p>','0',0,'1',0,'',0,0,104,1507425169,0,'CLTPHP','http://www.cltphp.com/','',''),
(44,5,1,'admin','CLTPHP5.2.2发布','CLTPHP5.2.2发布','CLTPHP5.2.2发布','<p><span style=\"color:#666666;font-family:Microsoft yahei, Arial, Tahoma, Verdana\"><span style=\"font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">修改bug若干</span></span></p><p><span style=\"color: rgb(102, 102, 102); font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">下载地址：</span><strong><span style=\"color: rgb(102, 102, 102); font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; text-decoration: none; background-color: rgb(255, 255, 255);\"><a href=\"http://qiniu.cltphp.com/cltphp5.2.2.zip\" target=\"_self\" title=\"CLTPHP5.2.2\" style=\"color: rgb(0, 176, 80);\"><span style=\"text-decoration: none; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; color: rgb(0, 176, 80); background-color: rgb(255, 255, 255);\">CLTPHP5.2.2</span></a></span></strong></p><p><span style=\"color: rgb(102, 102, 102); font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; background-color: rgb(255, 255, 255);\">补丁地址：</span><span style=\"color: rgb(102, 102, 102); font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; text-decoration: none; background-color: rgb(255, 255, 255);\"><a href=\"http://qiniu.cltphp.com/CLTPHP5.2.1%E5%88%B05.2.2%E8%A1%A5%E4%B8%81.zip\" target=\"_self\" style=\"color: rgb(0, 176, 80);\"><strong><span style=\"text-decoration: none; font-family: &#39;Microsoft yahei&#39;, Arial, Tahoma, Verdana; font-size: 14px; line-height: 24px; color: rgb(0, 176, 80); background-color: rgb(255, 255, 255);\">CLTPHP5.2.1到5.2.2升级</span></strong></a></span></p>','0',1,'1',0,'',0,0,1657,1507877194,1507879172,'CLTPHP','http://www.cltphp.com/','',''),
(45,5,1,'admin','给我们一点点时间  我们给你一个新突破','给我们一点点时间  我们给你一个新突破','给我们一点点时间  我们给你一个新突破','<p style=\"text-indent: 2em;\"><img src=\"/uploads/ueditor/image/20180116/1516071084131870.png\" title=\"1516071084131870.png\" alt=\"1516071084131870.png\" width=\"300\" height=\"84\">说实话，最近这段时间我们太忙了<img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\">，cltphp的开发，甚至可以说是搁浅了一段时间。不过，各位请耐心等待一下啊，给我们一点点时间，或许不止一点点，我们给你一个新突破。</p>','0',1,'1',0,'',0,0,123,1533023720,1532937329,'CLTPHP','http://www.cltphp.com/','','color:;font-weight:normal;');

/*Table structure for table `clt_auth_group` */

DROP TABLE IF EXISTS `clt_auth_group`;

CREATE TABLE `clt_auth_group` (
  `group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '全新ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '标题',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态',
  `rules` longtext COMMENT '规则',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='管理员分组';

/*Data for the table `clt_auth_group` */

insert  into `clt_auth_group`(`group_id`,`title`,`status`,`rules`,`addtime`) values 
(1,'超级管理员',1,'0,1,2,270,15,16,119,120,121,145,17,149,116,117,118,151,181,18,108,114,112,109,110,111,3,5,126,127,128,4,230,232,129,189,190,193,192,240,239,241,243,244,245,242,246,7,9,14,234,13,235,236,237,238,27,29,161,163,164,162,38,167,182,169,166,28,48,247,248,31,32,249,250,251,45,170,171,175,174,173,46,176,183,179,178,265,196,197,202,198,252,253,254,255,256,203,205,204,257,272,206,207,212,208,213,258,259,260,261,262,209,215,214,263,273,267,269,',1465114224),
(2,'管理员',1,'0,1,2,270,15,16,145,17,181,18,111,3,5,127,128,4,129,189,190,239,241,242,7,9,14,13,27,29,161,163,164,162,38,167,182,169,166,28,48,31,32,45,174,46,179,196,197,202,252,203,204,272,206,207,212,208,260,209,215,267,269,',1465114224),
(3,'商品管理员',1,'27,29,161,163,164,162,38,167,182,169,166,',1465114224);

/*Table structure for table `clt_auth_rule` */

DROP TABLE IF EXISTS `clt_auth_rule`;

CREATE TABLE `clt_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `href` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `authopen` tinyint(2) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL COMMENT '样式',
  `condition` char(100) DEFAULT '',
  `pid` int(5) NOT NULL DEFAULT '0' COMMENT '父栏目ID',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `zt` int(1) DEFAULT NULL,
  `menustatus` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=280 DEFAULT CHARSET=utf8 COMMENT='权限节点';

/*Data for the table `clt_auth_rule` */

insert  into `clt_auth_rule`(`id`,`href`,`title`,`type`,`status`,`authopen`,`icon`,`condition`,`pid`,`sort`,`addtime`,`zt`,`menustatus`) values 
(1,'System','系统设置',1,1,0,'icon-cogs','',0,0,1446535750,1,1),
(2,'System/system','系统设置',1,1,0,'','',1,1,1446535789,1,1),
(3,'Database/database','数据库管理',1,1,0,'icon-database','',0,2,1446535805,1,1),
(4,'Database/restore','还原数据库',1,1,0,'','',3,10,1446535750,1,1),
(5,'Database/database','数据库备份',1,1,0,'','',3,1,1446535834,1,1),
(7,'Category','栏目管理',1,1,0,'icon-list','',0,4,1446535875,1,1),
(9,'Category/index','栏目列表',1,1,0,'','',7,0,1446535750,1,1),
(13,'Category/edit','操作-修改',1,1,0,'','',9,3,1446535750,1,0),
(14,'Category/add','操作-添加',1,1,0,'','',9,0,1446535750,1,0),
(15,'Auth/adminList','权限管理',1,1,0,'icon-lifebuoy','',0,1,1446535750,1,1),
(16,'Auth/adminList','管理员列表',1,1,0,'','',15,0,1446535750,1,1),
(17,'Auth/adminGroup','用户组列表',1,1,0,'','',15,1,1446535750,1,1),
(18,'Auth/adminRule','权限管理',1,1,0,'','',15,2,1446535750,1,1),
(27,'Users','会员管理',1,1,0,'icon-user','',0,5,1447231507,1,1),
(28,'Function','网站功能',1,1,0,'icon-cog','',0,6,1447231590,1,1),
(29,'Users/index','会员列表',1,1,0,'','',27,10,1447232085,1,1),
(31,'Link/index','友情链接',1,1,0,'','',28,2,1447232183,0,1),
(32,'Link/add','操作-添加',1,1,0,'','',31,1,1447639935,0,0),
(38,'Users/userGroup','会员组',1,1,0,'','',27,50,1448413248,1,1),
(45,'Ad/index','广告管理',1,1,0,'','',28,3,1450314297,1,1),
(46,'Ad/type','广告位管理',1,1,0,'','',28,4,1450314324,1,1),
(48,'Message/index','留言管理',1,1,0,'','',28,1,1451267354,0,1),
(108,'Auth/ruleAdd','操作-添加',1,1,0,'','',18,0,1461550835,1,0),
(109,'Auth/ruleState','操作-状态',1,1,0,'','',18,5,1461550949,1,0),
(110,'Auth/ruleTz','操作-验证',1,1,0,'','',18,6,1461551129,1,0),
(111,'Auth/ruleorder','操作-排序',1,1,0,'','',18,7,1461551263,1,0),
(112,'Auth/ruleDel','操作-删除',1,1,0,'','',18,4,1461551536,1,0),
(114,'Auth/ruleEdit','操作-修改',1,1,0,'','',18,2,1461551913,1,0),
(116,'Auth/groupEdit','操作-修改',1,1,0,'','',17,3,1461552326,1,0),
(117,'Auth/groupDel','操作-删除',1,1,0,'','',17,30,1461552349,1,0),
(118,'Auth/groupAccess','操作-权限',1,1,0,'','',17,40,1461552404,1,0),
(119,'Auth/adminAdd','操作-添加',1,1,0,'','',16,0,1461553162,1,0),
(120,'Auth/adminEdit','操作-修改',1,1,0,'','',16,2,1461554130,1,0),
(121,'Auth/adminDel','操作-删除',1,1,0,'','',16,4,1461554152,1,0),
(126,'Database/export','操作-备份',1,1,0,'','',5,1,1461550835,1,0),
(127,'Database/optimize','操作-优化',1,1,0,'','',5,1,1461550835,1,0),
(128,'Database/repair','操作-修复',1,1,0,'','',5,1,1461550835,1,0),
(129,'Database/delSqlFiles','操作-删除',1,1,0,'','',4,3,1461550835,1,0),
(236,'Category/del','操作-删除',1,1,0,'','',9,5,1497424900,0,0),
(230,'Database/import','操作-还原',1,1,0,'','',4,1,1497423595,0,0),
(145,'Auth/adminState','操作-状态',1,1,0,'','',16,5,1461550835,1,0),
(149,'Auth/groupAdd','操作-添加',1,1,0,'','',17,1,1461550835,1,0),
(151,'Auth/groupRunaccess','操作-权存',1,1,0,'','',17,50,1461550835,1,0),
(234,'Category/insert','操作-添存',1,1,0,'','',9,2,1497424143,0,0),
(240,'Module/del','操作-删除',1,1,0,'','',190,4,1497425850,0,0),
(239,'Module/moduleState','操作-状态',1,1,0,'','',190,5,1497425764,0,0),
(238,'page/edit','单页编辑',1,1,0,'','',7,2,1497425142,0,0),
(237,'Category/cOrder','操作-排序',1,1,0,'','',9,6,1497424979,0,0),
(161,'Users/usersState','操作-状态',1,1,0,'','',29,1,1461550835,1,0),
(162,'Users/delall','操作-全部删除',1,1,0,'','',29,4,1461550835,1,0),
(163,'Users/edit','操作-编辑',1,1,0,'','',29,2,1461550835,1,0),
(164,'Users/usersDel','操作-删除',1,1,0,'','',29,3,1461550835,1,0),
(247,'Message/del','操作-删除',1,1,0,'','',48,1,1497427449,0,0),
(166,'Users/groupOrder','操作-排序',1,1,0,'','',38,50,1461550835,1,0),
(167,'Users/groupAdd','操作-添加',1,1,0,'','',38,10,1461550835,1,0),
(169,'Users/groupDel','操作-删除',1,1,0,'','',38,30,1461550835,1,0),
(170,'Ad/add','操作-添加',1,1,0,'','',45,1,1461550835,1,0),
(171,'Ad/edit','操作-修改',1,1,0,'','',45,2,1461550835,1,0),
(173,'Ad/del','操作-删除',1,1,0,'','',45,5,1461550835,1,0),
(174,'Ad/adOrder','操作-排序',1,1,0,'','',45,4,1461550835,1,0),
(175,'Ad/editState','操作-状态',1,1,0,'','',45,3,1461550835,1,0),
(176,'Ad/addType','操作-添加',1,1,0,'','',46,1,1461550835,1,0),
(252,'Template/edit','操作-编辑',1,1,0,'','',197,3,1497428906,0,0),
(178,'Ad/delType','操作-删除',1,1,0,'','',46,4,1461550835,1,0),
(179,'Ad/typeOrder','操作-排序',1,1,0,'','',46,3,1461550835,1,0),
(181,'Auth/groupState','操作-状态',1,1,0,'','',17,50,1461834340,1,0),
(182,'Users/groupEdit','操作-修改',1,1,0,'','',38,15,1461834780,1,0),
(183,'Ad/editType','操作-修改',1,1,0,'','',46,2,1461834988,1,0),
(189,'Module','模型管理',1,1,0,'icon-ungroup','',0,3,1466825363,0,1),
(190,'Module/index','模型列表',1,1,0,'','',189,1,1466826681,0,1),
(192,'Module/edit','操作-修改',1,1,0,'','',190,2,1467007920,0,0),
(193,'Module/add','操作-添加',1,1,0,'','',190,1,1467007955,0,0),
(196,'Template','模版管理',1,1,0,'icon-embed2','',0,7,1481857304,0,1),
(197,'Template/index','模版管理',1,1,0,'','',196,1,1481857540,0,1),
(198,'Template/insert','操作-添存',1,1,0,'','',197,2,1481857587,0,0),
(202,'Template/add','操作-添加',1,1,0,'','',197,1,1481859447,0,0),
(203,'Debris/index','碎片管理',1,1,0,'','',196,2,1484797759,0,1),
(204,'Debris/edit','操作-编辑',1,1,0,'','',203,2,1484797849,0,0),
(205,'Debris/add','操作-添加',1,1,0,'','',203,1,1484797878,0,0),
(206,'Wechat','微信管理',1,1,0,'icon-bubbles2','',0,8,1487063570,0,1),
(207,'Wechat/config','公众号管理',1,1,0,'','',206,1,1487063705,0,1),
(208,'Wechat/menu','菜单管理',1,1,0,'','',206,2,1487063765,0,1),
(209,'Wechat/materialmessage','消息素材',1,1,0,'','',206,3,1487063834,0,1),
(212,'Wechat/weixin','操作-设置',1,1,0,'','',207,1,1487064541,0,0),
(213,'Wechat/addMenu','操作-添加',1,1,0,'','',208,1,1487149151,0,0),
(214,'Wechat/editText','操作-编辑',1,1,0,'','',209,2,1487233984,0,0),
(215,'Wechat/addText','操作-添加',1,1,0,'','',209,1,1487234062,0,0),
(232,'Database/downFile','操作-下载',1,1,0,'','',4,2,1497423744,0,0),
(235,'Category/catUpdate','操作-该存',1,1,0,'','',9,4,1497424301,0,0),
(241,'Module/field','模型字段',1,1,0,'','',190,6,1497425972,0,0),
(242,'Module/fieldStatus','操作-状态',1,1,0,'','',241,4,1497426044,0,0),
(243,'Module/fieldAdd','操作-添加',1,1,0,'','',241,1,1497426089,0,0),
(244,'Module/fieldEdit','操作-修改',1,1,0,'','',241,2,1497426134,0,0),
(245,'Module/listOrder','操作-排序',1,1,0,'','',241,3,1497426179,0,0),
(246,'Module/fieldDel','操作-删除',1,1,0,'','',241,5,1497426241,0,0),
(248,'Message/delall','操作-删除全部',1,1,0,'','',48,2,1497427534,0,0),
(249,'Link/edit','操作-编辑',1,1,0,'','',31,2,1497427694,0,0),
(250,'Link/linkState','操作-状态',1,1,0,'','',31,3,1497427734,0,0),
(251,'Link/del','操作-删除',1,1,0,'','',31,4,1497427780,0,0),
(253,'Template/update','操作-改存',1,1,0,'','',197,4,1497428951,0,0),
(254,'Template/delete','操作-删除',1,1,0,'','',197,5,1497429018,0,0),
(255,'Template/images','媒体文件管理',1,1,0,'','',197,6,1497429157,0,0),
(256,'Template/imgDel','操作-文件删除',1,1,0,'','',255,1,1497429217,0,0),
(257,'Debris/del','操作-删除',1,1,0,'','',203,3,1497429416,0,0),
(258,'Wechat/editMenu','操作-编辑',1,1,0,'','',208,2,1497429671,0,0),
(259,'Wechat/menuOrder','操作-排序',1,1,0,'','',208,3,1497429707,0,0),
(260,'Wechat/menuState','操作-状态',1,1,0,'','',208,4,1497429764,0,0),
(261,'Wechat/delMenu','操作-删除',1,1,0,'','',208,5,1497429822,0,0),
(262,'Wechat/createMenu','操作-生成菜单',1,1,0,'','',208,6,1497429886,0,0),
(263,'Wechat/delText','操作-删除',1,1,0,'','',209,3,1497430020,0,0),
(265,'Donation/index','捐赠管理',1,1,0,'','',28,5,1498101716,0,1),
(273,'Wechat/replay','回复设置',1,1,0,'','',206,4,1508215988,0,1),
(267,'Plugin/index','插件管理',1,1,1,'icon-power-cord','',0,9,1501466560,0,1),
(269,'Plugin/index','第三方',1,1,1,'','',267,1,1501466732,0,1),
(270,'System/email','邮箱配置',1,1,0,'','',1,2,1502331829,0,1),
(272,'Debris/type','碎片分类',1,1,1,'','',196,3,1504082720,0,1);

/*Table structure for table `clt_category` */

DROP TABLE IF EXISTS `clt_category`;

CREATE TABLE `clt_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL DEFAULT '',
  `catdir` varchar(30) NOT NULL DEFAULT '',
  `parentdir` varchar(50) NOT NULL DEFAULT '',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `moduleid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `module` char(24) NOT NULL DEFAULT '',
  `arrparentid` varchar(255) NOT NULL DEFAULT '',
  `arrchildid` varchar(100) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `title` varchar(150) NOT NULL DEFAULT '',
  `keywords` varchar(200) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `image` varchar(100) NOT NULL DEFAULT '',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` varchar(100) NOT NULL DEFAULT '',
  `template_list` varchar(20) NOT NULL DEFAULT '',
  `template_show` varchar(20) NOT NULL DEFAULT '',
  `pagesize` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `listtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否预览',
  PRIMARY KEY (`id`),
  KEY `parentid` (`parentid`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `clt_category` */

insert  into `clt_category`(`id`,`catname`,`catdir`,`parentdir`,`parentid`,`moduleid`,`module`,`arrparentid`,`arrchildid`,`type`,`title`,`keywords`,`description`,`sort`,`ishtml`,`ismenu`,`hits`,`image`,`child`,`url`,`template_list`,`template_show`,`pagesize`,`readgroup`,`listtype`,`lang`,`is_show`) values 
(1,'最新动态','news','',0,2,'article','0','1,5,6,27',0,'最新动态','最新动态','最新动态',4,0,1,0,'',1,'','article-list','article-show',0,'1,2,3',0,0,0),
(2,'关于我们','about','',0,1,'page','0','2',0,'关于我们','CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。','CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。',0,0,1,0,'',0,'','','',0,'1,2',0,0,0),
(4,'系统操作','system','',0,3,'picture','0','4',0,'CLTPHP系统操作','CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统','CLTPHP系统操作,CLTPHP,CLTPHP内容管理系统',2,0,1,0,'',0,'','','',0,'1,2',0,0,0),
(3,'CLTPHP服务','services','',0,2,'article','0','3',0,'产品服务-CLTPHP','产品服务,CLTPHP,CLTPHP内容管理系统','产品服务',1,0,1,0,'',0,'','','',15,'1,2,3',0,0,1),
(8,'联系我们','contact','',0,1,'page','0','8',0,'联系我们','联系我们','联系我们',7,0,1,0,'',0,'','page_show_contace','page_show_contace',0,'1,2',0,0,0),
(7,'精英团队','team','',0,6,'team','0','7',0,'精英团队','精英团队','精英团队',5,0,1,0,'',0,'','','',0,'1,2',0,0,0),
(5,'CLTPHP动态','news2','news/',1,2,'article','0,1','5',0,'CLTPHP动态','CLTPHP动态','CLTPHP动态',0,0,1,0,'',0,'','','',5,'1,2',0,0,1),
(6,'相关知识 ','news','news/',1,2,'article','0,1','6',0,'CLTPHP相关知识','CLTPHP相关知识','CLTPHP相关知识',0,0,1,0,'',0,'','','',0,'1,2',0,0,1),
(14,'文件下载','download','',0,5,'download','0','14',0,'测试下载','测试下载','测试下载',0,0,1,0,'',0,'','','',10,'1',0,0,0),
(27,'test','test','news/',1,2,'article','0,1','27',0,'','','',0,0,1,0,'',0,'','','',0,'1',0,0,0);

/*Table structure for table `clt_config` */

DROP TABLE IF EXISTS `clt_config`;

CREATE TABLE `clt_config` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `name` varchar(50) DEFAULT NULL COMMENT '配置的key键名',
  `value` varchar(512) DEFAULT NULL COMMENT '配置的val值',
  `inc_type` varchar(64) DEFAULT NULL COMMENT '配置分组',
  `desc` varchar(50) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

/*Data for the table `clt_config` */

insert  into `clt_config`(`id`,`name`,`value`,`inc_type`,`desc`) values 
(16,'is_mark','0','water','0'),
(17,'mark_txt','','water','0'),
(18,'mark_img','/public/upload/public/2017/01-20/10cd966bd5f3549833c09a5c9700a9b8.jpg','water','0'),
(19,'mark_width','','water','0'),
(20,'mark_height','','water','0'),
(21,'mark_degree','54','water','0'),
(22,'mark_quality','56','water','0'),
(23,'sel','9','water','0'),
(24,'sms_url','https://yunpan.cn/OcRgiKWxZFmjSJ','sms','0'),
(25,'sms_user','','sms','0'),
(26,'sms_pwd','访问密码 080e','sms','0'),
(27,'regis_sms_enable','1','sms','0'),
(28,'sms_time_out','1200','sms','0'),
(38,'__hash__','8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453','sms','0'),
(39,'__hash__','8d9fea07e44955760d3407524e469255_6ac8706878aa807db7ffb09dd0b02453','sms','0'),
(56,'sms_appkey','123456789','sms','0'),
(57,'sms_secretKey','123456789','sms','0'),
(58,'sms_product','CLTPHP','sms','0'),
(59,'sms_templateCode','SMS_101234567890','sms','0'),
(60,'smtp_server','smtp.qq.com','smtp','0'),
(61,'smtp_port','465','smtp','0'),
(62,'smtp_user','1109305556@qq.com','smtp','0'),
(63,'smtp_pwd','zmmqivfdfflahemiegc','smtp','0'),
(64,'regis_smtp_enable','1','smtp','0'),
(65,'test_eamil','23456@qq.com','smtp','0'),
(70,'forget_pwd_sms_enable','1','sms','0'),
(71,'bind_mobile_sms_enable','1','sms','0'),
(72,'order_add_sms_enable','1','sms','0'),
(73,'order_pay_sms_enable','1','sms','0'),
(74,'order_shipping_sms_enable','1','sms','0'),
(88,'email_id','CLTPHP官网','smtp','0'),
(89,'test_eamil_info',' 您好！这是一封来自CLTPHP的测试邮件！','smtp','0');

/*Table structure for table `clt_debris` */

DROP TABLE IF EXISTS `clt_debris`;

CREATE TABLE `clt_debris` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `type_id` int(6) DEFAULT NULL COMMENT '碎片分类ID',
  `title` varchar(120) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '内容',
  `addtime` int(13) DEFAULT NULL COMMENT '添加时间',
  `sort` int(11) DEFAULT '50' COMMENT '排序',
  `url` varchar(120) DEFAULT '' COMMENT '链接',
  `pic` varchar(120) DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `clt_debris` */

insert  into `clt_debris`(`id`,`type_id`,`title`,`content`,`addtime`,`sort`,`url`,`pic`) values 
(15,1,'我们的差异化','<p><span style=\"text-align: center;\">CLTPHP内容管理系统给您自由的模型构建权利，让您的想法通过您亲自操作实现。不要再为传统的数据库字段限制而发愁。一步删除，一步增加，您想要的，就是这一步。</span></p>',1503293255,1,'',''),
(16,1,'完整的建站理念','<p><span style=\"text-align: center;\">CLTPHP可以轻松构建模型，让数据库随心而动，让内容表单随意而变。模型和栏目的绑定，是为了让前台页面能更好的为您的想法服务，让您不再为建站留下遗憾。</span></p>',1503293273,2,'',''),
(17,1,'简单、高效、低门槛','<p><span style=\"text-align: center;\">CLTPHP内容管理系统，全程鼠标操作，不用手动建立数据库，不用画网站结构图，也不用打开编译器。网站后台直接</span><span style=\"text-align: center;\">编辑</span><span style=\"text-align: center;\">模版，让网站建设达到前所未有的极致简单。</span></p>',1503293291,3,'','');

/*Table structure for table `clt_debris_type` */

DROP TABLE IF EXISTS `clt_debris_type`;

CREATE TABLE `clt_debris_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(120) DEFAULT NULL,
  `sort` int(1) DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `clt_debris_type` */

insert  into `clt_debris_type`(`id`,`title`,`sort`) values 
(1,'【首页】中部碎片',1);

/*Table structure for table `clt_donation` */

DROP TABLE IF EXISTS `clt_donation`;

CREATE TABLE `clt_donation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `name` varchar(120) NOT NULL DEFAULT '' COMMENT '用户名',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '捐赠金额',
  `addtime` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

/*Data for the table `clt_donation` */

insert  into `clt_donation`(`id`,`name`,`money`,`addtime`) values 
(3,'高飞',10.00,'1466566714'),
(4,'王磊',5.50,'1466566733'),
(5,'一匹忧郁的狼',11.11,'1466566780'),
(6,'神盾',50.00,'1467517788'),
(7,'赵云的枪',20.00,'1469582594'),
(8,'王@楠',5.00,'1473155340'),
(9,'王宁',10.00,'1473647377'),
(11,'幽鸣',100.00,'1483080600'),
(12,'得水',6.60,'1484874321'),
(13,'挨踢男',50.00,'1485224098'),
(14,'郭强',6.60,'1486343033'),
(15,'周超',5.00,'1487570095'),
(16,'栖息地',20.00,'1488507544'),
(17,'杨萍',11.00,'1489368971'),
(18,'杨蹦蹦V587',20.00,'1490608429'),
(19,'锋行天下',20.00,'1499765536'),
(20,'周伟',50.00,'1500014307'),
(21,'王者不荣耀',20.00,'1500368368'),
(22,'老虎的虎',5.00,'1500867256'),
(23,'老夫子',20.00,'1501203253'),
(24,'我是传奇',20.00,'1501567608'),
(25,'秋心',10.00,'1501807989'),
(31,'晓强',20.00,'1506742161'),
(32,'再向南飞',20.00,'1507266070'),
(33,'女王大人',300.00,'1508807674'),
(34,'在路上',18.88,'1508851175'),
(35,'玉望灬',3.00,'1509091826'),
(36,'诚 ',40.00,'1510121131');

/*Table structure for table `clt_download` */

DROP TABLE IF EXISTS `clt_download`;

CREATE TABLE `clt_download` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `files` varchar(80) NOT NULL DEFAULT '',
  `ext` varchar(255) NOT NULL DEFAULT 'zip',
  `size` varchar(255) NOT NULL DEFAULT '',
  `downs` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `clt_download` */

insert  into `clt_download`(`id`,`catid`,`userid`,`username`,`title`,`title_style`,`thumb`,`keywords`,`description`,`content`,`template`,`posid`,`status`,`recommend`,`readgroup`,`readpoint`,`sort`,`hits`,`createtime`,`updatetime`,`files`,`ext`,`size`,`downs`) values 
(3,14,1,'admin','测试下载一','color:;font-weight:normal;','','测试下载一','测试下载一','请输入……','0',0,1,0,'',0,0,0,1529637588,0,'/uploads/20180622/a6f6381d3bf0f0814790ad4b5b121794.zip','zip','',0),
(4,14,1,'admin','测试下载二','color:;font-weight:normal;','','测试下载二','测试下载二','请输入……','0',2,1,0,'',0,0,0,1529638055,1534820130,'/uploads/20180803/d834d080f9c0080abaf9a7578ceea915.zip','zip','',0);

/*Table structure for table `clt_feast` */

DROP TABLE IF EXISTS `clt_feast`;

CREATE TABLE `clt_feast` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `title` varchar(120) DEFAULT '' COMMENT '标题',
  `open` int(1) DEFAULT '1' COMMENT '是否开启',
  `sort` int(4) DEFAULT '50' COMMENT '排序',
  `addtime` varchar(15) DEFAULT NULL COMMENT '添加时间',
  `feast_date` varchar(20) DEFAULT '' COMMENT '节日日期',
  `type` int(1) DEFAULT '1' COMMENT '1阳历 2农历',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='节日列表';

/*Data for the table `clt_feast` */

insert  into `clt_feast`(`id`,`title`,`open`,`sort`,`addtime`,`feast_date`,`type`) values 
(2,'圣诞节',1,50,'1513304012','12-25',1),
(3,'中秋节',1,2,'1513317857','07-12',1),
(4,'七夕',1,50,'1532420762','07-24',1);

/*Table structure for table `clt_feast_element` */

DROP TABLE IF EXISTS `clt_feast_element`;

CREATE TABLE `clt_feast_element` (
  `id` int(5) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `pid` int(4) DEFAULT NULL COMMENT '父级ID',
  `title` varchar(120) DEFAULT NULL COMMENT '标题',
  `css` text COMMENT 'CSS',
  `js` text COMMENT 'JS',
  `sort` int(5) DEFAULT '50' COMMENT '排序',
  `open` int(1) DEFAULT '1' COMMENT '是否开启',
  `addtime` varchar(15) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='节日元素表';

/*Data for the table `clt_feast_element` */

insert  into `clt_feast_element`(`id`,`pid`,`title`,`css`,`js`,`sort`,`open`,`addtime`) values 
(1,2,'内容雪人','#content-wrapper{position: relative;}\n#top-left img{width: 150px;}\n#top-left{position: absolute;top: 30px;left: -145px;}','$(\"#content-wrapper\").append(\"<div id=top-left><img src=/static/feast/christmas/top-left.png></div>\");',1,1,'1513309235'),
(2,2,'主页右下角驯鹿','#body-right-bottom{position: fixed;bottom: 0;right: 20px;z-index:51}\n#body-right-bottom img{width: 400px;}','$(\"body\").append(\"<div id=body-right-bottom><img src=/static/feast/christmas/body-right-bottom.png></div>\");',2,1,'1513309340'),
(3,2,'主页左下角圣诞树','#body-left-bottom{position: fixed;bottom: 0;left:0;z-index:51}\n#body-left-bottom img{width: 200px;}',' $(\"body\").append(\"<div id=body-left-bottom><img src=/static/feast/christmas/body-left-bottom.png></div>\");',3,1,'1513309488'),
(4,2,'主页右上角铃铛','#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 120px;}',' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/christmas/body-top-right.png></div>\");',4,1,'1513309568'),
(5,2,'主页左中部圣诞老人','#body-left-center{position: fixed;top: 300px;left: 0;z-index: 100;}\n#body-left-center img{width: 220px;}','$(\"body\").append(\"<div id=body-left-center><img src=/static/feast/christmas/body-left-center.png></div>\");',5,1,'1513309625'),
(6,2,'下载栏树叶','.rfeatured-box{position: relative;}\n#right-one-top-right img{width: 60px;}\n#right-one-top-right{position: absolute;top: 0;right: -10px;}',' $(\".featured-box\").append(\"<div id=right-one-top-right><img src=/static/feast/christmas/right-one-top-right.png></div>\");',6,1,'1513309980'),
(7,2,'导航栏雪景','header{position: relative;}\n#nav-bg img{}\n#nav-bg{position: absolute;bottom: -15px;height:30px;left: 0;width: 100%;background: url(\"/static/feast/christmas/nav-bg.png\")repeat-x; z-index:50}','$(\"header\").append(\"<div id=nav-bg><img src=/static/feast/christmas/nav-bg.png></div>\");',7,1,'1513310236'),
(8,2,'主页背景','body{background: url(\"/static/feast/christmas/zbg.png\") no-repeat 100% 100%;background-size: 100%;}','',50,1,'1513310497'),
(10,3,'主页左下角房子','#body-left-bottom{position: fixed;bottom: 0;left:0;}\n#body-left-bottom img{width: 200px;}',' $(\"body\").append(\"<div id=body-left-bottom><img src=/static/feast/zhongqiu/body-left-bottom.png></div>\");',50,1,'1513320275'),
(11,3,'左上角文字','#body-top-left{position: fixed;top:0;left0;z-index: 100;}\n#body-top-left img{width: 350px;}',' $(\"body\").append(\"<div id=body-top-left><img src=/static/feast/zhongqiu/body-top-left.png?111></div>\");',50,1,'1513320569'),
(12,3,'右上角嫦娥','#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 300px;}',' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/zhongqiu/body-top-right.png></div>\");',50,1,'1513321010'),
(13,4,'右上角喜鹊','#body-top-right{position: fixed;top: 0;right:0;z-index: 100;}\n#body-top-right img{width: 300px;}',' $(\"body\").append(\"<div id=body-top-right><img src=/static/feast/qixi/bird.png></div>\");',1,1,'1528689869');

/*Table structure for table `clt_field` */

DROP TABLE IF EXISTS `clt_field`;

CREATE TABLE `clt_field` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `moduleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(30) NOT NULL DEFAULT '',
  `tips` varchar(150) NOT NULL DEFAULT '',
  `required` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL DEFAULT '',
  `errormsg` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(20) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `setup` text,
  `ispost` tinyint(1) NOT NULL DEFAULT '0',
  `unpostgroup` varchar(60) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

/*Data for the table `clt_field` */

insert  into `clt_field`(`id`,`moduleid`,`field`,`name`,`tips`,`required`,`minlength`,`maxlength`,`pattern`,`errormsg`,`class`,`type`,`setup`,`ispost`,`unpostgroup`,`sort`,`status`,`issystem`) values 
(1,1,'title','标题','',1,1,80,'defaul','标题必须为1-80个字符','title','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)',1,'',1,1,1),
(2,1,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',8,0,0),
(3,1,'createtime','发布时间','',1,0,0,'date','','','datetime','',1,'',97,1,1),
(4,1,'template','模板','',0,0,0,'','','','template','',1,'',99,1,1),
(5,1,'status','状态','',0,0,0,'defaul','','status','radio','array (\n  \'options\' => \'发布|1\n定时发布|0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)',0,'',98,1,1),
(6,1,'content','内容','',1,0,0,'defaul','','content','editor','array (\n  \'edittype\' => \'wangEditor\',\n)',0,'',3,1,0),
(7,2,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',1,1,1),
(8,2,'title','标题','',1,1,80,'defaul','标题必须为1-80个字符','title','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n)',1,'',2,1,1),
(9,2,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',3,1,1),
(10,2,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',4,1,1),
(11,2,'content','内容','',0,0,0,'defaul','','content','editor','array (\n  \'edittype\' => \'UEditor\',\n)',1,'',5,1,1),
(12,2,'createtime','发布时间','',1,0,0,'date','','createtime','datetime','',1,'',6,1,1),
(13,2,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'',10,0,0),
(14,2,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',11,0,0),
(15,2,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',12,1,0),
(16,2,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'',13,1,1),
(17,2,'posid','推荐位','',0,0,0,'','','','posid','',1,'',14,1,1),
(18,2,'template','模板','',0,0,0,'','','','template','',1,'',15,1,1),
(19,2,'status','状态','',0,0,0,'defaul','','status','radio','array (\n  \'options\' => \'发布|1\n定时发布|2\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'default\' => \'1\',\n)',1,'',7,1,1),
(20,3,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',1,1,1),
(21,3,'title','标题','',1,1,80,'defaul','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'0\',\n  \'style\' => \'0\',\n)',1,'',2,1,1),
(22,3,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',3,1,1),
(23,3,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',4,1,1),
(24,3,'content','内容','',0,0,0,'defaul','','content','editor','array (\n  \'edittype\' => \'layedit\',\n)',1,'',7,1,1),
(25,3,'createtime','发布时间','',1,0,0,'date','','','datetime','',1,'',8,1,1),
(26,3,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'',10,0,0),
(27,3,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',11,0,0),
(28,3,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',12,0,0),
(29,3,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'',13,0,1),
(30,3,'posid','推荐位','',0,0,0,'','','','posid','',1,'',14,1,1),
(31,3,'template','模板','',0,0,0,'','','','template','',1,'',15,1,1),
(32,3,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'',9,1,1),
(33,3,'pic','图片','',1,0,0,'defaul','','pic','image','',0,'',5,1,0),
(34,3,'group','类型','',1,0,0,'defaul','','group','select','array (\n  \'options\' => \'模型管理|1\n分类管理|2\n内容管理|3\',\n  \'multiple\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n  \'numbertype\' => \'1\',\n  \'size\' => \'\',\n  \'default\' => \'\',\n)',0,'',6,1,0),
(35,4,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',1,1,1),
(36,4,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',2,1,1),
(37,4,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',3,1,1),
(38,4,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',4,1,1),
(39,4,'content','内容','',0,0,0,'defaul','','content','editor','array (\n  \'edittype\' => \'layedit\',\n)',1,'',8,1,1),
(40,4,'createtime','发布时间','',1,0,0,'date','','','datetime','',1,'',9,1,1),
(41,4,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'',10,1,1),
(42,4,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'',11,0,0),
(43,4,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',12,0,0),
(44,4,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',13,0,0),
(45,4,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'',14,0,1),
(46,4,'posid','推荐位','',0,0,0,'','','','posid','',1,'',15,1,1),
(47,4,'template','模板','',0,0,0,'','','','template','',1,'',16,1,1),
(48,4,'price','价格','',1,0,0,'defaul','','price','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'2\',\n  \'default\' => \'0.00\',\n)',0,'',5,1,0),
(49,4,'xinghao','型号','',0,0,0,'defaul','','','text','array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',6,1,0),
(50,4,'pics','图组','',0,0,0,'defaul','','pics','images','',0,'',7,1,0),
(51,5,'catid','栏目','',1,1,6,'','必须选择一个栏目','','catid','',1,'',1,1,1),
(52,5,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',2,1,1),
(53,5,'keywords','关键词','',0,0,80,'','','','text','array (\n  \'size\' => \'55\',\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',1,'',3,1,1),
(54,5,'description','SEO简介','',0,0,0,'','','','textarea','array (\n  \'fieldtype\' => \'mediumtext\',\n  \'rows\' => \'4\',\n  \'cols\' => \'55\',\n  \'default\' => \'\',\n)',1,'',4,1,1),
(55,5,'content','内容','',0,0,0,'defaul','','content','editor','array (\n  \'edittype\' => \'layedit\',\n)',1,'',9,1,1),
(56,5,'createtime','发布时间','',1,0,0,'date','','createtime','datetime','',1,'',10,1,1),
(57,5,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'',11,1,1),
(58,5,'recommend','允许评论','',0,0,1,'','','','radio','array (\n  \'options\' => \'允许评论|1\r\n不允许评论|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'\',\n  \'default\' => \'\',\n)',1,'',12,0,0),
(59,5,'readpoint','阅读收费','',0,0,5,'','','','number','array (\n  \'size\' => \'5\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',13,0,0),
(60,5,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',14,0,0),
(61,5,'readgroup','访问权限','',0,0,0,'','','','groupid','array (\n  \'inputtype\' => \'checkbox\',\n  \'fieldtype\' => \'tinyint\',\n  \'labelwidth\' => \'85\',\n  \'default\' => \'\',\n)',1,'',15,0,1),
(62,5,'posid','推荐位','',0,0,0,'','','','posid','',1,'',16,1,1),
(63,5,'template','模板','',0,0,0,'','','','template','',1,'',17,1,1),
(64,5,'files','上传文件','',0,0,0,'defaul','','files','file','array (\n  \'upload_allowext\' => \'zip,rar,doc,ppt\',\n)',0,'',5,1,0),
(65,5,'ext','文档类型','',0,0,0,'defaul','','ext','text','array (\n  \'default\' => \'zip\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',6,1,0),
(66,5,'size','文档大小','',0,0,0,'defaul','','size','text','array (\n  \'default\' => \'\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',7,1,0),
(67,5,'downs','下载次数','',0,0,0,'defaul','','','number','array (\n  \'size\' => \'\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'\',\n)',0,'',8,1,0),
(68,6,'title','标题','',1,1,80,'','标题必须为1-80个字符','','title','array (\n  \'thumb\' => \'1\',\n  \'style\' => \'1\',\n  \'size\' => \'55\',\n)',1,'',2,1,1),
(69,6,'hits','点击次数','',0,0,8,'','','','number','array (\n  \'size\' => \'10\',\n  \'numbertype\' => \'1\',\n  \'decimaldigits\' => \'0\',\n  \'default\' => \'0\',\n)',1,'',6,0,0),
(70,6,'createtime','发布时间','',1,0,0,'date','','','datetime','',1,'',4,1,1),
(71,6,'template','模板','',0,0,0,'','','','template','',1,'',7,1,1),
(72,6,'status','状态','',0,0,0,'','','','radio','array (\n  \'options\' => \'发布|1\r\n定时发布|0\',\n  \'fieldtype\' => \'tinyint\',\n  \'numbertype\' => \'1\',\n  \'labelwidth\' => \'75\',\n  \'default\' => \'1\',\n)',1,'',5,1,1),
(73,6,'catid','分类','',1,0,0,'defaul','','catid','catid','',0,'',1,1,0),
(74,6,'info','简介','',1,0,0,'defaul','','info','editor','array (\n  \'edittype\' => \'layedit\',\n)',0,'',3,1,0),
(75,2,'copyfrom','来源','',0,0,0,'defaul','','copyfrom','text','array (\n  \'default\' => \'CLTPHP\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',8,1,0),
(76,2,'fromlink','来源网址','',0,0,0,'defaul','','fromlink','text','array (\n  \'default\' => \'http://www.cltphp.com/\',\n  \'ispassword\' => \'0\',\n  \'fieldtype\' => \'varchar\',\n)',0,'',9,1,0);

/*Table structure for table `clt_link` */

DROP TABLE IF EXISTS `clt_link`;

CREATE TABLE `clt_link` (
  `link_id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '链接名称',
  `url` varchar(200) NOT NULL COMMENT '链接URL',
  `type_id` tinyint(4) DEFAULT NULL COMMENT '所属栏目ID',
  `qq` varchar(20) NOT NULL COMMENT '联系QQ',
  `sort` int(5) NOT NULL DEFAULT '50' COMMENT '排序',
  `addtime` int(11) NOT NULL COMMENT '添加时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '0禁用1启用',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `clt_link` */

insert  into `clt_link`(`link_id`,`name`,`url`,`type_id`,`qq`,`sort`,`addtime`,`open`) values 
(10,'CLTPHP','http://www.cltphp.com/',0,'1109305987',1,1495183645,1),
(8,'CLTPHP内容管理系统','http://www.cltphp.com/',0,'1109305987',2,1484791374,1),
(11,'CLTPHP动态','http://www.cltphp.com/news-49.html',0,'',3,1499765975,1),
(12,'关于我们','http://cltphp.com/about-8.html',0,'',4,1499766009,1),
(13,'CLTPHP相关知识','http://cltphp.com/news-51.html',0,'',5,1499766031,1),
(15,'有你有我影视','http://www.ynywo.com/',0,'',6,1501030917,1);

/*Table structure for table `clt_message` */

DROP TABLE IF EXISTS `clt_message`;

CREATE TABLE `clt_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT '' COMMENT '留言标题',
  `tel` varchar(15) NOT NULL DEFAULT '' COMMENT '留言电话',
  `addtime` varchar(15) NOT NULL COMMENT '留言时间',
  `open` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1=审核 0=不审核',
  `ip` varchar(50) DEFAULT '' COMMENT '留言者IP',
  `content` longtext NOT NULL COMMENT '留言内容',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(50) NOT NULL COMMENT '留言邮箱',
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

/*Data for the table `clt_message` */

insert  into `clt_message`(`message_id`,`title`,`tel`,`addtime`,`open`,`ip`,`content`,`name`,`email`) values 
(92,'呵呵','','1528851199',0,'127.0.0.1','为什么还不更新？','chichu','1109305987@qq.com'),
(93,'11','','1530629400',0,'127.0.0.1','11','11','11'),
(94,'11','','1530777448',0,'127.0.0.1','11','11','11'),
(95,'11','','1542781283',0,'127.0.0.1','<p>111</p>','11','110@qq.com');

/*Table structure for table `clt_module` */

DROP TABLE IF EXISTS `clt_module`;

CREATE TABLE `clt_module` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(200) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listfields` varchar(255) NOT NULL DEFAULT '',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

/*Data for the table `clt_module` */

insert  into `clt_module`(`id`,`title`,`name`,`description`,`type`,`issystem`,`listfields`,`sort`,`status`) values 
(1,'单页模型','page','单页面',1,0,'*',0,1),
(2,'文章模型','article','新闻文章',1,0,'*',0,1),
(3,'图片模型','picture','图片展示',1,0,'*',0,1),
(4,'产品模型','product','产品展示',1,0,'*',0,1),
(5,'下载模型','download','文件下载',1,0,'*',0,1),
(6,'团队模型','team','员工展示',1,0,'*',0,1);

/*Table structure for table `clt_oauth` */

DROP TABLE IF EXISTS `clt_oauth`;

CREATE TABLE `clt_oauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '账号类型',
  `openid` varchar(120) DEFAULT NULL COMMENT '第三方唯一标示',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `clt_oauth` */

/*Table structure for table `clt_page` */

DROP TABLE IF EXISTS `clt_page`;

CREATE TABLE `clt_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` varchar(255) NOT NULL DEFAULT '1',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content` text COMMENT '内容',
  `template` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `clt_page` */

insert  into `clt_page`(`id`,`title`,`title_style`,`thumb`,`hits`,`status`,`userid`,`username`,`sort`,`createtime`,`updatetime`,`lang`,`content`,`template`) values 
(2,'关于我们','color:rgb(95, 184, 120);font-weight:bold;','/uploads/20180611/b78388d0d1b123e06d900c4d1a1d88ba.jpg',40,'1',0,'',0,1504251653,0,0,'<p style=\"font-size:14px;font-family:;\">\n	<a href=\"http://www.cltphp.com/\" target=\"_blank\"><span style=\"color:#92D050;\">CLTPHP内容管理系统</span></a>，包含系统设置，权限管理，模型管理，数据库管理，栏目管理，会员管理，网站功能，模版管理，微信管理等相关模块。基于ThinkPHP5开发，后台采用Layui框架完全自适应，数据交互采用更高效简洁的angularjs实现，。\n</p>\n<p style=\"font-size:14px;font-family:\'Microsoft yahei\', Arial, Tahoma, Verdana;vertical-align:baseline;color:#979797;background-color:#FFFFFF;\">\n	  <a target=\"_blank\" href=\"http://www.cltphp.com/\"><span style=\"color:#92D050;\">CLTPHP</span></a>采用ThinkPHP开发，ThinkPHP5采用全新的架构思想，引入了很多的PHP新特性，优化了核心，减少了依赖，实现了真正的惰性加载。正因为ThinkPHP的这些新特性，从而使得CLTPHP的执行速度成倍提高。\n</p>\n<p style=\"font-size:14px;\">\n	  UI方面，<a target=\"_blank\" href=\"http://www.cltphp.com/\"><span style=\"color:#92D050;\">CLTPHP</span></a>采用了最受欢迎的Layui，Layui用于开发响应式布局、移动设备优先的 WEB 项目。简洁、直观、强悍的前端开发框架，让CLTPHP的后台界面更加美观，开发更迅速、简单。</p><p><br></p>','0'),
(8,'联系我们','color:;font-weight:normal;','',12,'1',0,'',0,1499765407,0,0,'<p>您的支持是我们一往无前的无限动力，非常荣幸在<a target=\"_self\" href=\"http://www.cltphp.com/\">CLTPHP</a>成长的道路上有您的陪伴！！！</p>','');

/*Table structure for table `clt_picture` */

DROP TABLE IF EXISTS `clt_picture`;

CREATE TABLE `clt_picture` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(80) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `pic` varchar(80) NOT NULL DEFAULT '',
  `group` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `clt_picture` */

insert  into `clt_picture`(`id`,`catid`,`userid`,`username`,`title`,`keywords`,`description`,`content`,`template`,`posid`,`status`,`recommend`,`readgroup`,`readpoint`,`sort`,`hits`,`createtime`,`updatetime`,`pic`,`group`) values 
(1,4,1,'admin','模型列表','模型列表','展示网站内容模型，模型是CLTPHP的核心之一。','<p>展示网站内容模型，模型是CLTPHP的核心之一。</p>','0',0,1,0,'',0,1,1,1499761915,1528699234,'/uploads/20180611/0ce39ef421e7ca7149b2630d93b571ee.png','1'),
(2,4,1,'admin','添加模型','添加模型','添加模型','<p>您可以通过后台轻松创建新的新的模型，不拘泥于传统。</p>','0',0,1,0,'',0,2,0,1499762188,1528699288,'/uploads/20180611/e41226ad6f977aeb2418a0f55a0678ef.png','1'),
(3,4,1,'admin','模型字段','模型字段','模型字段','<p>您可以任意构建自己的模型字段，从而达到网站内容的高效编辑。</p>','0',0,1,0,'',0,3,0,1499762270,1528699324,'/uploads/20180611/57027c6ab845effea600f6f9695e2db4.png','1'),
(4,4,1,'admin','添加字段','添加字段','添加字段','<p>CLTPHP提供了丰富的字段类型，当然您可以扩展出更多的类型。</p>','0',0,1,0,'',0,4,0,1499762323,1528699410,'/uploads/20180611/85f128c3c9488a41b04386e31199ab3f.png','1'),
(5,4,1,'admin','栏目列表','栏目列表','栏目列表','<p>栏目编辑，可以让后台编辑明确，也可以使的前台展示更加分明。</p>','0',0,1,0,'',0,5,0,1499762369,1528699472,'/uploads/20180611/2b6456d6725ce4ad1a8dd66b595f1eb9.png','2'),
(6,4,1,'admin','添加栏目','添加栏目','添加栏目','<p>添加栏目时绑定模型，以适应网站内容的多样性。</p>','0',0,1,0,'',0,6,0,1499762446,1528699568,'/uploads/20180611/953235f4e44df6dd63de15bb28ea0bc5.png','2'),
(7,4,1,'admin','内容列表','内容列表','内容列表','<p>点击栏目名称进入对应的内容列表页，简洁而高效。</p>','0',0,1,0,'',0,7,0,1499762523,1528699605,'/uploads/20180611/fb3193674fb2ea68f2a61d4de0859a0e.png','3'),
(8,4,1,'admin','添加内容','添加内容','添加内容','<p>不同栏目的内容编辑页是根据及绑定的模型智能生成的。</p>','0',0,1,0,'',0,8,0,1499762754,1528699629,'/uploads/20180611/ef322c904a47681d32aa4338316bac18.png','3');

/*Table structure for table `clt_plugin` */

DROP TABLE IF EXISTS `clt_plugin`;

CREATE TABLE `clt_plugin` (
  `code` varchar(13) DEFAULT NULL COMMENT '插件编码',
  `name` varchar(55) DEFAULT NULL COMMENT '中文名字',
  `version` varchar(255) DEFAULT NULL COMMENT '插件的版本',
  `author` varchar(30) DEFAULT NULL COMMENT '插件作者',
  `config` text COMMENT '配置信息',
  `config_value` text COMMENT '配置值信息',
  `desc` varchar(255) DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) DEFAULT '0' COMMENT '是否启用',
  `type` varchar(50) DEFAULT NULL COMMENT '插件类型 payment支付 login 登陆 shipping物流',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `bank_code` text COMMENT '网银配置信息',
  `scene` tinyint(1) DEFAULT '0' COMMENT '使用场景 0 PC+手机 1 手机 2 PC'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `clt_plugin` */

insert  into `clt_plugin`(`code`,`name`,`version`,`author`,`config`,`config_value`,`desc`,`status`,`type`,`icon`,`bank_code`,`scene`) values 
('qq','QQ登陆','1.0','CLTPHP','a:5:{i:0;a:4:{s:4:\"name\";s:5:\"appid\";s:5:\"label\";s:5:\"appid\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:6:\"appkey\";s:5:\"label\";s:6:\"appkey\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:8:\"callback\";s:5:\"label\";s:12:\"回调地址\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:37:\"http://cltdemo.test/index/callback/qq\";}i:3;a:4:{s:4:\"name\";s:5:\"scope\";s:5:\"label\";s:12:\"获取字段\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";}i:4;a:4:{s:4:\"name\";s:11:\"errorReport\";s:5:\"label\";s:12:\"错误报告\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:4:\"true\";}}','a:5:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";}','QQ登陆插件 ',1,'login','logo.png','s:0:\"\";',0),
('changyan','畅言评论','1.0','CLTPHP','a:3:{i:0;a:4:{s:4:\"name\";s:6:\"app_id\";s:5:\"label\";s:6:\"app_id\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"name\";s:7:\"app_key\";s:5:\"label\";s:7:\"app_key\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"name\";s:6:\"config\";s:5:\"label\";s:6:\"config\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";}}','a:8:{s:5:\"appid\";s:0:\"\";s:6:\"appkey\";s:0:\"\";s:8:\"callback\";s:37:\"http://cltdemo.test/index/callback/qq\";s:5:\"scope\";s:225:\"get_user_info,add_share,list_album,add_album,upload_pic,add_topic,add_one_blog,add_weibo,check_page_fans,add_t,add_pic_t,del_t,get_repost_list,get_info,get_other_info,get_fanslist,get_idolist,add_idol,del_idol,get_tenpay_addr\";s:11:\"errorReport\";s:4:\"true\";s:6:\"app_id\";s:0:\"\";s:7:\"app_key\";s:0:\"\";s:6:\"config\";s:0:\"\";}','畅言评论插件 ',1,'msg','logo.png','s:0:\"\";',0);

/*Table structure for table `clt_posid` */

DROP TABLE IF EXISTS `clt_posid`;

CREATE TABLE `clt_posid` (
  `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `sort` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `clt_posid` */

insert  into `clt_posid`(`id`,`name`,`sort`) values 
(1,'首页推荐',0),
(2,'当前分类推荐',0);

/*Table structure for table `clt_product` */

DROP TABLE IF EXISTS `clt_product`;

CREATE TABLE `clt_product` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `keywords` varchar(120) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `content` text NOT NULL,
  `template` varchar(40) NOT NULL DEFAULT '',
  `posid` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `recommend` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `readgroup` varchar(100) NOT NULL DEFAULT '',
  `readpoint` smallint(5) NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `xinghao` varchar(255) NOT NULL DEFAULT '',
  `pics` mediumtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`id`,`status`,`sort`),
  KEY `catid` (`id`,`catid`,`status`),
  KEY `listorder` (`id`,`catid`,`status`,`sort`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `clt_product` */

/*Table structure for table `clt_region` */

DROP TABLE IF EXISTS `clt_region`;

CREATE TABLE `clt_region` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(120) NOT NULL DEFAULT '0',
  `type` tinyint(1) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;

/*Data for the table `clt_region` */

insert  into `clt_region`(`id`,`pid`,`name`,`type`) values 
(1,0,'中国',0),
(2,1,'北京',1),
(3,1,'安徽',1),
(4,1,'福建',1),
(5,1,'甘肃',1),
(6,1,'广东',1),
(7,1,'广西',1),
(8,1,'贵州',1),
(9,1,'海南',1),
(10,1,'河北',1),
(11,1,'河南',1),
(12,1,'黑龙江',1),
(13,1,'湖北',1),
(14,1,'湖南',1),
(15,1,'吉林',1),
(16,1,'江苏',1),
(17,1,'江西',1),
(18,1,'辽宁',1),
(19,1,'内蒙古',1),
(20,1,'宁夏',1),
(21,1,'青海',1),
(22,1,'山东',1),
(23,1,'山西',1),
(24,1,'陕西',1),
(25,1,'上海',1),
(26,1,'四川',1),
(27,1,'天津',1),
(28,1,'西藏',1),
(29,1,'新疆',1),
(30,1,'云南',1),
(31,1,'浙江',1),
(32,1,'重庆',1),
(33,1,'香港',1),
(34,1,'澳门',1),
(35,1,'台湾',1),
(36,3,'安庆',2),
(37,3,'蚌埠',2),
(38,3,'巢湖',2),
(39,3,'池州',2),
(40,3,'滁州',2),
(41,3,'阜阳',2),
(42,3,'淮北',2),
(43,3,'淮南',2),
(44,3,'黄山',2),
(45,3,'六安',2),
(46,3,'马鞍山',2),
(47,3,'宿州',2),
(48,3,'铜陵',2),
(49,3,'芜湖',2),
(50,3,'宣城',2),
(51,3,'亳州',2),
(52,2,'北京',2),
(53,4,'福州',2),
(54,4,'龙岩',2),
(55,4,'南平',2),
(56,4,'宁德',2),
(57,4,'莆田',2),
(58,4,'泉州',2);

/*Table structure for table `clt_role` */

DROP TABLE IF EXISTS `clt_role`;

CREATE TABLE `clt_role` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sort` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `clt_role` */

insert  into `clt_role`(`id`,`name`,`status`,`remark`,`pid`,`sort`) values 
(1,'超级管理员',1,'超级管理',0,0),
(2,'普通管理员',1,'普通管理员',0,0),
(3,'注册用户',1,'注册用户',0,0),
(4,'游客',1,'游客',0,0);

/*Table structure for table `clt_role_user` */

DROP TABLE IF EXISTS `clt_role_user`;

CREATE TABLE `clt_role_user` (
  `role_id` mediumint(9) unsigned DEFAULT '0',
  `user_id` char(32) DEFAULT '0',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `clt_role_user` */

/*Table structure for table `clt_system` */

DROP TABLE IF EXISTS `clt_system`;

CREATE TABLE `clt_system` (
  `id` int(36) unsigned NOT NULL,
  `name` char(36) NOT NULL DEFAULT '' COMMENT '网站名称',
  `url` varchar(36) NOT NULL DEFAULT '' COMMENT '网址',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `key` varchar(200) NOT NULL COMMENT '关键字',
  `des` varchar(200) NOT NULL COMMENT '描述',
  `bah` varchar(50) DEFAULT NULL COMMENT '备案号',
  `copyright` varchar(30) DEFAULT NULL COMMENT 'copyright',
  `ads` varchar(120) DEFAULT NULL COMMENT '公司地址',
  `tel` varchar(15) DEFAULT NULL COMMENT '公司电话',
  `email` varchar(50) DEFAULT NULL COMMENT '公司邮箱',
  `logo` varchar(120) DEFAULT NULL COMMENT 'logo',
  `mobile` varchar(10) DEFAULT 'open' COMMENT '是否开启手机端 open 开启 close 关闭',
  `code` varchar(10) DEFAULT 'close' COMMENT '是否开启验证码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `clt_system` */

insert  into `clt_system`(`id`,`name`,`url`,`title`,`key`,`des`,`bah`,`copyright`,`ads`,`tel`,`email`,`logo`,`mobile`,`code`) values 
(1,'CLTPHP','http://cltshow.test/','CLTPHP','CLTPHP,CLTPHP内容管理系统,php','CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。','陕ICP备15008093号-3','2015-2020','西安市雁塔区','18792402229','1109305556@qq.com','/uploads/20180608/55624159eb051a6c5e9bfadff49bf731.png','open','open');

/*Table structure for table `clt_team` */

DROP TABLE IF EXISTS `clt_team`;

CREATE TABLE `clt_team` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(120) NOT NULL DEFAULT '',
  `title_style` varchar(225) NOT NULL DEFAULT '',
  `thumb` varchar(225) NOT NULL DEFAULT '',
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `userid` int(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(40) NOT NULL DEFAULT '',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) unsigned NOT NULL DEFAULT '0',
  `lang` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `info` text NOT NULL,
  `template` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `clt_team` */

insert  into `clt_team`(`id`,`title`,`title_style`,`thumb`,`hits`,`status`,`userid`,`username`,`sort`,`createtime`,`updatetime`,`lang`,`catid`,`info`,`template`) values 
(1,'快乐的毛豆豆—前端工程师','color:rgb(57, 61, 73);font-weight:normal;','/uploads/20180613/27f4cfe5854eb4cfdfd87399a60c7cbd.jpg',0,1,1,'admin',0,1499764958,1528876606,0,7,'<p>2年设计、3年前端，从菜鸟到老手，从未停止追求细节的完美。注重细节，追求完美已成为习惯。</p>',NULL),
(2,'褫憷—软件工程师','color:rgb(57, 61, 73);font-weight:normal;','/uploads/20180613/7d4aaaf4c86aac002184dace64cf179e.jpg',1,1,1,'admin',0,1499765015,1528876594,0,7,'<p>5年开发、3年前端，不断的自我建设，来保持向上的状态。</p>',NULL);

/*Table structure for table `clt_user_level` */

DROP TABLE IF EXISTS `clt_user_level`;

CREATE TABLE `clt_user_level` (
  `level_id` smallint(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `level_name` varchar(30) DEFAULT NULL COMMENT '头衔名称',
  `sort` int(3) DEFAULT '0' COMMENT '排序',
  `bomlimit` int(5) DEFAULT '0' COMMENT '积分下限',
  `toplimit` int(5) DEFAULT '0' COMMENT '积分上限',
  PRIMARY KEY (`level_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `clt_user_level` */

insert  into `clt_user_level`(`level_id`,`level_name`,`sort`,`bomlimit`,`toplimit`) values 
(1,'注册会员',1,0,500),
(2,'铜牌会员',2,501,1000),
(3,'白银会员',3,1001,2000),
(4,'黄金会员',4,2001,3500),
(5,'钻石会员',5,3501,5500),
(6,'超级VIP',6,5500,99999);

/*Table structure for table `clt_users` */

DROP TABLE IF EXISTS `clt_users`;

CREATE TABLE `clt_users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `email` varchar(60) NOT NULL DEFAULT '' COMMENT '邮件',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `paypwd` varchar(32) DEFAULT NULL COMMENT '支付密码',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '1 男 0 女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `qq` varchar(20) NOT NULL DEFAULT '' COMMENT 'QQ',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_validated` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证手机',
  `oauth` varchar(10) DEFAULT '' COMMENT '第三方来源 wx weibo alipay',
  `openid` varchar(100) DEFAULT NULL COMMENT '第三方唯一标示',
  `unionid` varchar(100) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `province` int(6) DEFAULT '0' COMMENT '省份',
  `city` int(6) DEFAULT '0' COMMENT '市区',
  `district` int(6) DEFAULT '0' COMMENT '县',
  `email_validated` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否验证电子邮箱',
  `username` varchar(50) DEFAULT NULL COMMENT '第三方返回昵称',
  `level` tinyint(1) DEFAULT '1' COMMENT '会员等级',
  `is_lock` tinyint(1) DEFAULT '0' COMMENT '是否被锁定冻结',
  `token` varchar(64) DEFAULT '' COMMENT '用于app 授权类似于session_id',
  `sign` varchar(255) DEFAULT '' COMMENT '签名',
  `status` varchar(20) DEFAULT 'hide' COMMENT '登录状态',
  PRIMARY KEY (`id`),
  KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `clt_users` */

insert  into `clt_users`(`id`,`email`,`password`,`paypwd`,`sex`,`birthday`,`reg_time`,`last_login`,`last_ip`,`qq`,`mobile`,`mobile_validated`,`oauth`,`openid`,`unionid`,`avatar`,`province`,`city`,`district`,`email_validated`,`username`,`level`,`is_lock`,`token`,`sign`,`status`) values 
(1,'1109305987@qq.com','',NULL,1,0,1516075631,0,'','','44311',0,'',NULL,NULL,'/uploads/20180613/fcb729987d8e9339bd9b2e85c85f3028.jpg',24,311,2599,0,'chichu',1,0,'','不要应为走得太远，就忘了当初为什么出发！','hide'),
(2,'','e10adc3949ba59abbe56e057f20f883e',NULL,0,0,1542781390,0,'','','18092591522',1,'',NULL,NULL,NULL,0,0,0,0,'chichu',1,0,'','','hide');

/*Table structure for table `clt_wx_auth` */

DROP TABLE IF EXISTS `clt_wx_auth`;

CREATE TABLE `clt_wx_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT '0' COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权';

/*Data for the table `clt_wx_auth` */

/*Table structure for table `clt_wx_config` */

DROP TABLE IF EXISTS `clt_wx_config`;

CREATE TABLE `clt_wx_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '1' COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';

/*Data for the table `clt_wx_config` */

insert  into `clt_wx_config`(`id`,`instance_id`,`key`,`value`,`desc`,`is_use`,`create_time`,`modify_time`) values 
(1,0,'WCHAT','{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/b2c1.01.niushop.com.cn\",\"CALLBACK\":\"http:\\/\\/b2c1.01.niushop.com.cn\\/wap\\/Login\\/callback\"}','微信',0,1488350947,1497105440),
(2,0,'SHOPWCHAT','{\"appid\":\"dfdsfdsf90bc7b7a\",\"appsecret\":\"e5147ce07128asdfds222f628b5c3fe1af2ea5797\",\"token\":\"dffdf\"}','',1,1497088090,1528690160);

/*Table structure for table `clt_wx_default_replay` */

DROP TABLE IF EXISTS `clt_wx_default_replay`;

CREATE TABLE `clt_wx_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

/*Data for the table `clt_wx_default_replay` */

insert  into `clt_wx_default_replay`(`id`,`instance_id`,`reply_media_id`,`sort`,`create_time`,`modify_time`) values 
(3,0,4,0,1528695059,0);

/*Table structure for table `clt_wx_fans` */

DROP TABLE IF EXISTS `clt_wx_fans`;

CREATE TABLE `clt_wx_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT '1' COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT '1' COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT '0' COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT '0' COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT '0' COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';

/*Data for the table `clt_wx_fans` */

/*Table structure for table `clt_wx_follow_replay` */

DROP TABLE IF EXISTS `clt_wx_follow_replay`;

CREATE TABLE `clt_wx_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';

/*Data for the table `clt_wx_follow_replay` */

insert  into `clt_wx_follow_replay`(`id`,`instance_id`,`reply_media_id`,`sort`,`create_time`,`modify_time`) values 
(2,0,1,0,1528695047,0);

/*Table structure for table `clt_wx_key_replay` */

DROP TABLE IF EXISTS `clt_wx_key_replay`;

CREATE TABLE `clt_wx_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `modify_time` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复';

/*Data for the table `clt_wx_key_replay` */

insert  into `clt_wx_key_replay`(`id`,`instance_id`,`key`,`match_type`,`reply_media_id`,`sort`,`create_time`,`modify_time`) values 
(2,0,'你好',1,3,0,1528696514,0);

/*Table structure for table `clt_wx_media` */

DROP TABLE IF EXISTS `clt_wx_media`;

CREATE TABLE `clt_wx_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_time` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;

/*Data for the table `clt_wx_media` */

insert  into `clt_wx_media`(`media_id`,`title`,`instance_id`,`type`,`sort`,`create_time`,`modify_time`) values 
(1,'欢迎您来到CLTPHP官方公众号大世界！',0,'1',0,1512551413,0),
(2,'你好，欢迎来到CLTPHP的世界！',0,'1',0,1512550726,0),
(3,'CLTPHP内容管理系统',0,'2',0,1512550547,0),
(4,'CLTPHP内容管理系统5.2.2发布',0,'3',0,1528694363,0),
(5,'CLTPHP操作开发手册已完全更新',0,'2',0,1528694392,0),
(6,'1111',0,'1',0,1528694379,0);

/*Table structure for table `clt_wx_media_item` */

DROP TABLE IF EXISTS `clt_wx_media_item`;

CREATE TABLE `clt_wx_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT '1' COMMENT '封面图片显示在正文中',
  `summary` text,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712;

/*Data for the table `clt_wx_media_item` */

insert  into `clt_wx_media_item`(`id`,`media_id`,`title`,`author`,`cover`,`show_cover_pic`,`summary`,`content`,`content_source_url`,`sort`,`hits`) values 
(28,3,'CLTPHP内容管理系统','cltphp','/uploads/20171206/6dfec00133ee42c5c33cea8ab0cfad8f.png',1,'CLTPHP内容管理系统，微信公众平台、APP移动应用设计、HTML5网站API定制开发。大型企业网站、个人博客论坛、手机网站定制开发。更高效、更快捷的进行定制开发。','<p style=\"text-indent: 2em;\"><span style=\"text-indent: 2em;\">虽然世界上有成千上万的建站系统，但CLTPHP会告诉你，真正高效的建站系统是什么样的。</span><br/></p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">CLTPHP采用了优美的layui框架，一面极简，一面丰盈。加上angular Js，让数据交互变得更为简洁直白。用最基础的代码，实现最强大的效果，让你欲罢不能！</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-indent: 2em;\">CLTPHP采用的ThinkPHP5为基础框架，从而使得CLTPHP的拓展性变的极为强大。从模型构造到栏目建立，再到前台展示，一气呵成，网站后台一条龙式操作，让小白用户能快速掌握CLTPHP管理系统的核心操作，让小白开发者能更好的理解CLTPHP的核心构建价值。</p><p><br/></p>','http://www.cltphp.com/',0,6),
(29,2,'你好，欢迎来到CLTPHP的世界！','','',0,'','','',0,0),
(42,1,'欢迎您来到CLTPHP官方公众号大世界！','','',0,'','','',0,0),
(47,4,'CLTPHP内容管理系统5.2.2发布','chichu','/uploads/20180611/5df2c8dabd33e0a0672dcb94b51d5ada.jpg',1,'这是一篇多图文','<h4 style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-weight: normal; font-stretch: inherit; font-size: 22px; line-height: inherit; font-family: \">CLTPHP5.2.2发布</h4><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; vertical-align: baseline; margin: 0px; padding: 0px;\">修改bug若干</span></p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px;\">下载地址：</span><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px;\"><a href=\"http://qiniu.cltphp.com/cltphp5.2.2.zip\" target=\"_self\" title=\"CLTPHP5.2.2\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; color: rgb(0, 176, 80); outline: 0px;\"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px; text-decoration: none;\">CLTPHP5.2.2</span></a></span></span></p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px;\"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px;\">补丁地址：</span><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px;\"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: 700; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; color: rgb(0, 176, 80); outline: 0px;\"><span style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: 24px; vertical-align: baseline; margin: 0px; padding: 0px; text-decoration: none;\"><a href=\"http://qiniu.cltphp.com/CLTPHP5.2.1%E5%88%B05.2.2%E8%A1%A5%E4%B8%81.zip\" target=\"_self\" style=\"box-sizing: border-box; border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline; margin: 0px; padding: 0px; color: rgb(0, 176, 80); outline: 0px;\">CLTPHP5.2.1到5.2.2升级</a></span></span></span></p>','http://www.cltphp.com/newsInfo-44-5.html',0,0),
(48,4,'给我们一点点时间 我们给你一个新突破','chichu','/uploads/20171206/18fd882e982e07e7b35dac5b962ab393.jpg',0,'给我们一点点时间 我们给你一个新突破','<p><span style=\"color: rgb(102, 102, 102); font-family: \">说实话，最近这段时间我们太忙了</span><img src=\"http://img.baidu.com/hi/jx2/j_0016.gif\"/><span style=\"color: rgb(102, 102, 102); font-family: \">，cltphp的开发，甚至可以说是搁浅了一段时间。不过，各位请耐心等待一下啊，给我们一点点时间，或许不止一点点，我们给你一个新突破。</span></p>','http://www.cltphp.com/newsInfo-45-5.html',0,0),
(49,4,'CLTPHP操作开发手册已完全更新','chichu','/uploads/20171206/db19ac0c46a3ffd4ebf94028024d3036.jpg',1,'CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。','<p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">喜欢的朋友可以购买参考</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">手册地址：<a href=\"https://www.kancloud.cn/chichu/cltphp/\" target=\"_self\">https://www.kancloud.cn/chichu/cltphp/</a></p><p><br/></p>','http://www.cltphp.com/newsInfo-16-5.html',0,0),
(50,6,'1111','','',0,'','','',0,0),
(51,5,'CLTPHP操作开发手册已完全更新','chichu','/uploads/20180611/12e57c01f2bd9172c8c26de45cb796a6.jpg',0,'CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。','<p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">CLTPHP操作开发手册已完全更新，CLTPHP核心价值，尽在其中。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; font-family: \">喜欢的朋友可以购买参考</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">同时希望CLTPHP的爱好者，可以给我提出更多CLTPHP的不足之处，让CLTPHP更健康的成长。</p><p style=\"box-sizing: border-box; border: 0px; font-variant-numeric: inherit; font-stretch: inherit; font-size: 14px; line-height: 24px; text-indent: 2em;\">手册地址：https://www.kancloud.cn/chichu/cltphp/</p><p><br/></p>','https://www.kancloud.cn/chichu/cltphp',0,0);

/*Table structure for table `clt_wx_menu` */

DROP TABLE IF EXISTS `clt_wx_menu`;

CREATE TABLE `clt_wx_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT '0' COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT '0' COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_date` int(11) DEFAULT '0' COMMENT '创建日期',
  `modify_date` int(11) DEFAULT '0' COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单';

/*Data for the table `clt_wx_menu` */

insert  into `clt_wx_menu`(`menu_id`,`instance_id`,`menu_name`,`ico`,`pid`,`menu_event_type`,`media_id`,`menu_event_url`,`hits`,`sort`,`create_date`,`modify_date`) values 
(1,0,'官网','',0,2,3,'http://www.cltphp.com/',0,1,1512442512,0),
(2,0,'手册','',0,2,5,'http://www.cltphp.com/',0,2,1512442543,0),
(3,0,'论坛','',0,1,4,'http://bbs.cltphp.com/',0,3,1512547727,0),
(4,0,'百度','',3,1,0,'http://www.baodu.com',0,1,1542783759,0);

/*Table structure for table `clt_wx_user` */

DROP TABLE IF EXISTS `clt_wx_user`;

CREATE TABLE `clt_wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表id',
  `uid` int(11) NOT NULL COMMENT 'uid',
  `wxname` varchar(60) NOT NULL COMMENT '公众号名称',
  `aeskey` varchar(256) NOT NULL DEFAULT '' COMMENT 'aeskey',
  `encode` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'encode',
  `appid` varchar(50) NOT NULL DEFAULT '' COMMENT 'appid',
  `appsecret` varchar(50) NOT NULL DEFAULT '' COMMENT 'appsecret',
  `wxid` varchar(64) NOT NULL COMMENT '公众号原始ID',
  `weixin` char(64) NOT NULL COMMENT '微信号',
  `token` char(255) NOT NULL COMMENT 'token',
  `w_token` varchar(150) NOT NULL DEFAULT '' COMMENT '微信对接token',
  `create_time` int(11) NOT NULL COMMENT 'create_time',
  `updatetime` int(11) NOT NULL COMMENT 'updatetime',
  `tplcontentid` varchar(2) NOT NULL COMMENT '内容模版ID',
  `share_ticket` varchar(150) NOT NULL COMMENT '分享ticket',
  `share_dated` char(15) NOT NULL COMMENT 'share_dated',
  `authorizer_access_token` varchar(200) NOT NULL COMMENT 'authorizer_access_token',
  `authorizer_refresh_token` varchar(200) NOT NULL COMMENT 'authorizer_refresh_token',
  `authorizer_expires` char(10) NOT NULL COMMENT 'authorizer_expires',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `web_access_token` varchar(200) NOT NULL COMMENT '网页授权token',
  `web_refresh_token` varchar(200) NOT NULL COMMENT 'web_refresh_token',
  `web_expires` int(11) NOT NULL COMMENT '过期时间',
  `menu_config` text COMMENT '菜单',
  `wait_access` tinyint(1) DEFAULT '0' COMMENT '微信接入状态,0待接入1已接入',
  `concern` varchar(225) DEFAULT '' COMMENT '关注回复',
  `default` varchar(225) DEFAULT '' COMMENT '默认回复',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `uid_2` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='微信公共帐号';

/*Data for the table `clt_wx_user` */

insert  into `clt_wx_user`(`id`,`uid`,`wxname`,`aeskey`,`encode`,`appid`,`appsecret`,`wxid`,`weixin`,`token`,`w_token`,`create_time`,`updatetime`,`tplcontentid`,`share_ticket`,`share_dated`,`authorizer_access_token`,`authorizer_refresh_token`,`authorizer_expires`,`type`,`web_access_token`,`web_refresh_token`,`web_expires`,`menu_config`,`wait_access`,`concern`,`default`) values 
(1,0,'CLTPHP','',0,'wx08c8be078e00b88b','2e6f2d97d60582f21111be7862d14ddc','gh_8aacbef4e497','chichu12345','sdfdsfdsfdsf','cltphp',0,0,'','','','','','',1,'eY9W4LLdISpE3UtTfuodgz1HJdBYCMbzZWkiLEhF0Nzvzv2q2DtGIV5h7CPrc0Nd4_kJgKN_FdM3kNaCxfFC1wmu6JLnNoOrmMuy3FK2AhMDLCbAGAXFW','',1504242136,'0',0,'欢迎来到CLTPHP！CLTPHP采用ThinkPHP5作为基础框架，同时采用Layui作为后台界面，使得CLTPHP适用与大型企业网站、个人博客论坛、企业网站、手机网站的定制开发。更高效、更快捷的进行定制开发一直是CLTPHP追求的价值。','亲！您可以输入关键词来获取您想要知道的内容。（例：手册）');

/*Table structure for table `clt_wx_user_msg` */

DROP TABLE IF EXISTS `clt_wx_user_msg`;

CREATE TABLE `clt_wx_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text,
  `is_replay` int(11) NOT NULL DEFAULT '0' COMMENT '是否回复',
  `create_time` int(11) DEFAULT '0',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';

/*Data for the table `clt_wx_user_msg` */

/*Table structure for table `clt_wx_user_msg_replay` */

DROP TABLE IF EXISTS `clt_wx_user_msg_replay`;

CREATE TABLE `clt_wx_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text,
  `replay_time` int(11) DEFAULT '0',
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';

/*Data for the table `clt_wx_user_msg_replay` */

/*Table structure for table `posts_tags` */

DROP TABLE IF EXISTS `posts_tags`;

CREATE TABLE `posts_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_id` int(11) DEFAULT NULL,
  `posts_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `posts_tags` */

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '标签名称',
  `nums` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
