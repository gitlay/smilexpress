<?php /*a:3:{s:78:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\index_index.html";i:1545210344;s:78:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\common_head.html";i:1545211043;s:80:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\home\view\common_footer.html";i:1545212886;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><?php echo isset($info['title']) ? htmlentities($info['title']) : ($title ? $title : $sys['title']); ?></title>
    <meta name="keywords" content="<?php echo isset($info['keywords']) ? htmlentities($info['keywords']) : ($keywords ? $keywords : $sys['key']); ?>"/>
    <meta name="description" content="<?php echo isset($info['description']) ? htmlentities($info['description']) : ($description ? $description : $sys['des']); ?>"/>
    <link rel="stylesheet" type="text/css" href="/static/express/css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="/static/express/css/bannerlist.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/css/swiper.min.css">
    <script src="/static/express/js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/express/js/jQuery-jcMarquee.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/express/js/sl.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/express/js/bannerlist.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/express/js/track.js" type="text/javascript" charset="utf-8"></script>
    <script src="/static/express/js/koala.min.1.5.js" type="text/javascript" charset="utf-8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.2/js/swiper.min.js"></script>
</head>
<style type="text/css">
    .two-wrap {
        width: 100%;
        height: 270px;
        margin-bottom: 15px;
        box-sizing: border-box;
        display: flex;
        display: -webkit-flex;
        align-content: center;
        justify-content: center;
    }

    .ckwl {
        background-size: cover;
        padding-left: 100px;
        background-image: url(images/chukouwuliu2.png);
    }

    .zzyw {
        background-size: cover;
        padding-right: 100px;
        background-image: url(images/zengzhiyewu2.png);
    }

    .two-wrap-item {
        padding: 10px;
        flex: 1;
        -webkit-flex: 1;
        height: 240px;
        margin-top: 15px;
        background-color: #FFF;
        box-sizing: border-box;
        text-align: center;
        margin-right: 10px;
        color: #3e3a39;
        -webkit-box-shadow: 0 1px 5px 0 rgba(0, 0, 0, 0.05);
        box-shadow: 0 1px 5px 0 rgba(0, 0, 0, 0.05);
    }

    .two-wrap-item h1 {
        font-size: 18px;
        color: #3e3a39;
        margin-bottom: 5px;
    }

    .two-wrap-item p {
        font-size: 15px;
        color: #3e3a39;
        margin-bottom: 5px;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3;
        text-align: left;
        text-indent: 2em;
    }

    .two-wrap-item-img {
        height: 120px;
        width: 100%;
        background-color: #EEE;
    }

    .zzyw .two-wrap-item {
        margin-right: 0px;
        margin-left: 10px;
    }

    .mainNews {
        padding: 10px;
        background-color: #f7f7f7;
        margin-bottom: 10px;
        box-sizing: border-box;
        overflow: hidden;
    }

    .mainNewsLeft {
        width: 60%;
        padding-right: 30px;
        box-sizing: border-box;
    }

    .mainNewsRight {
        width: 40%;
    }

    .main-news-menu {
        display: flex;
        display: -webkit-flex;
    }

    .main-news-menu-item {
        padding: 4px 10px;
        margin-right: 10px;
    }

    .main-news-menu-item-on {
        color: #FFF;
        background-color: #ff6200;
    }

    .main-news-list {
        margin-top: 20px;
    }

    .main-news-list ul li a {
        display: flex;
        display: -webkit-flex;
        align-items: center;
        line-height: 28px;
        justify-content: space-between;
    }

    .main-news-list ul li a label {
        width: 360px;
        display: block;
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 1;
        font-size: 15px;
        color: #888;
    }

    .main-news-list ul li a p {
        font-size: 15px;
    }
</style>
<body>
<section>
    <div class="top">
        <!-- 顶部注册 s -->
        <div class="topBar ">
            <div class="mid clear cent ">
                <div class="fr">
                    <div class="regist fl lineh30 font12">
                        <a href="/hydl/" class="colorf0">登录</a>
                        <a href="/member/">注册</a>
                    </div>
                    <div class="lang fl ">
                    </div>
                    <div class="lang fl " style="margin-top: 2px;">
                        <form action="/search.asp" method="post">
                            <input type="text" name="key">&nbsp;&nbsp;<input type="submit" name="search" value="搜索">
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- 顶部注册 e -->
        <div class="topMain clear cent">
            <a href="/" class="logo fl">
                <img src="<?php echo htmlentities($sys['logo']); ?>" alt="">
            </a>
            <i class="fl"></i>
            <div class="navwrap font14 lineh30 fr">
                <!-- 导航开始 -->
                <!--include component.less #nav &底部主导航script-->
                <div class="nav  fr" id="nav">
                    <ul class="clear">
                        <?php if(is_array($category) || $category instanceof \think\Collection || $category instanceof \think\Paginator): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <li>
                            <a href="#"><?php echo htmlentities($vo['catname']); ?></a>
                            <ul class="sub_nav2">
                                <?php if(is_array($vo['sub']) || $vo['sub'] instanceof \think\Collection || $vo['sub'] instanceof \think\Paginator): $i = 0; $__LIST__ = $vo['sub'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                                <li>
                                    <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$v['id']] ); ?>">
                                        <img src="<?php echo htmlentities($v['image']); ?>" alt="" width="160" height="90">
                                    </a>
                                    <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$v['id']] ); ?>">
                                        <h3><?php echo htmlentities($v['catname']); ?></h3>
                                    </a>
                                </li>
                                <?php endforeach; endif; else: echo "" ;endif; ?>
                            </ul>
                        </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
                <!-- 导航结束 -->
            </div>
        </div>
    </div>
    <div class="ban position_r">
        <div class="bannerWrap">
            <div class="banner">
                <ul>
                    <?php if(is_array($bannerList) || $bannerList instanceof \think\Collection || $bannerList instanceof \think\Paginator): $i = 0; $__LIST__ = $bannerList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <a href="" target="_blank">
                        <li style="background: url(<?php echo htmlentities($vo['pic']); ?>)"></li>
                    </a>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
                <div class="left-btn"></div>
                <div class="right-btn"></div>
                <div class="img-btn-list">

                </div>
            </div>
            <!--banner e-->
        </div>
        <!-- 快递追踪 s-->
        <div class="track cent position_a">
            <div class="cent track_cent">
                <div class="trackWrap position_r side-hide " id="side">
                    <form action="http://114.215.175.26/cgi-bin/GInfo.dll?" method="get" target="_blank">
                        <b>快件追踪</b>
                        <div class="textarea_wrap">
                            <input name="MfcISAPICommand" type="hidden" value="EmmisTrack">
                            <input name="w" type="hidden" value="hyeasy">
                            <input name="ntype" type="hidden" value="11100">
                            <textarea id="textarea" name="cno" cols="30" rows="5"
                                      placeholder="| 最多输入8个运单号,用Enter或斜杠/分隔"></textarea>
                        </div>
                        <button class="button fr color_f" title="跟踪查询" type="submit" value="追踪">追踪</button>
                    </form>
                </div>
            </div>
        </div>
        <!-- 快递追踪 e-->
    </div>
</section>

<div class="bodyWrap">
    <!-- 主体区 s-->
    <div class="mainbody cent">
        <div class="tongzhi lineh40 ">
            <!-- listScroll-x|y #5 s-->
            <!-- include jcMarquee.js & component.less #5 &底部滚动通知script -->
            <div id="Marquee_x" class="ov">
                <ul style="width: 1000%;">
                    <li class="">
                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/2045.htm">俄罗斯国际空运专线快递</a>
                        </div>

                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/2001.htm">2018年国际快递价格调整通知</a>
                        </div>

                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/1991.htm">2018年DHL出口价格表</a>
                        </div>
                    </li>
                    <li class="clone">
                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/2045.htm">俄罗斯国际空运专线快递</a>
                        </div>
                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/2001.htm">2018年国际快递价格调整通知</a>
                        </div>
                        <div class="fl" style="margin-right: 20px;">
                            <a href="/xwzx/gdtz/1991.htm">2018年DHL出口价格表</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- listScroll-x|y #5 e-->
        </div>
        <div class="">
            <div class="two-wrap ckwl">
                <?php if(is_array($express) || $express instanceof \think\Collection || $express instanceof \think\Paginator): $i = 0; $__LIST__ = $express;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <div class="two-wrap-item">
                    <h1><?php echo htmlentities($vo['catname']); ?></h1>
                    <p><?php echo htmlentities($vo['description']); ?></p>
                    <div class="two-wrap-item-img"></div>
                </div>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <div class="two-wrap zzyw">
                <?php if(is_array($increment) || $increment instanceof \think\Collection || $increment instanceof \think\Paginator): $i = 0; $__LIST__ = $increment;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                <div class="two-wrap-item">
                    <h1><?php echo htmlentities($vo['catname']); ?></h1>
                    <p><?php echo htmlentities($vo['description']); ?></p>
                    <div class="two-wrap-item-img"></div>
                </div>
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div class="mainNews">
            <div class="mainNewsLeft fl">
                <div class="main-news-menu">
                    <?php if(is_array($news) || $news instanceof \think\Collection || $news instanceof \think\Paginator): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <div class="main-news-menu-item <?php if($i == '1'): ?>main-news-menu-item-on<?php endif; ?>"><?php echo htmlentities($vo['catname']); ?></div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            <?php if(is_array($news) || $news instanceof \think\Collection || $news instanceof \think\Paginator): $i = 0; $__LIST__ = $news;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$v): $mod = ($i % 2 );++$i;?>
                <div class="main-news-list" <?php if($i > '1'): ?>style="display:none"<?php endif; ?> >
                    <ul>
                        <?php if(is_array($v['content']) || $v['content'] instanceof \think\Collection || $v['content'] instanceof \think\Paginator): $k = 0; $__LIST__ = $v['content'];if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?>
                        <li>
                            <a href="<?php echo url('home/'.$vo['catdir'].'/info',array('id'=>$vo['id'],'catId'=>$vo['catid'])); ?>">
                                <label><?php echo htmlentities($vo['title']); ?></label>
                                <p><?php echo toDate($vo["createtime"],'Y-m-d'); ?></p>
                            </a>
                        </li>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
            <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
            <div class="mainNewsRight fr">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <?php if(is_array($adList) || $adList instanceof \think\Collection || $adList instanceof \think\Paginator): $i = 0; $__LIST__ = $adList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                        <div class="swiper-slide">
                            <img src="<?php echo htmlentities($vo['pic']); ?>"/>
                        </div>
                        <?php endforeach; endif; else: echo "" ;endif; ?>
                    </div>
                    <!-- Add Pagination -->
                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 主体区 e-->

    <div class="bottom">
    <div class="bottomMain cent">
        <div class="f_floor clear fl">
            <div class="bottomLogo">
                <img src="<?php echo htmlentities($sys['logob']); ?>"/>
            </div>
            <div style="font-size: 18px;color: #3e3a39;margin-bottom: 8px;padding-left: 14px;">客服热线</div>
            <div style="font-size: 26px;color: #ff6100;padding-left: 14px;"><?php echo htmlentities($sys['tel']); ?></div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_menu">
                <div class="bottom_menu_title">关于我们</div>
                <ul>
                    <?php if(is_array($about) || $about instanceof \think\Collection || $about instanceof \think\Paginator): $i = 0; $__LIST__ = $about;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <li>
                        <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>"><?php echo htmlentities($vo['catname']); ?></a>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_menu">
                <div class="bottom_menu_title">帮助支持</div>
                <ul>
                    <?php if(is_array($help) || $help instanceof \think\Collection || $help instanceof \think\Paginator): $i = 0; $__LIST__ = $help;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
                    <li>
                        <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>"><?php echo htmlentities($vo['catname']); ?></a>
                    </li>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_shopinfo">
                <ul>
                    <li><?php echo htmlentities($sys['title']); ?></li>
                    <li>客服QQ : <?php echo htmlentities($sys['qq']); ?></li>
                    <li>E-mail :<?php echo htmlentities($sys['email']); ?></li>
                    <li>公司网址：<?php echo htmlentities($sys['host']); ?></li>
                    <li>投诉：<?php echo htmlentities($sys['complain']); ?></li>
                    <li>地址：<?php echo htmlentities($sys['ads']); ?></li>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="qrocde">
                <img src="<?php echo htmlentities($sys['qrcode']); ?>"/>
                <p>扫一扫&nbsp;关注我</p>
            </div>
        </div>
    </div>
    <div class="s_floor_wrap">
        <div class="s_floor clear">
            <div class="r txt_cent">
                <?php echo htmlentities($sys['copyright']); ?>    <?php echo htmlentities($sys['bah']); ?>
            </div>
        </div>
    </div>
</div>

</body>
<script type="text/javascript">
    var swiper = new Swiper(".swiper-container", {
            pagination: {
                el:".swiper-pagination",
                dynamicBullets: true,
            },
    });
</script>
<script type="text/javascript">
    bannerListFn(
        $(".banner"),
        $(".img-btn-list"),
        $(".left-btn"),
        $(".right-btn"),
        6000,
        true
    );
</script>
<script type="text/javascript">
    $(function () {
        $("#nav>ul>li").hover(
            function () {
                $( this).css("width", "116px").children("ul").css("display", "block");
                $( this).children("a").css("z-index", "240");
            },
            function () {
                $( this).css("width", "118px").children("ul").css("display", "none");
                $( this).children("a").css("z-index", "9")
            }
        )
    })
</script>
<script type="text/javascript">
    $("#textarea").bind({
        focusin: function () {

            if ($(this).val() == "" || isClick) {
                var myHeight = $(".bannerWrap").height();
                $(this).addClass("focus");
                $("#side").removeClass("side-hide").height(myHeight);
                /*$("#yto_phone").addClass("black");*/
            }
        },
        focusout: function () {
            if ($(this).val() == "") {
                $(this).removeClass("focus");
                if (isClick) {
                    $("#side").addClass("side-hide").height(90);
                    /*$("#yto_phone").removeClass("black");*/
                }
            }
        }
    });
</script>
<script>
    $(function () {
        $("#ico_feeServ>ul>li").mouseover(
            function () {
                $(this).css("width", "306px").addClass("bg").children("div.ico").css("display", "none").removeClass("feeServe_hover");
                $(this).children("div.sub").css("display", "block");
                $(this).siblings().css("width", "101px").addClass("bg").children("div.ico").css("display", "block").addClass("feeServe_hover");
                $(this).siblings().children("div.sub").css("display", "none");

            }
        )
    })
</script>

</html>