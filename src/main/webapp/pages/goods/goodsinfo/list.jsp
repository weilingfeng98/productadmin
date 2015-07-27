<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=GoodsInfoMo.TABLE_ALIAS%> 维护</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${ctx}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/goods/info/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px"><%=GoodsInfoMo.ALIAS_NAME%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${name}"/>" id="name" name="name" maxlength="200"/>
			</td>
			<td class="txtr" style="width: 100px"><%=GoodsInfoMo.ALIAS_SN%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${sn}"/>" id="sn" name="sn" maxlength="50"/>
			</td>
            <td class="txtr" style="width: 100px"><%=GoodsInfoMo.ALIAS_SUP_ID%>：</td>
            <td>
                &nbsp;&nbsp;
                <joy:select name="supId" codeValue="ID" codeName="SUP_NAME" dataSource="" select="${supId}" table="SUPPLIER" />
        </tr>
        <tr>
            <td class="txtr" style="width: 100px"><%=GoodsInfoMo.ALIAS_BRAND_ID%>：</td>
            <td>
                &nbsp;
                <joy:select name="brandId" codeValue="ID" codeName="BRAND_NAME" dataSource="" select="${brandId}" table="BRAND_INFO" />
            </td>

        </tr>
	</table>
	<br/>
	<div align="center">
		<input type="submit" class="btn01" value="精确查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('0');"/>
		<input type="submit" class="btn01" value="模糊查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br>
	<div class="title01">
	<h2><%=GoodsInfoMo.TABLE_ALIAS%>列表</h2>
</div>
		<div class="groupbtn">
			<joy:security url="/goods/info/create.do">
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnadd">新增</a>
			</joy:security>
			<joy:security url="/goods/info/update.do">
			<a href="javascript:void(0)" title="修改" class="btn002" id="btnedit">修改</a>
			</joy:security>
			<joy:security url="/goods/info/delete.do">
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">删除</a>
			</joy:security>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=GoodsInfoMo.ALIAS_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=GoodsInfoMo.ALIAS_SN%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
                 <th><%=GoodsInfoMo.ALIAS_SUP_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=GoodsInfoMo.ALIAS_SUP_SN%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=GoodsInfoMo.ALIAS_CAT_CODE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
                 <th><%=GoodsInfoMo.ALIAS_SALE_PRICE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			    <th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.id}"/></td>
				<td>${v.index + 1 }</td>
				<td>
				<div><c:out value="${entry.name}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.sn}"/></div>
				</td>
                <td>
                    <div>
                        <cache:json key="${entry.supId}" prefixKey="SUPPLIER_OBJECT" showAttr="SUP_NAME" default="－"/>
                    </div>
                </td>
				<td>
				<div><c:out value="${entry.supSn}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.catCode}"/></div>
				</td>
                <td>
                    <div><c:out value="${entry.salePrice}"/></div>
                </td>
				<td>
					<joy:security url="${ctx}/goods/info/show.do">
						<a href="#" onclick="show('${entry.id}')">详情</a>
				    </joy:security>&nbsp;
					<joy:security url="${ctx}/goods/info/update.do">
						<a href="#" onclick="edit('${entry.id}')">修改</a>
				    </joy:security>&nbsp;
					<joy:security url="${ctx}/goods/info/delete.do">
						<a href="#" onclick="del('${entry.id}')">删除</a>
				    </joy:security>&nbsp;
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <joy:page url="${ctx}/goods/info/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	openWin('${ctx}/goods/info/show.do?id='+id);
	window.open('${ctx}/goods/info/show.do?id='+id,'','height=600,width=800,resizable=yes,location=no,scrollbars');
}
function edit(id){
	openWin('${ctx}/goods/info/edit.do?id='+id);
	//window.open('${ctx}/goods/info/edit.do?id='+id,'','height=600,width=800,resizable=yes,location=no,scrollbars');
}
function openWin(htmUrl)  

{  
var url=htmUrl; //要打开的窗口  
var winName=""; //给打开的窗口命名  
var awidth=800; //窗口宽度,需要设置  
var aheight=600; //窗口高度,需要设置  
var atop=(screen.availHeight - aheight)/2; //窗口顶部位置,一般不需要改  
var aleft=(screen.availWidth - awidth)/2; //窗口放中央,一般不需要改  
var param0="scrollbars=yes,status=0,menubar=0,resizable=2,location=0"; //新窗口的参数  
//新窗口的左部位置，顶部位置，宽度，高度  
var params="top=" + atop + ",left=" + aleft + ",width=" + awidth + ",height=" + aheight + "," + param0 ;  
win=window.open(url,winName,params); //打开新窗口  

win.focus(); //新窗口获得焦点  

}  

$(function(){
	
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		openWin('${ctx}/goods/info/edit.do?id='+$id.val());
		//window.open('${ctx}/goods/info/edit.do?id='+$id.val(),'','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		openWin('${ctx}/goods/info/create.do');
		//window.open('${ctx}/goods/info/create.do','','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btndelete').click(function(){
		if($('[name=ids]:checkbox:checked').length>0){
			var ids = [];
			$('[name=ids]:checkbox:checked').each(function(){ids.push($(this).val())});
			v_deleteItems(ids);
		}else{
			alert("请选择后进行删除操作！");
		}
		
	});
	
	$('#btnclear').click(function(){
			$('#name').val('');
			$('#sn').val('');
			$('#brandId').val('');
			$('#brandCode').val('');
			$('#supSn').val('');
			$('#catId').val('');
			$('#catCode').val('');
			$('#supId').val('');
			$('#supCode').val('');
			$('#upc').val('');
			$('#materialCode').val('');
			$('#mktPrice').val('');
			$('#salePrice').val('');
			$('#store').val('');
			$('#homeShow').val('');
			$('#imageDefault').val('');
			$('#imageUrl').val('');
			$('#productArea').val('');
			$('#weight').val('');
			$('#saleUnit').val('');
			$('#prdAttr').val('');
			$('#prdParam').val('');
			$('#packingList').val('');
			$('#instruction').val('');
			$('#status').val('');
			$('#saleCount').val('');
			$('#minBuy').val('');
			$('#dataSource').val('');
			$('#isShow').val('');
			$('#insertTimeBegin').val('');
			$('#insertTimeEnd').val('');
			$('#creator').val('');
			$('#delFlag').val('');
			$('#optUser').val('');
			$('#optTimeBegin').val('');
			$('#optTimeEnd').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/goods/info/delete.do", {"items":ids.join(',')}, 
				function(data){
					if(data=='1'){
						alert('删除成功');
						$('#queryForm').submit();
					}else{
						alert('删除失败');
					}
				}
		);
	}
};
</script>
</body>
</html>


