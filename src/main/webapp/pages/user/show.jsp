<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page import="com.ny.b2b.user.model.UserInfoMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=UserInfoMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=UserInfoMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_USER_NAME%>:</td>	
			<td><c:out value="${model.userName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_PWD%>:</td>	
			<td><c:out value="${model.pwd}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_REAL_NAME%>:</td>	
			<td><c:out value="${model.realName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_EMP_NO%>:</td>	
			<td><c:out value="${model.empNo}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_SEX%>:</td>	
			<td><c:out value="${model.sex}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_MOBILE%>:</td>	
			<td><c:out value="${model.mobile}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_EMAIL%>:</td>	
			<td><c:out value="${model.email}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_JOB%>:</td>	
			<td><c:out value="${model.job}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_DEPT_ID%>:</td>	
			<td><c:out value="${model.deptId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_DEPT_CODE%>:</td>	
			<td><c:out value="${model.deptCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_IS_ADMIN%>:</td>	
			<td><c:out value="${model.isAdmin}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_ROLE_ID%>:</td>	
			<td><c:out value="${model.roleId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_STATUS%>:</td>	
			<td><c:out value="${model.status}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_CREATOR%>:</td>	
			<td><c:out value="${model.creator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_INSERT_TIME%>:</td>	
			<td><c:out value="${model.insertTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_UPDATOR%>:</td>	
			<td><c:out value="${model.updator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=UserInfoMo.ALIAS_UPDATE_TIME%>:</td>	
			<td><c:out value="${model.updateTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>