<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=DatasourceConfig.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=DatasourceConfig.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_APP_ID%>:</td>	
			<td><c:out value="${model.appId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_APP_SN%>:</td>	
			<td><c:out value="${model.appSn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_NAME_CN%>:</td>	
			<td><c:out value="${model.nameCn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_NAME_EN%>:</td>	
			<td><c:out value="${model.nameEn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_DB_TYPE%>:</td>	
			<td><c:out value="${model.dbType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_DS_TYPE%>:</td>	
			<td><c:out value="${model.dsType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_DB_CONFIG%>:</td>	
			<td><c:out value="${model.dbConfig}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_COMMENTS%>:</td>	
			<td><c:out value="${model.comments}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_CREATOR%>:</td>	
			<td><c:out value="${model.creator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_INSERT_TIME%>:</td>	
			<td><c:out value="${model.insertTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=DatasourceConfig.ALIAS_UPDATE_TIME%>:</td>	
			<td><c:out value="${model.updateTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>