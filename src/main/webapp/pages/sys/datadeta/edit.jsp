<%@ page import="com.ny.b2b.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=TbaseDatadeta.TABLE_ALIAS%>编辑</title>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改<%=TbaseDatadeta.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${ctx}/sys/datadeta/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="projId" name="projId" value="<c:out value="${model.projId}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TbaseDatadeta.ALIAS_PROJ_NAME%>:
				</td>	
				<td>
				<input id="projName" name="projName" value="<c:out value="${model.projName}"/>" type="text" class="input04"   />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TbaseDatadeta.ALIAS_SN%>:
				</td>	
				<td>
				<input id="sn" name="sn" value="<c:out value="${model.sn}"/>" type="text" class="input04"   />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TbaseDatadeta.ALIAS_DATATYPE_ID%>:
				</td>	
				<td>
				<input id="datatypeId" name="datatypeId" value="<c:out value="${model.datatypeId}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			<tr>	
				<td class="txtr" align="center" colspan="2">
					<input type="button" class="btn01"  value="提交" onclick="$('#form1').submit();"/>
					<input type="button" class="btn01"  value="取消" onclick="window.close();"/>
					<input type="reset" class="btn01"  value="重置"/>
				</td>	
			</tr>
		</table>
	</form>
	
</body>
<script type="text/javascript">
$(function(){
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
	var projName = $.trim($("#projName").val());
	if(projName == ''){
		alert("数据名称不能空");
		$("#projName").focus();
		return false;
	}
	var sn = $.trim($("#sn").val());
	if(sn == ''){
		alert("排序不能空");
		$("#sn").focus();
		return false;
	}
	if(!$.isNumeric(sn)){
		alert("排序必须是数字");
		$("#sn").focus();
		return false;		
	}
	return true;
}
function callBack(data){
	if(data==1)	{
		alert("保存成功！");
		window.close();
	}else{
		alert("保存失败！");
	}
}
</script>
</html>