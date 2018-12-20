<?php /*a:3:{s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\users\index.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\head.html";i:1545043811;s:79:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\common\foot.html";i:1545043811;}*/ ?>
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
        <legend><?php echo lang('user'); ?><?php echo lang('list'); ?></legend>
    </fieldset>
    <div class="demoTable">
        <div class="layui-inline">
            <input class="layui-input" name="key" id="key" placeholder="<?php echo lang('pleaseEnter'); ?>关键字">
        </div>
        <button class="layui-btn" id="search" data-type="reload">搜索</button>
        <a href="<?php echo url('index'); ?>" class="layui-btn">显示全部</a>

    </div>
    <table class="layui-table" id="list" lay-filter="list"></table>
</div>
<script type="text/html" id="is_lock">
    <input type="checkbox" name="is_lock" value="{{d.id}}" lay-skin="switch" lay-text="正常|禁用" lay-filter="is_lock" {{ d.is_lock == 0 ? 'checked' : '' }}>
</script>
<script type="text/html" id="action">
    <a href="<?php echo url('edit'); ?>?id={{d.id}}" class="layui-btn layui-btn-xs">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="email">
    {{d.email}}
    {{# if(d.email && d.email_validated=='0'){ }}
    (未验证)
    {{# } }}
</script>
<script type="text/html" id="topBtn">
    <button type="button" class="layui-btn layui-btn-danger layui-btn-sm" id="delAll">批量删除</button>
</script>
<script type="text/html" id="sex">
    {{# if(d.sex=='0'){ }}
    女
    {{# }else{ }}
    男
    {{# } }}
</script>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script>
    layui.use(['table','form'], function() {
        var table = layui.table,form = layui.form, $ = layui.jquery;
        var tableIn = table.render({
            id: 'user',
            elem: '#list',
            url: '<?php echo url("index"); ?>',
            method: 'post',
            toolbar: '#topBtn',
            page: true,
            cols: [[
                {checkbox:true,fixed: true},
                {field: 'id', title: '<?php echo lang("id"); ?>', width: 80, fixed: true},
                {field: 'username', title: '<?php echo lang("nickname"); ?>', width: 120},
                {field: 'level_name', title: '会员等级', width: 100},
                {field: 'email', title: '<?php echo lang("email"); ?>', width: 250,templet:'#email'},
                {field: 'mobile', title: '<?php echo lang("tel"); ?>', width: 150,hide:true},
                {field: 'sex', title: '性别', width: 80,templet:'#sex',hide:true},
                {field: 'is_lock', align: 'center',title: '<?php echo lang("status"); ?>', width: 120,toolbar: '#is_lock'},
                {field: 'reg_time', title: '注册时间', width: 150},
                {width: 160, align: 'center', toolbar: '#action'}
            ]],
            limit: 10 //每页默认显示的数量
        });
        form.on('switch(is_lock)', function(obj){
            loading =layer.load(1, {shade: [0.1,'#fff']});
            var id = this.value;
            var is_lock = obj.elem.checked===true?0:1;
            $.post('<?php echo url("usersState"); ?>',{'id':id,'is_lock':is_lock},function (res) {
                layer.close(loading);
                if (res.status==1) {
                    tableIn.reload();
                }else{
                    layer.msg(res.msg,{time:1000,icon:2});
                    return false;
                }
            })
        });
        //搜索
        $('#search').on('click', function() {
            var key = $('#key').val();
            if($.trim(key)==='') {
                layer.msg('<?php echo lang("pleaseEnter"); ?>关键字！',{icon:0});
                return;
            }
            tableIn.reload({ page: {page: 1},where: {key: key}});
        });
        table.on('tool(list)', function(obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('您确定要删除该会员吗？', function(index){
                    var loading = layer.load(1, {shade: [0.1, '#fff']});
                    $.post("<?php echo url('usersDel'); ?>",{id:data.id},function(res){
                        layer.close(loading);
                        if(res.code===1){
                            layer.msg(res.msg,{time:1000,icon:1});
                            tableIn.reload();
                        }else{
                            layer.msg('操作失败！',{time:1000,icon:2});
                        }
                    });
                    layer.close(index);
                });
            }
        });
        $('body').on('click','#delAll',function() {
            layer.confirm('确认要删除选中信息吗？', {icon: 3}, function(index) {
                layer.close(index);
                var checkStatus = table.checkStatus('user'); //test即为参数id设定的值
                var ids = [];
                $(checkStatus.data).each(function (i, o) {
                    ids.push(o.id);
                });
                var loading = layer.load(1, {shade: [0.1, '#fff']});
                $.post("<?php echo url('delall'); ?>", {ids: ids}, function (data) {
                    layer.close(loading);
                    if (data.code === 1) {
                        layer.msg(data.msg, {time: 1000, icon: 1});
                        tableIn.reload();
                    } else {
                        layer.msg(data.msg, {time: 1000, icon: 2});
                    }
                });
            });
        })
    });
</script>
</body>
</html>