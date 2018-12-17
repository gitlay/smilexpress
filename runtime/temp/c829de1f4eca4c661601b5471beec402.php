<?php /*a:3:{s:78:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\index_index.html";i:1545043811;s:78:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\common_head.html";i:1545043811;s:80:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\common_footer.html";i:1545043811;}*/ ?>
<!DOCTYPE html>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="zh-cn"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="zh-cn"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="zh-cn"> <!--<![endif]-->
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width" />
    <title><?php echo isset($info['title']) ? htmlentities($info['title']) : ($title ? $title : $sys['title']); ?></title>
    <meta name="keywords" content="<?php echo isset($info['keywords']) ? htmlentities($info['keywords']) : ($keywords ? $keywords : $sys['key']); ?>" />
    <meta name="description" content="<?php echo isset($info['description']) ? htmlentities($info['description']) : ($description ? $description : $sys['des']); ?>" />
    <!-- ////////////////////////////////// -->
    <!-- //      Stylesheets Files       // -->
    <!-- ////////////////////////////////// -->
    <link rel="stylesheet" href="/static/home/css/base.css" id="camera-css" />
    <link rel="stylesheet" href="/static/home/css/framework.css" />
    <link rel="stylesheet" href="/static/home/css/style.css" />
    <link rel="stylesheet" href="/static/home/css/noscript.css" media="screen,all" id="noscript" />

    <!-- ////////////////////////////////// -->
    <!-- //        Favicon Files         // -->
    <!-- ////////////////////////////////// -->
    <link rel="shortcut icon" href="/static/home/images/favicon.ico" />

    <!-- ////////////////////////////////// -->
    <!-- //      Javascript Files        // -->
    <!-- ////////////////////////////////// -->
    <script>
        var HOME = '/static/home';
    </script>
    <script src="/static/home/js/jquery.min.js"></script>
    <script src="/static/home/js/jquery.easing-1.3.min.js"></script>
    <script src="/static/home/js/tooltip.js"></script>
    <script src="/static/home/js/dropdown.js"></script>
    <script src="/static/home/js/tinynav.min.js"></script>
    <script src="/static/home/js/camera.min.js"></script>
    <script src="/static/home/js/jquery.fancybox.js?v=2.0.6"></script>
    <script src="/static/home/js/jquery.fancybox-media.js?v=1.0.3"></script>
    <script src="/static/home/js/jquery.ui.totop.min.js"></script>
    <script src="/static/home/js/ddaccordion.js"></script>
    <script src="/static/home/js/jquery.twitter.js"></script>
    <script src="/static/home/js/jflickrfeed.min.js"></script>
    <script src="/static/home/js/faq-functions.js"></script>
    <script src="/static/home/js/isotope.js"></script>
    <script src="/static/home/js/theme-functions.js"></script>
    <script>
        //设为首页 www.jb51.net
        function SetHome(obj,url){
            try{
                obj.style.behavior='url(#default#homepage)';
                obj.setHomePage(url);
            }catch(e){
                if(window.netscape){
                    try{
                        netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                    }catch(e){
                        alert("抱歉，此操作被浏览器拒绝！\n\n请在浏览器地址栏输入“about:config”并回车然后将[signed.applets.codebase_principal_support]设置为'true'");
                    }
                }else{
                    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n您需要手动将【"+url+"】设置为首页。");
                }
            }
        }

        //收藏本站 www.jb51.net
        function AddFavorite(title, url) {
            try {
                window.external.addFavorite(url, title);
            }
            catch (e) {
                try {
                    window.sidebar.addPanel(title, url, "");
                }
                catch (e) {
                    alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请进入新网站后使用Ctrl+D进行添加");
                }
            }
        }
    </script>
    <!-- IE Fix for HTML5 Tags -->
    <!--[if lt IE 9]><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

</head>
<body>
<div class="user">
    <div id="top-social">
        <div class="social-panel">
            <ul>
                <li><a href="javascript:void(0);" onclick="SetHome(this,'<?php echo config('url_domain_root'); ?>');">设为首页</a></li>
                <li><a href="javascript:void(0);" onclick="AddFavorite('<?php echo config('sys_name'); ?>','<?php echo config('url_domain_root'); ?>')">加入收藏</a></li>
                <li><a href="<?php echo url('user/index/index'); ?>" target="_blank"><?php if(session('user.username')): ?><?php echo session('user.username'); else: ?>会员中心<?php endif; ?></a></li>
            </ul>
        </div>
    </div>
    <div class="clear"></div>
