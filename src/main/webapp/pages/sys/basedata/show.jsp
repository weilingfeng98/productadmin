<%@ page import="com.ny.b2b.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=TbaseDatatype.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=TbaseDatatype.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=TbaseDatatype.ALIAS_DATATYPE_NAME%>:</td>	
			<td><c:out value="${model.datatypeName}"/></td>
		</tr>
	</table>
	</body>
</html>