<%@page import="com.cmdi.b2bjoy.code.Base64"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<c:choose>
<c:when test="${param.url!=null}">
<%String url = request.getParameter("url");
url = new String(Base64.decode(url));
response.sendRedirect(url);
%>
</c:when>
<c:otherwise>
未配置具体的外系统URL
</c:otherwise>
</c:choose>
</body>
</html>