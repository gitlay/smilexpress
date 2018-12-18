<?php /*a:3:{s:64:"E:\phpStudy\WWW\express\application\admin\view\category\add.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\head.html";i:1545055853;s:63:"E:\phpStudy\WWW\express\application\admin\view\common\foot.html";i:1545055853;}*/ ?>
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
<div class="admin-main fadeInUp animated">
    <fieldset class="layui-elem-field layui-field-title">
        <legend><?php echo htmlentities($title); ?></legend>
    </fieldset>
    <form class="layui-form layui-form-pane">
        <div class="layui-form-item">
            <label class="layui-form-label">请选择模型</label>
            <div class="layui-input-3">
                <select name="moduleid" lay-verify="required" lay-filter="moduleid" id="moduleid">
                    <?php if(is_array($modulelist) || $modulelist instanceof \think\Collection || $modulelist instanceof \think\Paginator): $i = 0; $__LIST__ = $modulelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;if((isset($module['moduleid']))): ?>
                    <option value="<?php echo htmlentities($vo['id']); ?>" <?php if($module['moduleid'] == $vo['id']): ?>selected<?php endif; ?>><?php echo htmlentities($vo['title']); ?></option>
                    <?php else: ?>
                    <option value="<?php echo htmlentities($vo['id']); ?>" ><?php echo htmlentities($vo['title']); ?></option>
                    <?php endif; ?>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">上级栏目</label>
            <div class="layui-input-3">
                <select name="parentid" id="parentid">
                    <option value="">作为一级栏目</option>
                    <?php echo $categorys; ?>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">栏目名称</label>
            <div class="layui-input-4">
                <input type="text" name="catname" lay-verify="required" placeholder="<?php echo lang('pleaseEnter'); ?>栏目名称" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux red">*</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">栏目目录</label>
            <div class="layui-input-4">
                <input type="text" name="catdir" placeholder="<?php echo lang('pleaseEnter'); ?>栏目目录" lay-verify="required" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux red">*</div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">栏目图片</label>
            <input type="hidden" name="image" id="image">
            <div class="layui-input-block">
                <div class="layui-upload">
                    <button type="button" class="layui-btn layui-btn-primary" id="cateBtn"><i class="icon icon-upload3"></i>点击上传</button>
                    <div class="layui-upload-list">
                        <img class="layui-upload-img" id="cateImage">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">SEO标题</label>
            <div class="layui-input-block">
                <input type="text" name="title" placeholder="<?php echo lang('pleaseEnter'); ?>SEO标题" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">SEO关键字</label>
            <div class="layui-input-block">
                <textarea placeholder="<?php echo lang('pleaseEnter'); ?>SEO关键字" name="keywords" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">SEO描述</label>
            <div class="layui-input-block">
                <textarea placeholder="<?php echo lang('pleaseEnter'); ?>SEO描述" name="description" class="layui-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">多栏目设置</label>
            <div class="layui-input-1">
                <input type="checkbox" name="child" value="1" lay-skin="switch" title="多栏目设置">
            </div>
            <div class="layui-form-mid layui-word-aux">打开后，其下将不能添加内容。</div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">导航</label>
            <div class="layui-input-block">
                <input type="radio" name="ismenu" lay-filter="is_open" checked value="1" title="<?php echo lang('yes'); ?>">
                <input type="radio" name="ismenu" lay-filter="is_open" value="0" title="<?php echo lang('no'); ?>">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">预览</label>
            <div class="layui-input-block">
                <input type="radio" name="is_show" lay-filter="is_show" checked value="1" title="开启">
                <input type="radio" name="is_show" lay-filter="is_show" value="0" checked title="关闭">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">访问权限</label>
            <div class="layui-input-block">
                <?php if(is_array($rlist) || $rlist instanceof \think\Collection || $rlist instanceof \think\Paginator): $i = 0; $__LIST__ = $rlist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$item): $mod = ($i % 2 );++$i;?>
                <input type="checkbox" name="readgroup[<?php echo htmlentities($i); ?>]" value="<?php echo htmlentities($item['group_id']); ?>" title="<?php echo htmlentities($item['title']); ?>">
                <?php endforeach; endif; else: echo "" ;endif; ?>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">分页条数</label>
                <div class="layui-input-inline">
                    <input type="number" name="pagesize" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">为空时默认值为系统设置的值</div>
            </div>
        </div>

        <div class="layui-form-item tlist">
            <label class="layui-form-label">列表页模板</label>
            <div class="layui-input-3">
                <select name="template_list" id="template_list">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">内容页模板</label>
            <div class="layui-input-3">
                <select name="template_show" id="template_show">
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="button" class="layui-btn" lay-submit="" lay-filter="submit"><?php echo lang('submit'); ?></button>
                <a href="<?php echo url('index'); ?>" class="layui-btn layui-btn-primary"><?php echo lang('back'); ?></a>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="/static/plugins/layui/layui.js"></script>


