<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=BrandInfoMo.TABLE_ALIAS%>编辑</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/validform/Validform_v5.3.2_min.js"></script>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改商品信息</h2> 
</div>
	<form id="form1" action="${ctx}/goods/brandinfo/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRAND_NAME%>:
				</td>	
				<td>
				<input id="brandName" name="brandName" value="<c:out value="${model.brandName}"/>" type="text" class="input04"  datatype="*" />
				<span class="required">*</span>
				</td>
			</tr>
			

			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRAND_PY%>:
				</td>	
				<td>
				<input id="brandPy" name="brandPy" value="<c:out value="${model.brandPy}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRAND_FIRST%>:
				</td>	
				<td>
				<input id="brandFirst" name="brandFirst" value="<c:out value="${model.brandFirst}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			

			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_LOGO%>:
				</td>	
				<td>
				<input id="logo" name="logo" value="<c:out value="${model.logo}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRIEF%>:
				</td>	
				<td>
				<input id="brief" name="brief" value="<c:out value="${model.brief}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRAND_URL%>:
				</td>	
				<td>
				<input id="brandUrl" name="brandUrl" value="<c:out value="${model.brandUrl}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			

			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_SORT_NUM%>:
				</td>	
				<td>
				<input id="sortNum" name="sortNum" value="<c:out value="${model.sortNum}"/>" type="text" class="input04"   />
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_BRAND_STATUS%>:
				</td>	
				<td>
				<input id="brandStatus" name="brandStatus" value="<c:out value="${model.brandStatus}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_DEL_FLAG%>:
				</td>	
				<td>
				<input id="delFlag" name="delFlag" value="<c:out value="${model.delFlag}"/>" type="text" class="input04"  datatype="*" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_OPT_USER%>:
				</td>	
				<td>
				<input id="optUser" name="optUser" value="<c:out value="${model.optUser}"/>" type="text" class="input04"  datatype="*" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=BrandInfoMo.ALIAS_OPT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="optTimeString" value="<c:out value="${model.optTimeString}"/>" name="optTimeString" size="10" datatype="*" readonly="readonly"/>
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
	$("#form1").Validform({
		tiptype:3,
		label:".label",
		showAllError:true,
		ajaxPost:true,
		callback:function(data){
			callBack(data);
		}
	});
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