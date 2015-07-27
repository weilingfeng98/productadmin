<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page import="com.ny.b2b.user.model.UserInfoMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=UserInfoMo.TABLE_ALIAS%>新增</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
</head>
<body>
<div class="title01">
	<h2>新增<%=UserInfoMo.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${ctx}/sys/user/save.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_USER_NAME%>:
				</td>	
				<td>
				<input id="userName" name="userName" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_PWD%>:
				</td>	
				<td>
				<input id="pwd" name="pwd" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_REAL_NAME%>:
				</td>	
				<td>
				<input id="realName" name="realName" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_EMP_NO%>:
				</td>	
				<td>
				<input id="empNo" name="empNo" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_SEX%>:
				</td>	
				<td>
				<input id="sex" name="sex" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_MOBILE%>:
				</td>	
				<td>
				<input id="mobile" name="mobile" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_EMAIL%>:
				</td>	
				<td>
				<input id="email" name="email" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_JOB%>:
				</td>	
				<td>
				<input id="job" name="job" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_DEPT_ID%>:
				</td>	
				<td>
				<input id="deptId" name="deptId" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_DEPT_CODE%>:
				</td>	
				<td>
				<input id="deptCode" name="deptCode" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_IS_ADMIN%>:
				</td>	
				<td>
				<input id="isAdmin" name="isAdmin" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_ROLE_ID%>:
				</td>	
				<td>
				<input id="roleId" name="roleId" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_STATUS%>:
				</td>	
				<td>
				<input id="status" name="status" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_DEL_FLAG%>:
				</td>	
				<td>
				<input id="delFlag" name="delFlag" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_CREATOR%>:
				</td>	
				<td>
				<input id="creator" name="creator" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_INSERT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="insertTimeString" name="insertTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_UPDATOR%>:
				</td>	
				<td>
				<input id="updator" name="updator" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=UserInfoMo.ALIAS_UPDATE_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="updateTimeString" name="updateTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			<tr>	
				<td class="txtc" colspan="2">
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

