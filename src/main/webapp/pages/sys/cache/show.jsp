<%@ page import="com.ny.b2b.sys.model.TcacheConfigMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=TcacheConfigMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=TcacheConfigMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_CACHE_KEY%>:</td>	
			<td><c:out value="${model.cacheKey}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_CACHE_NAME%>:</td>	
			<td><c:out value="${model.cacheName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_CACHE_TYPE%>:</td>	
			<td><c:out value="${model.cacheType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_STORE_TYPE%>:</td>	
			<td><c:out value="${model.storeType}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_SQL_TEXT%>:</td>	
			<td><c:out value="${model.sqlText}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_MAP_CLASS%>:</td>	
			<td><c:out value="${model.mapClass}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_KEY_ATTR%>:</td>	
			<td><c:out value="${model.keyAttr}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TcacheConfigMo.ALIAS_COMMENTS%>:</td>
			<td><c:out value="${model.comments}"/></td>
		</tr>
	</table>
	</body>
</html>