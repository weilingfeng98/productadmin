<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=GoodsCatMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=GoodsCatMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_NAME%>:</td>	
			<td><c:out value="${model.name}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_PARENT_ID%>:</td>	
			<td><c:out value="${model.parentId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_CAT_PATH%>:</td>	
			<td><c:out value="${model.catPath}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_CAT_LEVEL%>:</td>	
			<td><c:out value="${model.catLevel}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_CAT_CODE%>:</td>	
			<td><c:out value="${model.catCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_CAT_ORDER%>:</td>	
			<td><c:out value="${model.catOrder}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_GOODS_COUNT%>:</td>	
			<td><c:out value="${model.goodsCount}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_CAT_SHOW%>:</td>	
			<td><c:out value="${model.catShow}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_IMAGE_URL%>:</td>	
			<td><c:out value="${model.imageUrl}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_NEW_NAME%>:</td>	
			<td><c:out value="${model.newName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_NEW_SHOW%>:</td>	
			<td><c:out value="${model.newShow}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_NEW_ORDER%>:</td>	
			<td><c:out value="${model.newOrder}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_PUB_FLAG%>:</td>	
			<td><c:out value="${model.pubFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_OPT_USER%>:</td>	
			<td><c:out value="${model.optUser}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsCatMo.ALIAS_OPT_TIME%>:</td>	
			<td><c:out value="${model.optTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>