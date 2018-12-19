<?php /*a:1:{s:84:"D:\phpStudy\PHPTutorial\WWW\smilexpress\application\admin\view\module\fieldType.html";i:1545043811;}*/ ?>
<?php switch($type): case "title": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">标题图片</td>
		<td>
			<input type="radio" name="setup[thumb]" value="1" <?php if($thumb==1): ?> checked<?php endif; ?> title="是">
			<input type="radio" name="setup[thumb]" value="0"<?php if($thumb==0): ?> checked<?php endif; ?> title="否">
		</td>
	</tr>
	<tr>
		<td>标题样式</td>
		<td>
			<input type="radio" name="setup[style]" value="1" <?php if($style==1): ?> checked<?php endif; ?> title="是">
			<input type="radio" name="setup[style]" value="0" <?php if($style==0): ?> checked<?php endif; ?> title="否">
		</td>
	</tr>
</table>
<?php break; case "text": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td>默认值</td>
		<td> <input type="text" class="input-text layui-input" size="50"  name="setup[default]" value="<?php echo htmlentities($default); ?>" /></td>
	</tr>
	<tr>
		<td>是否为密码框</td>
		<td>
			<input type="radio" name="setup[ispassword]" value="1" title="是" <?php if($ispassword==1): ?> checked<?php endif; ?>>
			<input type="radio" name="setup[ispassword]" value="0" title="否" <?php if($ispassword==0): ?> checked<?php endif; ?>>
		</td>
	</tr>
	<input type="hidden" id="varchar" name="setup[fieldtype]" value="varchar"/>
</table>
<?php break; case "textarea": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]">
				<option value="mediumtext" <?php if($fieldtype=='mediumtext') echo 'selected';?>>MEDIUMTEXT</option>
				<option value="text" <?php if($fieldtype=='text') echo 'selected';?>>TEXT</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<textarea class="layui-textarea"   name="setup[default]" rows="3" cols="40"><?php echo htmlentities($default); ?></textarea>
		</td>
	</tr>
</table>
<?php break; case "select": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">选项列表:<br>例: <font color="red">选项名称|值</font></td>
		<td>
			<textarea class="layui-textarea"   name="setup[options]" rows="5" cols="40"><?php echo htmlentities($options); ?></textarea>
		</td>
	</tr>
	<tr>
		<td>选项类型</td>
		<td>
			<input type="radio" name="setup[multiple]" value="0" title="下拉框" <?php if($multiple==0): ?> checked<?php endif; ?>>
			<input type="radio" name="setup[multiple]" value="1" title="多选列表框" <?php if($multiple==1): ?> checked<?php endif; ?>>
		</td>
	</tr>
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]" onchange="javascript:numbertype(this.value);">
				<option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				<option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				<option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
				<option value="mediumint" <?php if($fieldtype=='mediumint') echo 'selected';?>>整数 MEDIUMINT(8)</option>
				<option value="int" <?php if($fieldtype=='int') echo 'selected';?>>整数 INT(10)</option>
			</select>
			<span style="display:none;"  >
				<input type="checkbox" name = "setup[numbertype]" value="1" checked  title="不包括负数"/>
			</span>
		</td>
	</tr>
	<tr>
		<td>可见选项的数目</td>
		<td>
			<input type="text" class="input-text layui-input" size="5" name="setup[size]" value="<?php echo htmlentities($size); ?>" />
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<input type="text" class="input-text layui-input" size="5"  name="setup[default]" value="<?php echo htmlentities($default); ?>" />
		</td>
	</tr>
</table>

<?php break; case "editor": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="140">编辑器类型：</td>
		<td><select name="setup[edittype]">
			<option value="wangEditor" <?php if($edittype=='wangEditor'): ?> selected<?php endif; ?>>wangEditor</option>
			<option value="nkeditor" <?php if($edittype=='nkeditor'): ?> selected<?php endif; ?>>nkeditor</option>
			<option value="UEditor" <?php if($edittype=='UEditor'): ?> selected<?php endif; ?>>UEditor</option>
		</select></td>
	</tr>
</table>
<?php break; case "datetime": break; case "groupid": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">选项类型</td>
		<td>
			<input type="radio" name="setup[inputtype]" value="checkbox" <?php if($inputtype=='checkbox'): ?> checked<?php endif; ?> title="复选框">
			<input type="radio" name="setup[inputtype]" value="select" <?php if($inputtype=='select'): ?> checked<?php endif; ?> title="下拉列表框">
			<input type="radio" name="setup[inputtype]" value="radio" <?php if($inputtype=='radio'): ?> checked<?php endif; ?> title="单选框">
		</td>
	</tr>
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]"  onchange="javascript:numbertype(this.value);">
				<option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				<option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
			</select>
			<span style="display:none;">
				<input type="checkbox" name = "setup[numbertype]" value="1" checked title="不包括负数" />
			</span>
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<input type="text" class="input-text layui-input" size="5"  name="setup[default]" value="<?php echo htmlentities($default); ?>" />
		</td>
	</tr>
