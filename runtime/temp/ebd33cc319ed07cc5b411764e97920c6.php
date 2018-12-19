<?php /*a:3:{s:80:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\module\field.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\head.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\foot.html";i:1545043811;}*/ ?>
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
        <legend>字段<?php echo lang('list'); ?></legend>
    </fieldset>
    <blockquote class="layui-elem-quote">
        <a href="<?php echo url('fieldAdd',array('moduleid'=>input('id'))); ?>" class="layui-btn layui-btn-sm"><?php echo lang('add'); ?><?php echo lang('field'); ?></a>
        <a href="<?php echo url('index'); ?>" class="layui-btn layui-btn-sm layui-btn-primary pull-right">模型列表</a>
    </blockquote>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script type="text/html" id="isSystem">
    {{# if(d.issystem==1){ }}
    <i class="icon icon-checkmark green"></i>
    {{# }else{  }}
    <i class="icon icon-cross red"></i>
    {{# } }}
</script>
<script type="text/html" id="required">
    {{# if(d.required==1){ }}
    <i class="icon icon-checkmark green"></i>
    {{# }else{  }}
    <i class="icon icon-cross red"></i>
    {{# } }}
</script>
<script type="text/html" id="action">
    {{# if(d.disable==1){ }}
        <a href="javascript:" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="stateyes">已禁用</a>
    {{# }else if(d.disable==2){  }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-disabled">已禁用</a>
    {{# }else{  }}
        <a href="javascript:" class="layui-btn layui-btn-xs layui-btn-warm" lay-event="stateyes">已启用</a>
    {{# } }}
    <a href="<?php echo url('fieldEdit'); ?>?moduleid={{d.moduleid}}&id={{d.id}}" class="layui-btn layui-btn-xs"><?php echo lang('edit'); ?></a>

    {{# if(d.delStatus==1){ }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-disabled">删除</a>
    {{# }else{  }}
        <a href="#" class="layui-btn layui-btn-xs layui-btn-danger" lay-event="del">删除</a>
    {{# } }}
</script>
<script type="text/html" id="order">
    <input name="{{d.id}}" data-id="{{d.id}}" class="list_order layui-input" value=" {{d.sort}}" size="10"/>
</script>
<script>
    layui.use('table', function() {
        var table = layui.table, $ = layui.jquery;
        var tableIn=table.render({
            elem: '#list',
            url: '<?php echo url("field"); ?>',
            where: { //设定异步数据接口的参数
                id: '<?php echo input("id"); ?>'
            },
            method: 'post',
            cols: [[
                {field: 'field', title: '字段名', width: 120,fixed: true},
                {field: 'name', title: '别名', width: 100},
                {field: 'type', title: '字段类型', width: 100},
                {field: 'issystem', align: 'center', title: '系统字段', width: 100, toolbar: '#isSystem'},
                {field: 'required', align: 'center', title: '必填', width: 80, toolbar: '#required'},
                {field: 'sort', title: '<?php echo lang("order"); ?>', width: 100, sort: true,templet: '#order'},
                {width: 190, align: 'center', toolbar: '#action'}
            ]]
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            if (obj.event === 'stateyes') {
                loading = layer.load(1, {shade: [0.1, '#fff']});
                $.post('<?php echo url("fieldStatus"); ?>', {id: data.id}, function () {
                    window.location.href = "<?php echo url('field'); ?>?id=<?php echo input('id'); ?>"
                });
            }else if(obj.event === 'del'){
                layer.confirm('你确定要删除该字段吗', function(index){
                    $.post("<?php echo url('fieldDel'); ?>",{id:data.id},function(res){
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            obj.del();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
        $('body').on('blur','.list_order',function() {
            var id = $(this).attr('data-id');
            var sort = $(this).val();
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post('<?php echo url("listOrder"); ?>',{id:id,sort:sort,moduleid:"<?php echo input('id'); ?>"},function(res){
                layer.close(loading);
                if(res.code===1){
                    layer.msg(res.msg,{time:1000,icon:1});
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                }
            })
        })
    });
</script>