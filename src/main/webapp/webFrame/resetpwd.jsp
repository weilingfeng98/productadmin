<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>修改密码</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/md5.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改密码</h2>
</div>
	<form id="form1" action="${ctx}/sys/user/resetPwd.do" method="post">
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<input type="hidden" name="newPwd" id="newPwd"/>
		<input type="hidden" name="ss" id="ss" value="0"/>
			<tr>	
				<td class="txtr" style="width: 88px">旧密码：</td>	
				<td>
					<input id="oldPwd" name="oldPwd" type="password" class="input04"  />
				</td>
			</tr>
			<tr>	
				<td class="txtr" style="width: 88px">新密码：</td>	
				<td>
					<input id="pwd1" name="pwd1" type="password" class="input04" />
				</td>
			</tr>
			<tr>	
				<td class="txtr" style="width: 88px">重复新密码：</td>	
				<td>
					<input id="pwd2" name="pwd2" type="password" class="input04"  onchange="$('#newPwd').val(hex_md5(this.value).toUpperCase())"/>
				</td>
			</tr>
			<tr>	
				<td align="center" colspan="2">
					<input type="button" class="btn01"  value="提交" onclick="chageToMd5(); "/>
					<input type="button" class="btn01"  value="取消" onclick="window.close();"/>
					<input type="reset" class="btn01"  value="重置"/>
				</td>	
			</tr>
		</table>
	</form>
<div id="deptSelect" class="ztree" style="background-color: white; width: 200px; height: auto; display: none; position: absolute; border: 1px dashed #666666; z-index: 100;"></div>
<script type="text/javascript">	
	function update(oldPwd,newPwd){		
		if(newPwd.length>0 ){
			$.post( "${ctx}/sys/user/resetPwd.do", {"oldPwd":oldPwd,"newPwd":newPwd}, 
					function(data){
				if(data==1)	{
					alert("保存成功！");
					$('#form1').submit();
					window.close();
				}else if(data == "notnull"){
					alert("新密码和重复新密码不能为空！"); $("#oldPwd").focus();clean();
				}else if(data == "notexist"){
					alert("用户不存在！");clean();
				}else if(data == "pwdwrong"){
					alert("旧用户密码错误！"); $("#oldPwd").focus();clean();
				}else if(data == "encrypt"){
					alert("新密码必须经过加密！"); $("#pwd1").focus();clean();
				}else{
					alert("保存失败！");
				}
					}
			);
		}
	};
	
function md5(obj){
	var value = obj.value;
	if($.trim(value).length != 0){
		obj.value = hex_md5(value).toUpperCase();
	}
	return 
}
function chageToMd5(){	
	if(validateForm1()==true){
	var newPwd=$("#newPwd").val();
	var oldPwd = $("#oldPwd");
	var pwd1 = $("#pwd1");
	var pwd2 = $("#pwd2");
	$('#pwd2').val(hex_md5(pwd2.val()).toUpperCase());
	$('#pwd1').val(hex_md5(pwd1.val()).toUpperCase());
	$('#oldPwd').val(hex_md5(oldPwd.val()).toUpperCase());
	update(oldPwd.val(),newPwd);
	}
	
}

function validateForm1(){
	// 旧密码不能为空。
	var oldPwd = $("#oldPwd");
	if($.trim(oldPwd.val()).length <= 0)
	   {alert("旧密码不能为空！"); oldPwd.focus();return false;}
	// 新密码不能为空。
	var pwd1 = $("#pwd1");
	if($.trim(pwd1.val()).length <= 0)
	   {alert("新密码不能为空！"); pwd1.focus();return false;}
	// 重复新密码不能为空。
	var pwd2 = $("#pwd2");
	if($.trim(pwd2.val()).length <= 0)
	   {alert("重复新密码不能为空！"); pwd2.focus();return false;}
	// 新旧密码必须一致。 
	if(pwd1.val() != pwd2.val()){
		{alert("新密码和重复新密码不一致！"); pwd2.focus();return false;}
	}
	 if(!checkPaw()){
		return false;
	} 
	
	///md5(pwd1.val());

	return true;
}
function clean(){
	$("#newPwd").val('');
	$("#oldPwd").val('');
	$("#pwd1").val('');
	$("#pwd2").val('');
}

function checkPaw(){
	var pwd1 = $("#pwd1");
	 if($.trim(pwd1.val()).length == 0)
	   {alert("新密码不能为空！"); pwd1.focus();return false;} 
	 	
	 if($.trim(pwd1.val()).length > 0 && $.trim(pwd1.val()).length < 6)
	   {alert("新密码过短！"); pwd1.focus();return false;} 
	
	 if (!(/[a-z]/.test($('#pwd1').val()) && /[A-Z]/.test($('#pwd1').val())  && /[0-9]/.test($('#pwd1').val()))) {
			alert("您设置的密码为弱密码，请修改!\n提示：密码必须包含大写字母、小写字母及数字，且长度为6~16位！");
			$("#pwd1").focus();
			 return false;
		}
	return true;
}
</script>
</body>
</html>

