<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title>缓存信息</title>
</head>
<body>
	<div class="title01">
	<h2>缓存详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table02" width="100%">
		<tr>	
			<td style="width:80px">缓存key：</td>	
			<td align="left"><c:out value="${key}"/></td>
		</tr>
		<tr>	
			<td>缓存内容：</td>			
			<td><div style="width:1100px; height:500px;word-break:break-all;overflow-y:auto"><c:out value="${result}"/></div></td>		
		</tr>		
	</table>
	</body>
</html>