<script src="/static/common/js/jquery.2.1.1.min.js"></script>
<script>
    var modulearr = new Array();
    <?php if(is_array($modulelist) || $modulelist instanceof \think\Collection || $modulelist instanceof \think\Paginator): $i = 0; $__LIST__ = $modulelist;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$mdate): $mod = ($i % 2 );++$i;?>
    modulearr[<?php echo htmlentities($mdate['id']); ?>] = "<?php echo htmlentities($mdate['name']); ?>";
    <?php endforeach; endif; else: echo "" ;endif; ?>
    var templatearr = new Array();
    <?php if(is_array($templates) || $templates instanceof \think\Collection || $templates instanceof \think\Paginator): $i = 0; $__LIST__ = $templates;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$tem): $mod = ($i % 2 );++$i;?>
    templatearr[<?php echo htmlentities($i); ?>] = "<?php echo htmlentities($tem['value']); ?>,<?php echo htmlentities($tem['filename']); ?>";
    <?php endforeach; endif; else: echo "" ;endif; ?>


    var datas = "<option value=''>请选择</option>";
    var moduleid =  $('#moduleid').val();
    var image = '';

    layui.use(['form','upload'], function () {
        var form = layui.form,upload = layui.upload;
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#cateBtn',
            url: '<?php echo url("UpFiles/upload"); ?>',
            done: function(res){
                if(res.code>0){
                    $('#image').val(res.url);
                    $('#cateImage').attr('src', res.url);
                }else{
                    //如果上传失败
                    return layer.msg('上传失败');
                }
            },
            error: function(){
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function(){
                    uploadInst.upload();
                });
            }
        });

        form.on('submit(submit)', function (data) {
            var loading = layer.load(1, {shade: [0.1, '#fff']});
            $.post("<?php echo url('insert'); ?>", data.field, function (res) {
                layer.close(loading);
                if (res.code > 0) {
                    layer.msg(res.msg, {time: 1800, icon: 1}, function () {
                        location.href = res.url;
                    });
                } else {
                    layer.msg(res.msg, {time: 1800, icon: 2});
                }
            });
        });
        form.on('select(moduleid)', function(data){
            showtemplist(data.value,0,form);
        });
    });
    function showtemplist(m,t,form){
        var type='_list';
        if(t){
            type='_index';
        }
        var mtlist = modulearr[m]+type;
        var mtshow = modulearr[m]+'_show';

        if(modulearr[m]=='page'){
            $('.tlist').hide();
            mtlist=mtshow ='page';
        }else{
            $('.tlist').show();
        }

        if(modulearr[m]=='page'){
            mtlist=mtshow ='page';
        }
        $('#template_list').html(datas);
        $('#template_show').html(datas);

        listdatas = showdatas ='';
        for(i=1;i<templatearr.length;i++){
            data = templatearr[i].split(',');
            if(data[0].indexOf(mtlist)  >= 0){
                listdatas  ="<option value='"+data[0]+"'>"+data[1]+"</option>";
                $('#template_list').append(listdatas);
            }
            if(data[0].indexOf(mtshow)  >= 0){
                showdatas ="<option value='"+data[0]+"'>"+data[1]+"</option>";
                $('#template_show').append(showdatas);
            }
        }
        if(form){
            form.render()
        }
    }
        showtemplist(moduleid,<?php if(empty($record['listtype'])): ?>0<?php else: ?><?php echo htmlentities($record['listtype']); ?><?php endif; ?>);
</script>