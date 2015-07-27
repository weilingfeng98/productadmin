<%@ page import="com.ny.b2b.sys.model.TcacheConfigMo" %>
<%@ page import="com.ny.b2b.sys.util.CacheConfig" %>
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
	<h2><%=CacheConfig.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_CACHE_KEY%>:</td>	
			<td><c:out value="${entry.cacheKey}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_CACHE_NAME%>:</td>	
			<td><c:out value="${entry.cacheName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_USER_ID%>:</td>	
			<td> <cache:user showAttr="userName,userName" id="${entry.userId}" userType="ALL" defaultValue="${entry.userId}"/>	</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_APPCONTEXT%>:</td>	
			<td><c:out value="${entry.appContext}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_IP%>:</td>	
			<td><c:out value="${entry.ip}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=CacheConfig.ALIAS_INSERT_TIME%>:</td>	
			<td><c:out value="${entry.insertTime}"/></td>
		</tr>
		<tr>	
			<td valign="top" class="txtr" style="width: 188px">缓存内容:</td>	
			<td><div style="width:500px; height:200px;word-break:break-all;overflow-y:auto"><c:out value="${result}"/></div></td>	
		</tr>
		
	</table>
	</body>
</html>