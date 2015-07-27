<%@page import="com.ny.b2b.common.util.Constant"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.b2b.91nongye.com/tags/joy" prefix="joy"%>
<%@ taglib uri="http://www.b2b.91nongye.com/tags/cache" prefix="cache"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<c:set var="fileServer" value="http://192.168.102.14:28080/resource"/>
<c:set var="base" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="casCtx" value="${pageContext.request.contextPath}"/>
