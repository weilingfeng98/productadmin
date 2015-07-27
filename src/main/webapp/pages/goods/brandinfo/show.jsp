<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=BrandInfoMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=BrandInfoMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRAND_NAME%>:</td>	
			<td><c:out value="${model.brandName}"/></td>
		</tr>
		<tr>
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRAND_PY%>:</td>	
			<td><c:out value="${model.brandPy}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRAND_FIRST%>:</td>	
			<td><c:out value="${model.brandFirst}"/></td>
		</tr>
		<tr>
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_LOGO%>:</td>	
			<td><c:out value="${model.logo}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRIEF%>:</td>	
			<td><c:out value="${model.brief}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRAND_URL%>:</td>	
			<td><c:out value="${model.brandUrl}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_BRAND_STATUS%>:</td>	
			<td><c:out value="${model.brandStatus}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_OPT_USER%>:</td>	
			<td><c:out value="${model.optUser}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=BrandInfoMo.ALIAS_OPT_TIME%>:</td>	
			<td><c:out value="${model.optTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>