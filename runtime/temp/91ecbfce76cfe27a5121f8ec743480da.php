<?php /*a:3:{s:64:"E:\phpStudy\WWW\express\application\admin\view\module\index.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\head.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\foot.html";i:1545055853;}*/ ?>
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
        <legend><?php echo lang('module'); ?><?php echo lang('list'); ?></legend>
    </fieldset>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script type="text/html" id="action">
    <a href="<?php echo url('field'); ?>?id={{d.id}}" class="layui-btn layui-btn-normal layui-btn-xs">模型字段</a>
    <!--<a href="<?php echo url('edit'); ?>?id={{d.id}}" class="layui-btn layui-btn-xs" lay-event="edit"><?php echo lang('edit'); ?></a>-->
    <a class="layui-btn layui-btn-xs" lay-event="edit"><?php echo lang('edit'); ?></a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del"><?php echo lang('del'); ?></a>
</script>
<script type="text/html" id="status">
    <input type="checkbox" name="status" value="{{d.id}}" lay-skin="switch" lay-text="开启|禁用" lay-filter="status" {{ d.status == 1 ? 'checked' : '' }}>
</script>
<script type="text/html" id="topBtn">
    <button class="layui-btn layui-btn-sm" lay-event="add"><?php echo lang('add'); ?><?php echo lang('module'); ?></button>
</script>
<script>
    layui.use(['table','form'], function() {
        var table = layui.table, form=layui.form,$ = layui.jquery;
        var tableIn = table.render({
            elem: '#list',
            url: '<?php echo url("index"); ?>',
            method: 'post',
            toolbar: '#topBtn',
            autoSort: false,
            page:true,
            cols: [[
                {field: 'id', title: '<?php echo lang("id"); ?>', width:90, fixed: true,sort:true},
                {field: 'title', title: '<?php echo lang("module"); ?><?php echo lang("name"); ?>', width: 120},
                {field: 'name', title: '<?php echo lang("table"); ?>', width: 100},
                {field: 'description', title: '<?php echo lang("detail"); ?>', width: 180},
                {field: 'status', align: 'center',title: '<?php echo lang("status"); ?>', width: 120,toolbar: '#status',sort:true},
                {width: 200, align: 'center', toolbar: '#action'}
            ]]
        });
        //监听排序事件
        table.on('sort(list)', function(obj){
            table.reload('list', {
                initSort: obj
                ,where: {sort_by: obj.field,sort_order: obj.type}
            });
        });
        //头工具栏事件
        table.on('toolbar(list)', function(obj){
            switch(obj.event){
                case 'add':
                    var index = layer.open({
                        type: 2,
                        content: '<?php echo url("add"); ?>',
                        area: ['300px', '300px'],
                        maxmin: true
                    });
                    layer.full(index);
                    break;
            }
        });
        form.on('switch(status)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var status = obj.elem.checked===true?1:0;
            $.post('<?php echo url("moduleState"); ?>',{'id':id,'status':status},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            var id = data.id;
            if(obj.event === 'del'){
                layer.confirm('你确定要删除该模型吗？', {icon: 3}, function (index) {
                    $.post("<?php echo url('del'); ?>",{id:data.id},function(res){
                        if(res.code==1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            tableIn.reload();
                        }else{
                            layer.msg(res.msg,{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }else if(obj.event === 'edit'){
                var index = layer.open({
                    type: 2,
                    content: '<?php echo url("edit"); ?>?id='+id,
                    area: ['300px', '300px'],
                    maxmin: true
                });
                layer.full(index);
            }
        });
    })
</script>