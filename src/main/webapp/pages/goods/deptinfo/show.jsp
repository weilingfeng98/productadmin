<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=DeptInfoMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=DeptInfoMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEPT_NAME%>:</td>	
			<td><c:out value="${model.deptName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEPT_CODE%>:</td>	
			<td><c:out value="${model.deptCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_PARENT_ID%>:</td>	
			<td><c:out value="${model.parentId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEPT_LEVEL%>:</td>	
			<td><c:out value="${model.deptLevel}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEPT_PATH%>:</td>	
			<td><c:out value="${model.deptPath}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEPT_PINYIN%>:</td>	
			<td><c:out value="${model.deptPinyin}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_ORDER_BY%>:</td>	
			<td><c:out value="${model.orderBy}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_AUTH_TYPE%>:</td>	
			<td><c:out value="${model.authType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_CREATOR%>:</td>	
			<td><c:out value="${model.creator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_INSERT_TIME%>:</td>	
			<td><c:out value="${model.insertTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_UPDATOR%>:</td>	
			<td><c:out value="${model.updator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DeptInfoMo.ALIAS_UPDATE_TIME%>:</td>	
			<td><c:out value="${model.updateTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>