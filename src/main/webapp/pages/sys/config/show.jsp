<%@ page import="com.ny.b2b.sys.model.TsysConfigMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=TsysConfigMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2><%=TsysConfigMo.TABLE_ALIAS%>详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_KEY_NAME%>:</td>	
			<td><c:out value="${model.keyName}"/></td>
		</tr>
<!-- 		<tr>	 -->
<%-- 			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_TYPE%>:</td>	 --%>
<%-- 			<td><c:out value="${model.type}"/></td> --%>
<!-- 		</tr> -->
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_VALUE%>:</td>	
			<td><c:out value="${model.value}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_MEMO%>:</td>	
			<td><c:out value="${model.memo}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_SN%>:</td>	
			<td><c:out value="${model.sn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_ENABLED%>:</td>	
			<td>
			<c:if test="${model.enabled == 'y'}">
			可用
			</c:if>
			<c:if test="${model.enabled == 'n'}">
			不可用
			</c:if>
			</td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_MODULE%>:</td>	
			<td><c:out value="${model.module}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=TsysConfigMo.ALIAS_APP%>:</td>	
			<td>
			<c:forEach items="${model.app}" var="entry">
			<c:if test="${entry == '01'}">
			JOYADMIN
			</c:if>
			</c:forEach>
			<c:forEach items="${model.app}" var="entry">
			<c:if test="${entry == '02'}">
			JOYPORTAL
			</c:if>
			</c:forEach>
			<c:forEach items="${model.app}" var="entry">
			<c:if test="${entry == '03'}">
			JOYOA
			</c:if>
			</c:forEach>
			</td>
		</tr>
	</table>
	</body>
</html>