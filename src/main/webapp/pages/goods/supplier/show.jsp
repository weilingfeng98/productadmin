<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=SupplierMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=SupplierMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_SUP_NAME%>:</td>	
			<td><c:out value="${model.supName}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_SUP_CODE%>:</td>	
			<td><c:out value="${model.supCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_LINK_MAN%>:</td>	
			<td><c:out value="${model.linkMan}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_MOBILE%>:</td>	
			<td><c:out value="${model.mobile}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_EMAIL%>:</td>	
			<td><c:out value="${model.email}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_REMARK%>:</td>	
			<td><c:out value="${model.remark}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_PRIORITY%>:</td>	
			<td><c:out value="${model.priority}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_SALE_PHONE%>:</td>	
			<td><c:out value="${model.salePhone}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_STATUS%>:</td>	
			<td><c:out value="${model.status}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_IS_SHOW%>:</td>	
			<td><c:out value="${model.isShow}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_OPT_USER%>:</td>	
			<td><c:out value="${model.optUser}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=SupplierMo.ALIAS_OPT_TIME%>:</td>	
			<td><c:out value="${model.optTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>