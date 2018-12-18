<?php /*a:3:{s:81:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\system\system.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\head.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\foot.html";i:1545043811;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo config('sys_name'); ?>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="/static/plugins/layui/css/layui.css" media="all" />
    <link rel="stylesheet" href="/static/admin/css/global.css" media="all">
    <link rel="stylesheet" href="/static/common/css/font.css" media="all">
</head>
<body class="skin-<?php if(!empty($_COOKIE['skin'])){echo $_COOKIE['skin'];}else{echo '0';setcookie('skin','0');}?>">
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo lang('systemSet'); ?></legend>
    </fieldset>
    <div class="layui-tab">
        <ul class="layui-tab-title">
            <li class="layui-this">基础设置</li>
            <li>SEO管理</li>
            <li>其他</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form class="layui-form layui-form-pane" lay-filter="form-system">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('websiteName'); ?></label>
                        <div class="layui-input-4">
                            <input type="text"name="name" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('websiteName'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('WebsiteUrl'); ?></label>
                        <div class="layui-input-4">
                            <input type="text" name="url" lay-verify="url" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('WebsiteUrl'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">网站LOGO</label>
                        <input type="hidden" name="logo" id="logo">
                        <div class="layui-input-block">
                            <div class="layui-upload">
                                <button type="button" class="layui-btn layui-btn-primary" id="logoBtn"><i class="icon icon-upload3"></i>点击上传</button>
                                <div class="layui-upload-list">
                                    <img class="layui-upload-img" id="cltLogo">
                                    <p id="demoText"></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('recordNum'); ?></label>
                        <div class="layui-input-3">
                            <input type="text" name="bah" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('recordNum'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">Copyright</label>
                        <div class="layui-input-3">
                            <input type="text" name="copyright" placeholder="<?php echo lang('pleaseEnter'); ?>Copyright" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('companyAddress'); ?></label>
                        <div class="layui-input-3">
                            <input type="text" name="ads" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('companyAddress'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('tel'); ?></label>
                        <div class="layui-input-3">
                            <input type="text" name="tel" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('tel'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('email'); ?></label>
                        <div class="layui-input-3">
                            <input type="text" name="email" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('email'); ?>" class="layui-input">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="sys"><?php echo lang('submit'); ?></button>
                            <button type="reset" class="layui-btn layui-btn-primary"><?php echo lang('reset'); ?></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-tab-item">
                <form class="layui-form layui-form-pane" lay-filter="form-system">
                    <div class="layui-form-item">
                        <label class="layui-form-label"><?php echo lang('seoTitle'); ?></label>
                        <div class="layui-input-4">
                            <input type="text"name="title" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('WebsiteUrl'); ?>" class="layui-input">
                        </div>
                    </div>

                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label"><?php echo lang('seoKeyword'); ?></label>
                        <div class="layui-input-block">
                            <textarea name="key" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('seoKeyword'); ?>" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item layui-form-text">
                        <label class="layui-form-label"><?php echo lang('description'); ?></label>
                        <div class="layui-input-block">
                            <textarea name="des" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?><?php echo lang('description'); ?>" class="layui-textarea"></textarea>
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="sys"><?php echo lang('submit'); ?></button>
                            <button type="reset" class="layui-btn layui-btn-primary"><?php echo lang('reset'); ?></button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="layui-tab-item">
                <form class="layui-form layui-form-pane" lay-filter="form-system">
                    <div class="layui-form-item">
                        <label class="layui-form-label">手机端</label>
                        <div class="layui-input-block">
                            <input type="radio" name="mobile" value="open" title="开启">
                            <input type="radio" name="mobile" value="close" title="关闭">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">验证码</label>
                        <div class="layui-input-block">
                            <input type="radio" name="code" value="open" title="开启">
                            <input type="radio" name="code" value="close" title="关闭">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <button type="button" class="layui-btn" lay-submit="" lay-filter="sys"><?php echo lang('submit'); ?></button>
                            <button type="reset" class="layui-btn layui-btn-primary"><?php echo lang('reset'); ?></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script>
    layui.use(['form', 'layer','upload','element'], function () {
        var form = layui.form,layer = layui.layer,upload = layui.upload,$ = layui.jquery,element = layui.element;
        var seytem = <?php echo $system; ?>;
        form.val("form-system", seytem);
        $('#cltLogo').attr('src',seytem.logo);

        //普通图片上传
        var uploadInst = upload.render({
            elem: '#logoBtn'
            ,url: '<?php echo url("UpFiles/upload"); ?>'
            ,before: function(obj){
                //预读本地文件示例，不支持ie8
                obj.preview(function(index, file, result){
                    $('#cltLogo').attr('src', result); //图片链接（base64）
                });
            }
            ,done: function(res){
                //上传成功
                if(res.code>0){
                    $('#logo').val(res.url);
                }else{
                    //如果上传失败
                    return layer.msg('上传失败');
                }
            }
            ,error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });
        //提交监听
        form.on('submit(sys)', function (data) {
            loading =layer.load(1, {shade: [0.1,'#fff']});
            $.post("<?php echo url('system/system'); ?>",data.field,function(res){
                layer.close(loading);
                if(res.code > 0){
                    layer.msg(res.msg,{icon: 1, time: 1000},function(){
                        location.href = res.url;
                    });
                }else{
                    layer.msg(res.msg,{icon: 2, time: 1000});
                }
            });
        })
    })
</script>
</body>
</html>