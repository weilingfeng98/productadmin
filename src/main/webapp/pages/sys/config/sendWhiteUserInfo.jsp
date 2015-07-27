<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>发送白名单配置</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/tooltip.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/superValidator.js"></script>	
</head>
<body>
<div class="title01">
	<h2>发送白名单配置</h2>
</div>
	<form id="form1" action="${ctx}/sys/config/editSysConfig.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<tr>	
				<td class="txtr" style="width: 188px">
					姓名:
				</td>	
				<td>
				<input  name="whiteUser.fullName" type="radio" <c:if test="${whiteUser.fullName =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.fullName" type="radio" id="fullName" <c:if test="${whiteUser.fullName =='1'}">checked="checked" </c:if> value="1" />导出
				</td>
			</tr>
			
			
			<tr>	
				<td class="txtr" style="width: 188px">
					身份证号:
				</td>	
				<td>
				<input  name="whiteUser.numCredentials" type="radio" <c:if test="${whiteUser.numCredentials =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.numCredentials" type="radio" id="numCredentials" <c:if test="${whiteUser.numCredentials =='1'}">checked="checked" </c:if> value="1" />导出
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					护照号:
				</td>	
				<td>
				<input  name="whiteUser.numPassport" type="radio" <c:if test="${whiteUser.numPassport =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.numPassport" type="radio" id="numPassport" <c:if test="${whiteUser.numPassport =='1'}">checked="checked" </c:if> value="1" />导出
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					手机号:
				</td>	
				<td>
				<input  name="whiteUser.mobile" type="radio" <c:if test="${whiteUser.mobile =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.mobile" type="radio" id="mobile" <c:if test="${whiteUser.mobile =='1'}">checked="checked" </c:if> value="1" />导出
				
				</td>
			</tr>
			<tr>	
				<td class="txtr" style="width: 188px">
					邮箱:
				</td>	
				<td>
				<input  name="whiteUser.email" type="radio" <c:if test="${whiteUser.email =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.email" type="radio" id="email" <c:if test="${whiteUser.email =='1'}">checked="checked" </c:if> value="1" />导出
				
				</td>
			</tr>
			<tr>	
				<td class="txtr" style="width: 188px">
					企业名:
				</td>	
				<td>
				<input  name="whiteUser.companyName" type="radio" <c:if test="${whiteUser.companyName =='0'}">checked="checked" </c:if> value="0" />不导出
		        <input  name="whiteUser.companyName" type="radio" id="companyName" <c:if test="${whiteUser.companyName =='1'}">checked="checked" </c:if> value="1" />导出
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" align="center">
					<input type="button" class="btn01"  value="提交" onclick="$('#form1').submit();"/>
				</td>	
			</tr>
		</table>
	</form>
	
</body>
<script type="text/javascript">
$(function(){
	var $fullName = $('[name=whiteUser.fullName]:checkbox:checked');
	if($fullName.length==0){
		$("#fullName").attr('checked',true);
	}
	var $numCredentials = $('[name=whiteUser.numCredentials]:checkbox:checked');
	if($numCredentials.length==0){
		$("#numCredentials").attr('checked',true);
	}
	var $numPassport = $('[name=whiteUser.numPassport]:checkbox:checked');
	if($numPassport.length==0){
		$("#numPassport").attr('checked',true);
	}
	
	var $mobile = $('[name=whiteUser.mobile]:checkbox:checked');
	if($mobile.length==0){
		$("#mobile").attr('checked',true);
	}
	var $email = $('[name=whiteUser.email]:checkbox:checked');
	if($email.length==0){
		$("#email").attr('checked',true);
	}
	var $companyName = $('[name=whiteUser.companyName]:checkbox:checked');
	if($companyName.length==0){
		$("#companyName").attr('checked',true);
	}
	
	
	var options = {
	         beforeSubmit:   validateForm,   // pre-submit callback 表单提交前被调用的回调函数
	         success:        callBack   // post-submit callback   表单提交成功后被调用的回调函数
	     }; 
	$('#form1').ajaxForm(options);
});

window.onbeforeunload=function(){
	window.opener.document.queryForm.submit();
}

function validateForm(){
	return btnSubmit();
}
function callBack(data){
	if(data==1)	{
		alert("保存成功！");
		window.close();
	}else if(data==2){
		alert("系统已经存在相同的key！");
	}else{
		alert("保存失败！");
	}
}
</script>
</html>

