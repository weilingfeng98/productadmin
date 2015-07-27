<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=GoodsCatMo.TABLE_ALIAS%>新增</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
</head>
<body>
<div class="title01">
	<h2>新增<%=GoodsCatMo.TABLE_ALIAS%></h2>
</div>
	<form id="form1" action="${ctx}/goods/cate/save.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_NAME%>:
				</td>	
				<td>
				<input id="name" name="name" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_PARENT_ID%>:
				</td>	
				<td>
				<input id="parentId" name="parentId" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_CAT_PATH%>:
				</td>	
				<td>
				<input id="catPath" name="catPath" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_CAT_LEVEL%>:
				</td>	
				<td>
				<input id="catLevel" name="catLevel" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_CAT_CODE%>:
				</td>	
				<td>
				<input id="catCode" name="catCode" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_CAT_ORDER%>:
				</td>	
				<td>
				<input id="catOrder" name="catOrder" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_GOODS_COUNT%>:
				</td>	
				<td>
				<input id="goodsCount" name="goodsCount" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_CAT_SHOW%>:
				</td>	
				<td>
				<input id="catShow" name="catShow" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_IMAGE_URL%>:
				</td>	
				<td>
				<input id="imageUrl" name="imageUrl" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_NEW_NAME%>:
				</td>	
				<td>
				<input id="newName" name="newName" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_NEW_SHOW%>:
				</td>	
				<td>
				<input id="newShow" name="newShow" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_NEW_ORDER%>:
				</td>	
				<td>
				<input id="newOrder" name="newOrder" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_PUB_FLAG%>:
				</td>	
				<td>
				<input id="pubFlag" name="pubFlag" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_DEL_FLAG%>:
				</td>	
				<td>
				<input id="delFlag" name="delFlag" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_OPT_USER%>:
				</td>	
				<td>
				<input id="optUser" name="optUser" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsCatMo.ALIAS_OPT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="optTimeString" name="optTimeString" size="10" required="true" readonly="readonly"/>
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