</div>
<!-- header start here -->
<header>
    <div id="main-wrapper">
        <!-- logo start here -->
        <div id="logo">
            <a href="<?php echo url('home/index/index'); ?>" title="CLTPHP内容管理系统"><img src="<?php echo htmlentities($sys['logo']); ?>" alt="CLTPHP" style="width: 160px;max-height: 60px;" /></a>
        </div>
        <!-- logo end here -->
        <!-- mainmenu start here -->
        <nav id="mainmenu">
            <ul id="menu">
                <li <?php if($controller == 'index'): ?>class="selected"<?php endif; ?>><a href="<?php echo url('home/index/index'); ?>" title="CLTPHP内容管理系统">首页</a></li>
                <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li <?php if($controller == $vo['catdir']): ?>class="selected"<?php endif; ?>>
                <?php if($vo['child'] == 1): ?>
                <a href="#"><?php echo htmlentities($vo['catname']); ?></a>
                <ul>
                    <?php if(is_array($vo['sub']) || $vo['sub'] instanceof \think\Collection || $vo['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                    <li><a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$v['id']] ); ?>" title="<?php echo htmlentities($v['catname']); ?>-CLTPHP内容管理系统"><span>-</span> <?php echo htmlentities($v['catname']); ?></a></li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <?php else: ?>
                <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>" title="<?php echo htmlentities($vo['catname']); ?>-CLTPHP内容管理系统"><?php echo htmlentities($vo['catname']); ?></a>
                <?php endif; ?>
                </li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </ul>
        </nav>
        <!-- mainmenu end here -->

    </div>
</header>
<!-- header end here -->
<?php echo $style; ?>
<script>
    $(document).ready(function() {
        //Camera Jquery
        $('#camera-slide').camera({
            thumbnails: false,
            hover: false,
            pagination: false
        });
    });

</script>

<!-- slideshow start here -->
<section id="slideshow-wrapper">
    <div class="camera_wrap" id="camera-slide">
        <!-- slide 1 here -->
        <?php if(is_array($adList) || $adList instanceof \think\Collection || $adList instanceof \think\Paginator): $i = 0; $__LIST__ = $adList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if($i == 1): ?>
        <div data-src="/static/home/images/slideshow/bg-slide1.jpg">
            <div class="caption-type1 moveFromLeft">
                <h1><?php echo htmlentities($vo['name']); ?></h1>
                <p><?php echo htmlentities($vo['content']); ?></p>
                <a href="http://demo.cltphp.com/" target="_blank" title="CLTPHP演示站点" class="button-slide medium gray">演示站点</a>
            </div>
            <div class="caption-type1 moveFromRight">
                <img src="<?php echo htmlentities($vo['pic']); ?>" alt="<?php echo htmlentities($vo['name']); ?>" />
            </div>
        </div>
        <?php elseif($i == 2): ?>
        <!-- slide 2 here -->
        <div data-src="/static/home/images/slideshow/bg-slide2.jpg">
            <div class="caption-type2 moveFromTop">
                <h1><?php echo htmlentities($vo['name']); ?></h1>
                <p><?php echo htmlentities($vo['content']); ?></p>
            </div>
            <div class="caption-type2 moveFromBottom">
                <img src="<?php echo htmlentities($vo['pic']); ?>" alt="<?php echo htmlentities($vo['name']); ?>" />
            </div>
        </div>
        <?php else: ?>
        <!-- slide 3 here -->
        <div data-src="/static/home/images/slideshow/bg-slide3.jpg">
            <div class="caption-type3 moveFromLeft">
                <img src="<?php echo htmlentities($vo['pic']); ?>" alt="<?php echo htmlentities($vo['name']); ?>" />
            </div>
            <div class="caption-type3 moveFromRight">
                <h1><?php echo htmlentities($vo['name']); ?></h1>
                <p><?php echo htmlentities($vo['content']); ?></p>
            </div>
        </div>
        <?php endif; ?>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div id="slideshow-noscript"><h4>你准备好与CLTPHP共同搭建您的网络平台了吗？</h4></div>
</section>
<!-- slideshow end here --> 
<div class="copyrights">Collect from <a href="http://www.cltphp.com/"  title="CLTPHP内容管理系统">CLTPHP内容管理系统</a></div>
<!-- featured client start here -->
<section id="featured-wrapper">
    <div id="featured-logo-list">
        <div class="row">
            <div class="two columns mobile-two mobile-view">
                <h6 class="featured-client">第三方资源 :</h6>
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/static/home/images/sample-images/client1.png" alt="layui" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/static/home/images/sample-images/client2.png" alt="thinkphp" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/static/home/images/sample-images/client3.png" alt="angularjs" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/static/home/images/sample-images/client4.png" alt="jquery" />
            </div>
            <div class="two columns mobile-two mobile-view">
                <img src="/static/home/images/sample-images/client5.png" alt="ztree" />
            </div>
        </div>
    </div>
</section>
<!-- featured client end here -->

<!-- maincontent start here -->
<section id="content-wrapper">
    <div class="row">
        <?php $result = db("article")->alias("a")->join("category c"," a.catid = c.id","left")
            ->where("posid = 1 and (status = 1 or (status = 0 and createtime <1545045108))")
            ->field("a.*,c.catdir,c.catname")
            ->limit(4)
            ->order(" a.sort asc,a.createtime desc,a.id desc")
            ->select();if($result){foreach ($result as $k=>$vo):$result[$k]["time"]= toDate($vo["createtime"],"Y-m-d");$result[$k]["thumb"]= $vo["thumb"]?$vo["thumb"]:"";?><?php endforeach; foreach ($result as $k=>$vo):?>
        <div class="three columns mobile-two">
            <h5><a style="<?php echo htmlentities($vo['title_style']); ?>" href="<?php echo url('home/'.$vo['catdir'].'/info',array('id'=>$vo['id'],'catId'=>$vo['catid'])); ?>" title="<?php echo htmlentities($vo['title']); ?>"><?php echo str_cut($vo['title'],12,'...'); ?></a></h5>
            <div class="link-url">
                <a href="<?php echo url('home/'.$vo['catdir'].'/info',array('id'=>$vo['id'],'catId'=>$vo['catid'])); ?>" target="_blank" title="<?php echo htmlentities($vo['title']); ?>">
                    <img src="<?php echo imgUrl($vo['thumb'],'/static/home/images/portfolio-thumb/p'.$k.'.jpg'); ?>" alt="<?php echo htmlentities($vo['title']); ?>" class="fade" />
                </a>
            </div>
        </div>
        <?php endforeach; }else{echo "<div class='fly-none'>没有相关数据</div>";}?>
    </div>
    <div id="featured-wrapper2">
        <div class="row front-feature-icon">
            <?php $result = db("debris")->where("type_id = 1")->limit(3)->order("")->select();foreach ($result as $k=>$list):$result[$k]["time"]= isset($list["createtime"])?toDate($list["createtime"]):""?>
            <div class="four columns mobile-one">
                <img src="/static/home/images/sample-images/front-icon<?php echo htmlentities($k+1); ?>.png" alt="<?php echo htmlentities($list['title']); ?>" class="img-center" />
                <h5><?php echo htmlentities($list['title']); ?></h5>
                <p><?php echo $list['content']; ?></p>
            </div>
            <?php endforeach?>
        </div>
    </div>
    <div class="row">
        <div class="twelve columns">
            <div class="featured-box">
                <div class="nine columns">
                    <h5>你准备好与CLTPHP共同打造您的网络平台了吗？</h5>
                    <p>CLTPHP建站系统免费下载，只有您的支持，才能使得我们在开源的世界里走的更好！</p>
                </div>
                <div class="three columns">
                    <a href="http://qiniu.cltphp.com/cltphp5.2.2.zip" class="button medium gray arrow-icon" rel="nofollow" title="<?php echo htmlentities($sys['title']); ?>">点击下载</a>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</section>
<script>
    <?php echo $js; ?>
</script>
<!-- footer start here -->
<footer>
    <div class="row">
        <div class="three columns mobile-two">
            <img src="/static/home/images/logo2.png" alt="CLTPHP" class="img-left" />
            <p class="copyright-text">
                &copy;<?php echo htmlentities($sys['copyright']); ?> <a href="http://www.cltphp.com/" style="color: #747373" rel="external" title="<?php echo htmlentities($sys['title']); ?>"><?php echo htmlentities($sys['title']); ?></a><br>
                <a href="http://www.miitbeian.gov.cn/" style="color: #747373" target="_blank" rel="nofollow"><?php echo htmlentities($sys['bah']); ?></a><br>
            </p>
        </div>
        <div class="three columns mobile-two">
            <h5>联系我们</h5>
            <ul>
                <li class="address-icon"><a href="<?php echo htmlentities($sys['url']); ?>" title="<?php echo htmlentities($sys['title']); ?>"><?php echo htmlentities($sys['title']); ?></a></li>
                <li class="qq-icon"><a target="_blank" href="//shang.qq.com/wpa/qunwpa?idkey=ebcb5f6099570a3a1429036f42f787b9eea835fdbf6ded8eaee2a546855cce97"><img border="0" src="//pub.idqqimg.com/wpa/images/group.png" alt="CLTPHP交流群0002" title="CLTPHP交流群0002"></a></li>
                <li class="qq-icon">站长QQ号 : <a target="_blank" rel="nofollow" title="点击加好友" href="tencent://message/?uin=1109305987&Site=&Menu=yes">1109305987</a></li>
                <li class="email-icon">Email : <?php echo htmlentities($sys['email']); ?></li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>友情链接</h5>
            <ul>
                <?php if(is_array($linkList) || $linkList instanceof \think\Collection || $linkList instanceof \think\Paginator): $i = 0; $__LIST__ = $linkList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <li><a href="<?php echo htmlentities($vo['url']); ?>" rel="external" title="<?php echo htmlentities($vo['name']); ?>"><?php echo htmlentities($vo['name']); ?></a></li>
                <?php endforeach; endif; else: echo "" ;endif; ?>
                <li><a href="https://www.kancloud.cn/chichu/cltphp" target="_blank" rel="nofollow" title="CLTPHP操作开发手册">CLTPHP操作开发手册</a></li>
            </ul>
        </div>
        <div class="three columns mobile-two">
            <h5>扫码捐助</h5>
            <div class="wxsq">
                <img src="/static/home/images/wxsq.png" alt="CLTPHP微信二维码" title="CLTPHP微信二维码">
            </div>
        </div>
    </div>
</footer>
<!-- footer end here -->
<script>
    $('#noscript').remove();
    jQuery(function($){
        //external加上target="_blank"
        $("a[rel*=external]").attr("target","_blank");
    });
</script>
</body>
</html>