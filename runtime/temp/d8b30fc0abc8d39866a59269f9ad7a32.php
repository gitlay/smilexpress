<?php /*a:5:{s:63:"E:\phpStudy\WWW\express\application\home\view\page_service.html";i:1545148234;s:62:"E:\phpStudy\WWW\express\application\home\view\common_head.html";i:1545058854;s:66:"E:\phpStudy\WWW\express\application\home\view\common_position.html";i:1545146822;s:62:"E:\phpStudy\WWW\express\application\home\view\common_left.html";i:1545060774;s:64:"E:\phpStudy\WWW\express\application\home\view\common_footer.html";i:1545145623;}*/ ?>
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
                <img src="/static/express/images/logo.png" alt="">
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
                    <?php if(is_array($adList) || $adList instanceof \think\Collection || $adList instanceof \think\Paginator): $i = 0; $__LIST__ = $adList;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
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

<style type="text/css">
	.pageAskInfo-q h1 {
		color: #ff6200;
		font-size: 16px;
		margin-bottom: 10px;
	}

	.pageAskInfo-q p {
		font-size: 14px;
		margin-bottom: 20px;
	}

	.pageAskInfo-q img {
		width: 100%;
	}
</style>
		<div class="bodyWrap">
			<div class="mainbody cent">
				<div class="Breadcrumb">
    <span>当前位置：</span>
    <span><a href="/">首页</a></span>
    <span class="breadcrumb__separator">/</span>
    <span><a href="<?php echo url('home/'.MODULE_NAME.'/index',array('catId'=>$parent['id'])); ?>"><?php echo htmlentities($parentName); ?></a></span>
    <span class="breadcrumb__separator">/</span>
    <span><a href="#"><?php echo htmlentities($title); ?></a></span>
</div>
				<div class="ov">
					

<div class="leftNav fl">
    <div class="pageName"><?php echo htmlentities($parentName); ?></div>
    <ul>
        <?php if(is_array($child) || $child instanceof \think\Collection || $child instanceof \think\Paginator): $i = 0; $__LIST__ = $child;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?>
        <li <?php if(input('catId')==$vo['id']): ?> class="menu_on"<?php endif; ?>>
        <a href="<?php echo url('home/'.$vo['catdir'].'/index',['catId'=>$vo['id']] ); ?>">  <?php echo htmlentities($vo['catname']); ?></a>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <div class="pageQrcodes">
        <div class="qrcode-item"></div>
        <div class="qrcode-item"></div>
    </div>
</div>
					<div class="rightMain fr">
						<div class="pageTitle"><?php echo htmlentities($info['title']); ?></div>
						<div class="pageAskInfo">
							<div class="pageAskInfo-q">
							<?php echo $info['content']; ?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<div class="bottom">
    <div class="bottomMain cent">
        <div class="f_floor clear fl">
            <div class="bottomLogo">
                <img src="images/logoa.png"/>
            </div>
            <div style="font-size: 18px;color: #3e3a39;margin-bottom: 8px;padding-left: 14px;">客服热线</div>
            <div style="font-size: 26px;color: #ff6100;padding-left: 14px;">0579-81531200</div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_menu">
                <div class="bottom_menu_title">关于我们</div>
                <ul>
                    <li>
                        <a href="#">公司简介</a>
                    </li>
                    <li>
                        <a href="#">联系我们</a>
                    </li>
                    <li>
                        <a href="#">客服中心</a>
                    </li>
                    <li>
                        <a href="#">人才招聘</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_menu">
                <div class="bottom_menu_title">帮助支持</div>
                <ul>
                    <li>
                        <a href="#">新手指南</a>
                    </li>
                    <li>
                        <a href="#">常见问题</a>
                    </li>
                    <li>
                        <a href="#">下载中心</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="bottom_shopinfo">
                <ul>
                    <li>义乌市沃虎国际货运代理有限公司</li>
                    <li>客服QQ : 2471036706</li>
                    <li>E-mail : vohooex@yeah.net</li>
                    <li>公司网址：www.vohooex.com</li>
                    <li>投诉：18606883930</li>
                    <li>地址：浙江省义乌市下王4区20栋1楼</li>
                </ul>
            </div>
        </div>
        <div class="f_floor clear fl">
            <div class="qrocde">
                <img src="images/qrcode.png"/>
                <p>扫一扫&nbsp;关注我</p>
            </div>
        </div>
    </div>
    <div class="s_floor_wrap">
        <div class="s_floor clear">
            <div class="r txt_cent">© 2016 www.smilexpress.com.cn .All rights reserved Power by DedeCms
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