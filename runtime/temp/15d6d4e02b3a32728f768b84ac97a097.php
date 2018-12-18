<?php /*a:3:{s:64:"E:\phpStudy\WWW\express\application\admin\view\content\edit.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\head.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\foot.html";i:1545055853;}*/ ?>
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
<link rel="stylesheet" href="/static/plugins/spectrum/spectrum.css">
<style>
    .edui-editor{z-index: 1!important;}
</style>
<script>
    var ADMIN = '/static/admin';
    var UPURL = "<?php echo url('UpFiles/upImages'); ?>";
    var PUBLIC = "__PUBLIC__";
    var imgClassName,fileClassName;
</script>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script src="/static/common/js/jquery.2.1.1.min.js"></script>
<script>
    var edittext=new Array();
</script>
<script type="text/javascript" src="/static/kindeditor/NKeditor-all-min.js"></script>
<script type="text/javascript" src="/static/kindeditor/libs/JDialog/JDialog.min.js"></script>
<link rel="stylesheet" href="/static/wangEditor/css/wangEditor.min.css">
<script type="text/javascript" src="/static/wangEditor/js/wangEditor.min.js"></script>

<script src="/static/ueditor/ueditor.config.js" type="text/javascript"></script>
<script src="/static/ueditor/ueditor.all.min.js" type="text/javascript"></script>
<div class="admin-main layui-anim layui-anim-upbit">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo htmlentities($title); ?></legend>
    </fieldset>
    <form class="layui-form" method="post">
        <?php if((isset($info['id']))): ?>
        <input TYPE="hidden" name="id" value="<?php echo htmlentities($info['id']); ?>">
        <?php endif; if(is_array($fields) || $fields instanceof \think\Collection || $fields instanceof \think\Paginator): $i = 0; $__LIST__ = $fields;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$r): $mod = ($i % 2 );++$i;if(!empty($r['status'])): ?>
                <div class="layui-form-item">
                    <label class="layui-form-label"><?php echo htmlentities($r['name']); ?></label>
                    <div class="layui-input-4" id="box_<?php echo htmlentities($r['field']); ?>">
                        <?php echo getform($form,$r,input($r['field'])); ?>
                    </div>
                </div>
            <?php endif; ?>
        <?php endforeach; endif; else: echo "" ;endif; ?>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
                <?php if(MODULE_NAME == 'page'): ?>
                <a href="<?php echo url('category/index'); ?>" class="layui-btn layui-btn-primary"><?php echo lang('back'); ?></a>
                <?php else: ?>
                <a href="<?php echo url('index',['catid'=>input('catid')]); ?>" class="layui-btn layui-btn-primary"><?php echo lang('back'); ?></a>
                <?php endif; ?>
            </div>
        </div>
    </form>
</div>
<script src='/static/plugins/spectrum/spectrum.js'></script>
<script src='/static/admin/js/edit.js'></script>
<script src='/static/common/js/layui-mz-min.js'></script>
<script>
    var thumb,pic,file;
    <?php if(ACTION_NAME=='add'): ?>
    var url= "<?php echo url('insert'); ?>";
    <?php else: ?>
        var url= "<?php echo url('update'); ?>";
    <?php endif; ?>

    layui.use(['form','upload','layedit','laydate','jquery'], function () {
		
        var form = layui.form,upload = layui.upload,layedit = layui.layedit,laydate = layui.laydate,$ = layui.jquery;

        form.on('select(province)', function(data) {
            var pid = data.value;
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.get("<?php echo url('getRegion'); ?>?pid=" + pid, function (data) {
                layer.close(loading);
                var html='<option value="">请选择市</option>';
                $.each(data, function (i, value) {
                    html += '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#city').html(html);
                $('#district').html('<option value="">请选择县/区</option>');
                form.render()
            });
        });
        form.on('select(city)', function(data) {
            var pid = data.value;
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.get("<?php echo url('getRegion'); ?>?pid=" + pid, function (data) {
                layer.close(loading);
                var html='<option value="">请选择县/区</option>';
                $.each(data, function (i, value) {
                    html += '<option value="'+value.id+'">'+value.name+'</option>';
                });
                $('#district').html(html);

                form.render()
            });
        });
		layui.selMeltiple($);
        //缩略图上传
        upload.render({
            elem: '#thumbBtn'
            ,url: '<?php echo url("UpFiles/upload"); ?>'
            ,accept: 'images' //普通文件
            ,exts: 'jpg|png|gif' //只允许上传压缩文件
            ,done: function(res){
                console.log(res);
                $('#cltThumb').attr('src',res.url);
                $('#thumb').val(res.url);
            }
        });
        //日期

        form.on('submit(submit)', function (data) {

            $.post(url, data.field, function (res) {
                if (res.code > 0) {
                    layer.msg(res.msg, {time: 1800, icon: 1}, function () {
                        location.href = res.url;
                    });
                } else {
                    layer.msg(res.msg, {time: 1800, icon: 2});
                }
            });
        });
        $('.layui-row').on('click','.delimg',function(){
            var thisimg = $(this);

            layer.confirm('你确定要删除该图片吗？', function(index){
                thisimg.parents('.layui-col-md3').remove();
                layer.close(index);
            })
        })
    });

</script>