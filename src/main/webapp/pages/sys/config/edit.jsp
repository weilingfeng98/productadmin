<%@ page import="com.ny.b2b.sys.model.TsysConfigMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=TsysConfigMo.TABLE_ALIAS%>编辑</title>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/tooltip.css"/>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/superValidator.js"></script>	
</head>
<body>
<div class="title01">
	<h2>新增<%=TsysConfigMo.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${ctx}/sys/config/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_KEY_NAME%>:
				</td>	
				<td>
				<input id="keyName" name="keyName" value="<c:out value="${model.keyName}"/>" type="text" class="input04"   tip="请输入KEY值" check="2" />
				<span class="required">*</span>
				</td>
			</tr>
			
<!-- 			<tr>	 -->
<!-- 				<td class="txtr" style="width: 188px"> -->
<%-- 					<%=TsysConfigMo.ALIAS_TYPE%>: --%>
<!-- 				</td>	 -->
<!-- 				<td> -->
<%-- 				<input id="type" name="type" value="<c:out value="${model.type}"/>" type="text" class="input04"   /> --%>
<!-- 				<select name="type" id="type" class="input04"> -->
<!-- 				       <option value="">请选择...</option> -->
<%-- 				        <option value="json" <c:if test="${type == 'json'}">selected="selected"</c:if> >JSON</option> --%>
<%-- 				        <option value="NUMBER" <c:if test="${type == 'NUMBER'}">selected="selected"</c:if> >数字</option> --%>
<%-- 				        <option value="STRING" <c:if test="${type == 'STRING'}">selected="selected"</c:if> >字符串</option>			      --%>
<!-- 				 </select> -->
<!-- 				</td> -->
<!-- 			</tr> -->
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_VALUE%>:
				</td>	
				<td>
				<input id="value" name="value" value="<c:out value="${model.value}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_MEMO%>:
				</td>	
				<td>
				<input id="memo" name="memo" value="<c:out value="${model.memo}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_SN%>:
				</td>	
				<td>
				<input id="sn" name="sn" value="<c:out value="${model.sn}"/>" type="text" class="input04"  tip="请输入序号，必须为数字" check="2"  />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_ENABLED%>:
				</td>	
				<td>
<%-- 				<input id="enabled" name="enabled" value="<c:out value="${model.enabled}"/>" type="text" class="input04"  required="true" /> --%>
				<select name="enabled" id="enabled" class="input04"  required="true">
				       <option value="">请选择...</option>
				        <option value="y" <c:if test="${enabled == 'y'}">selected="selected"</c:if> >启用</option>
				        <option value="n" <c:if test="${enabled == 'n'}">selected="selected"</c:if> >禁用</option>
		      </select>
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_MODULE%>:
				</td>	
				<td>
<%-- 				<input id="module" name="module" value="<c:out value="${model.module}"/>" type="text" class="input04"   /> --%>
				<select name="module" id="module" class="input04"  >
			       <option value="">请选择...</option>
			        <option value="ALL" <c:if test="${module == 'ALL'}">selected="selected"</c:if> >系统</option>
			        <option value="HOTEL" <c:if test="${module == 'PRODUCT'}">selected="selected"</c:if> >商品系统</option>
			    </select>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=TsysConfigMo.ALIAS_APP%>:
				</td>	
				<td>
				<lable><input name="app" value="01" type="checkbox" <c:forEach items="${model.app}" var="entry"><c:if test="${entry=='01'}">checked</c:if></c:forEach>>PRODUCTADMIN</lable>
				</td>
			</tr>
			<tr>	
				<td class="txtr" align="center" colspan="2">
					<input type="button" class="btn01"  value="提交" onclick="$('#form1').submit();"/>
					<input type="button" class="btn01"  value="取消" onclick="window.close();"/>
					<input type="reset" class="btn01"  value="重置"/>
				</td>	
			</tr>
		</table>
	</form>
	
</body>
<script type="text/javascript">
$(function(){
	setEmptyCheck("keyName");
	//判断数字
	setIntegeCheck("sn");
	var options = {
	         beforeSubmit:   validateForm,   // pre-submit callback 表单提交前被调用的回调函数
	         success:        callBack   // post-submit callback   表单提交成功后被调用的回调函数
	     }; 
	$('#form1').ajaxForm(options);
});

window.onbeforeunload=function(){
	window.opener.document.queryForm.submit();
}

function validateForm(){
	return btnSubmit();
}
function callBack(data){
	if(data==1)	{
		alert("保存成功！");
		window.close();
	}else if(data==2){
		alert("系统已经存在相同的key！");
	}else{
		alert("保存失败！");
	}
}
</script>
</html>