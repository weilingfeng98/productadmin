<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" %>
<%@ page import="org.apache.commons.logging.LogFactory" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Error Page</title>
	<script type="text/javascript">
	if (top.location != self.location){
		top.location=self.location;    
	} 
	</script>
</head>

<body>

<div id="content">
	<img alt="system internal error" src="${ctx}/images/error.gif" />
	<h3>
	对不起,您输入的地址存在非法字符,不能处理你的请求<br />
	</h3>
	<br>

	<button onclick="history.back();">返回</button>
	<br>

</div>
</body>
</html>