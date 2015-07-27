<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=GoodsInfoMo.TABLE_ALIAS%>编辑</title>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/jquery.form.js"></script>
</head>
<body>
<div class="title01">
	<h2>修改商品信息</h2>
</div>
	<form id="form1" action="${ctx}/goods/info/update.do" method="post">
	
		<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
			<input type="hidden" id="id" name="id" value="<c:out value="${model.id}"/>"/>
		
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_NAME%>:
				</td>	
				<td>
				<input id="name" name="name" value="<c:out value="${model.name}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_SN%>:
				</td>	
				<td>
				<input id="sn" name="sn" value="<c:out value="${model.sn}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_SUP_SN%>:
				</td>	
				<td>
				<input id="supSn" name="supSn" value="<c:out value="${model.supSn}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_CAT_ID%>:
				</td>	
				<td>
				<input id="catId" name="catId" value="<c:out value="${model.catId}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_CAT_CODE%>:
				</td>	
				<td>
				<input id="catCode" name="catCode" value="<c:out value="${model.catCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			

            <tr>
                <td class="txtr" style="width: 188px">
                    <%=GoodsInfoMo.ALIAS_SUP_ID%>:
                </td>
                <td>
                    <joy:select name="supId" codeValue="ID" codeName="SUP_NAME" dataSource="" select="${model.supId}" table="SUPPLIER" />
                </td>
            </tr>


            <tr>
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_UPC%>:
				</td>	
				<td>
				<input id="upc" name="upc" value="<c:out value="${model.upc}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_MATERIAL_CODE%>:
				</td>	
				<td>
				<input id="materialCode" name="materialCode" value="<c:out value="${model.materialCode}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_MKT_PRICE%>:
				</td>	
				<td>
				<input id="mktPrice" name="mktPrice" value="<c:out value="${model.mktPrice}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_SALE_PRICE%>:
				</td>	
				<td>
				<input id="salePrice" name="salePrice" value="<c:out value="${model.salePrice}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_STORE%>:
				</td>	
				<td>
				<input id="store" name="store" value="<c:out value="${model.store}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_HOME_SHOW%>:
				</td>	
				<td>
				<input id="homeShow" name="homeShow" value="<c:out value="${model.homeShow}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_IMAGE_DEFAULT%>:
				</td>	
				<td>
				<input id="imageDefault" name="imageDefault" value="<c:out value="${model.imageDefault}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_IMAGE_URL%>:
				</td>	
				<td>
				<input id="imageUrl" name="imageUrl" value="<c:out value="${model.imageUrl}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_PRODUCT_AREA%>:
				</td>	
				<td>
				<input id="productArea" name="productArea" value="<c:out value="${model.productArea}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_WEIGHT%>:
				</td>	
				<td>
				<input id="weight" name="weight" value="<c:out value="${model.weight}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_SALE_UNIT%>:
				</td>	
				<td>
				<input id="saleUnit" name="saleUnit" value="<c:out value="${model.saleUnit}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_PRD_ATTR%>:
				</td>	
				<td>
				<input id="prdAttr" name="prdAttr" value="<c:out value="${model.prdAttr}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_PRD_PARAM%>:
				</td>	
				<td>
				<input id="prdParam" name="prdParam" value="<c:out value="${model.prdParam}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_PACKING_LIST%>:
				</td>	
				<td>
				<input id="packingList" name="packingList" value="<c:out value="${model.packingList}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_INSTRUCTION%>:
				</td>	
				<td>
				<input id="instruction" name="instruction" value="<c:out value="${model.instruction}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_STATUS%>:
				</td>	
				<td>
				<input id="status" name="status" value="<c:out value="${model.status}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_SALE_COUNT%>:
				</td>	
				<td>
				<input id="saleCount" name="saleCount" value="<c:out value="${model.saleCount}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_MIN_BUY%>:
				</td>	
				<td>
				<input id="minBuy" name="minBuy" value="<c:out value="${model.minBuy}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_DATA_SOURCE%>:
				</td>	
				<td>
				<input id="dataSource" name="dataSource" value="<c:out value="${model.dataSource}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_IS_SHOW%>:
				</td>	
				<td>
				<input id="isShow" name="isShow" value="<c:out value="${model.isShow}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_INSERT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="insertTimeString" value="<c:out value="${model.insertTimeString}"/>" name="insertTimeString" size="10"  readonly="readonly"/>
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_CREATOR%>:
				</td>	
				<td>
				<input id="creator" name="creator" value="<c:out value="${model.creator}"/>" type="text" class="input04"   />
				
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_DEL_FLAG%>:
				</td>	
				<td>
				<input id="delFlag" name="delFlag" value="<c:out value="${model.delFlag}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_OPT_USER%>:
				</td>	
				<td>
				<input id="optUser" name="optUser" value="<c:out value="${model.optUser}"/>" type="text" class="input04"  required="true" />
				<span class="required">*</span>
				</td>
			</tr>
			
			<tr>	
				<td class="txtr" style="width: 188px">
					<%=GoodsInfoMo.ALIAS_OPT_TIME%>:
				</td>	
				<td>
				<input onClick="WdatePicker()" id="optTimeString" value="<c:out value="${model.optTimeString}"/>" name="optTimeString" size="10" required="true" readonly="readonly"/>
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