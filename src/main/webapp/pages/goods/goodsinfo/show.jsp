<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
	<title><%=GoodsInfoMo.TABLE_ALIAS%>信息</title>
</head>
<body>
	<div class="title01">
	<h2>商品信息详情</h2>
</div>
	<table cellpadding="0" cellspacing="0" class="table00" style="width: 100%">
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_NAME%>:</td>	
			<td><c:out value="${model.name}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SN%>:</td>	
			<td><c:out value="${model.sn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_BRAND_ID%>:</td>	
			<td><c:out value="${model.brandId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_BRAND_CODE%>:</td>	
			<td><c:out value="${model.brandCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SUP_SN%>:</td>	
			<td><c:out value="${model.supSn}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_CAT_ID%>:</td>	
			<td><c:out value="${model.catId}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_CAT_CODE%>:</td>	
			<td><c:out value="${model.catCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SUP_ID%>:</td>	
			<td><c:out value="${model.supId}"/></td>
		</tr>
		<tr>
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_UPC%>:</td>	
			<td><c:out value="${model.upc}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_MATERIAL_CODE%>:</td>	
			<td><c:out value="${model.materialCode}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_MKT_PRICE%>:</td>	
			<td><c:out value="${model.mktPrice}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SALE_PRICE%>:</td>	
			<td><c:out value="${model.salePrice}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_STORE%>:</td>	
			<td><c:out value="${model.store}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_HOME_SHOW%>:</td>	
			<td><c:out value="${model.homeShow}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_IMAGE_DEFAULT%>:</td>	
			<td><c:out value="${model.imageDefault}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_IMAGE_URL%>:</td>	
			<td><c:out value="${model.imageUrl}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_PRODUCT_AREA%>:</td>	
			<td><c:out value="${model.productArea}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_WEIGHT%>:</td>	
			<td><c:out value="${model.weight}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SALE_UNIT%>:</td>	
			<td><c:out value="${model.saleUnit}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_PRD_ATTR%>:</td>	
			<td><c:out value="${model.prdAttr}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_PRD_PARAM%>:</td>	
			<td><c:out value="${model.prdParam}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_PACKING_LIST%>:</td>	
			<td><c:out value="${model.packingList}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_INSTRUCTION%>:</td>	
			<td><c:out value="${model.instruction}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_STATUS%>:</td>	
			<td><c:out value="${model.status}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_SALE_COUNT%>:</td>	
			<td><c:out value="${model.saleCount}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_MIN_BUY%>:</td>	
			<td><c:out value="${model.minBuy}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_DATA_SOURCE%>:</td>	
			<td><c:out value="${model.dataSource}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_IS_SHOW%>:</td>	
			<td><c:out value="${model.isShow}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_INSERT_TIME%>:</td>	
			<td><c:out value="${model.insertTimeString}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_CREATOR%>:</td>	
			<td><c:out value="${model.creator}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_DEL_FLAG%>:</td>	
			<td><c:out value="${model.delFlag}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_OPT_USER%>:</td>	
			<td><c:out value="${model.optUser}"/></td>
		</tr>
		<tr>	
			<td class="txtr" style="width: 188px"><%=GoodsInfoMo.ALIAS_OPT_TIME%>:</td>	
			<td><c:out value="${model.optTimeString}"/></td>
		</tr>
	</table>
	</body>
</html>