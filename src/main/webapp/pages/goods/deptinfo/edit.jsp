<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=DeptInfoMo.TABLE_ALIAS%>编辑</title>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改<%=DeptInfoMo.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${ctx}/goods/deptInfo/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEPT_NAME%>:
				</td>	
				<td>
				<input id="deptName" name="deptName" value="<c:out value="${model.deptName}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEPT_CODE%>:
				</td>	
				<td>
				<input id="deptCode" name="deptCode" value="<c:out value="${model.deptCode}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_PARENT_ID%>:
				</td>	
				<td>
				<input id="parentId" name="parentId" value="<c:out value="${model.parentId}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEPT_LEVEL%>:
				</td>	
				<td>
				<input id="deptLevel" name="deptLevel" value="<c:out value="${model.deptLevel}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEPT_PATH%>:
				</td>	
				<td>
				<input id="deptPath" name="deptPath" value="<c:out value="${model.deptPath}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEPT_PINYIN%>:
				</td>	
				<td>
				<input id="deptPinyin" name="deptPinyin" value="<c:out value="${model.deptPinyin}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_ORDER_BY%>:
				</td>	
				<td>
				<input id="orderBy" name="orderBy" value="<c:out value="${model.orderBy}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_AUTH_TYPE%>:
				</td>	
				<td>
				<input id="authType" name="authType" value="<c:out value="${model.authType}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_DEL_FLAG%>:
				</td>	
				<td>
				<input id="delFlag" name="delFlag" value="<c:out value="${model.delFlag}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_CREATOR%>:
				</td>	
				<td>
				<input id="creator" name="creator" value="<c:out value="${model.creator}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_INSERT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="insertTimeString" value="<c:out value="${model.insertTimeString}"/>" name="insertTimeString" size="10" required="true" readonly="readonly"/>
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_UPDATOR%>:
				</td>	
				<td>
				<input id="updator" name="updator" value="<c:out value="${model.updator}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=DeptInfoMo.ALIAS_UPDATE_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="updateTimeString" value="<c:out value="${model.updateTimeString}"/>" name="updateTimeString" size="10" required="true" readonly="readonly"/>
				<span class="required">*</span>
				</td>
			</tr>
			<tr>	
				<td class="txtc" colspan="2">
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
	return true;
}
function callBack(data){
	if(data==1)	{
		alert("保存成功！");
		window.close();
	}else{
		alert("保存失败！");
	}
}
</script>
</html>