</table>
<?php break; case "typeid": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">选项类型</td>
		<td>
			<input type="radio" name="setup[inputtype]" value="checkbox" <?php if($inputtype=='checkbox'): ?> checked<?php endif; ?> title="复选框">
			<input type="radio" name="setup[inputtype]" value="select" <?php if($inputtype=='select'): ?> checked<?php endif; ?> title="下拉列表框">
			<input type="radio" name="setup[inputtype]" value="radio" <?php if($inputtype=='radio'): ?> checked<?php endif; ?> title="单选框">
		</td>
	</tr>
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]"  onchange="javascript:numbertype(this.value);">
				<option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				<option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				<option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
			</select>
			<span style="display:none;"  >
				<input type="checkbox" name = "setup[numbertype]" value="1" checked title="不包括负数" />
			</span>
		</td>
	</tr>
	<tr>
		<td>顶级类别ID</td>
		<td>
			<input type="text" class="input-text layui-input" size="5"  name="setup[default]" value="<?php echo htmlentities($default); ?>" />
		</td>
	</tr>
</table>
<?php break; case "posid": break; case "radio": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">选项列表:<br>例: <font color="red">选项名称|值</font></td>
		<td>
			<textarea class="layui-textarea"   name="setup[options]" rows="5" cols="40"><?php echo htmlentities($options); ?></textarea>
		</td>
	</tr>
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]" onchange="javascript:numbertype(this.value);">
				<option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				<option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				<option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
				<option value="mediumint" <?php if($fieldtype=='mediumint') echo 'selected';?>>整数 MEDIUMINT(8)</option>
				<option value="int" <?php if($fieldtype=='int') echo 'selected';?>>整数 INT(10)</option>
			</select>
			<span style="display:none;"  >
				<input type="checkbox" name = "setup[numbertype]" value="1" checked title="不包括负数" />
			</span>
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<input type="text" class="input-text layui-input" size="5"  name="setup[default]" value="<?php echo htmlentities($default); ?>" />
		</td>
	</tr>
</table>

<?php break; case "checkbox": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td width="120">选项列表:<br>例: <font color="red">选项名称|值</font></td>
		<td>
			<textarea class="layui-textarea"  name="setup[options]" rows="5" cols="40"><?php echo htmlentities($options); ?></textarea>
		</td>
	</tr>
	<tr>
		<td>字段类型</td>
		<td>
			<select name="setup[fieldtype]" onchange="javascript:numbertype(this.value);">
				<option value="varchar" <?php if($fieldtype=='varchar') echo 'selected';?>>字符 VARCHAR</option>
				<option value="tinyint" <?php if($fieldtype=='tinyint') echo 'selected';?>>整数 TINYINT(3)</option>
				<option value="smallint" <?php if($fieldtype=='smallint') echo 'selected';?>>整数 SMALLINT(5)</option>
				<option value="mediumint" <?php if($fieldtype=='mediumint') echo 'selected';?>>整数 MEDIUMINT(8)</option>
				<option value="int" <?php if($fieldtype=='int') echo 'selected';?>>整数 INT(10)</option>
			</select>
			<span style="display:none;"  >
				<input type="checkbox" name = "setup[numbertype]" value="1" checked title="不包括负数" />
			</span>
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<input type="text" class="input-text layui-input" size="5"  name="setup[default]" value="<?php echo htmlentities($default); ?>" />
		</td>
	</tr>
</table>
<?php break; case "number": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td>是否包括负数：</td>
		<td>
			<input type="radio" name="setup[numbertype]" value="1" title="是" <?php if($numbertype ==1) echo 'checked';?>>
			<input type="radio" name="setup[numbertype]" value="0" title="否" <?php if($numbertype ==0) echo 'checked';?>>
		</td>
	</tr>
	<tr>
		<td>小数位数：</td>
		<td>
			<select name="setup[decimaldigits]">
				<option value="0"<?php if($decimaldigits==0) echo ' selected';?>>0</option>
				<option value="1"<?php if($decimaldigits==1) echo ' selected';?>>1</option>
				<option value="2"<?php if($decimaldigits==2) echo ' selected';?>>2</option>
				<option value="3"<?php if($decimaldigits==3) echo ' selected';?>>3</option>
				<option value="4"<?php if($decimaldigits==4) echo ' selected';?>>4</option>
				<option value="5"<?php if($decimaldigits==5) echo ' selected';?>>5</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>默认值</td>
		<td>
			<input type="text" name="setup[default]" value="<?php echo htmlentities($default); ?>" size="40" class="input-text layui-input">
		</td>
	</tr>
</table>
<?php break; case "image": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td>允许上传的图片类型</td>
		<td><input type="text" name="setup[upload_allowext]" value="<?php echo htmlentities($upload_allowext); ?>" class="input-text layui-input"></td>
	</tr>
</table>
<?php break; case "images": ?>
<table cellpadding="2" cellspacing="1" width="100%">
</table>
<?php break; case "file": ?>
<table cellpadding="2" cellspacing="1" width="100%">
	<tr>
		<td>允许上传的文件类型</td>
		<td><input type="text" name="setup[upload_allowext]" value="<?php echo htmlentities($upload_allowext); ?>" class="input-text layui-input"></td>
	</tr>
</table>
<?php break; case "files": ?>
<table cellpadding="2" cellspacing="1" width="100%">
</table>
<?php break; default: ?>
<?php endswitch; ?>
<script>
    function numbertype(fieldtype){
        if(fieldtype=='varchar'){
            $('#numbertype').hide();
        }else{
            $('#numbertype').show();
        }
    }
    <?php if(!empty($fieldtype) && $fieldtype!='varchar'): ?>$('#numbertype').show();<?php endif; ?>
</script>