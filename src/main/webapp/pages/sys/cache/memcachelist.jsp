<%@ page import="com.ny.b2b.sys.model.TcacheConfigMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=TcacheConfigMo.TABLE_ALIAS%> 维护</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${ctx}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/sys/cache/mlist.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<div align="center">
	<table width="40%" border="0" cellspacing="0" cellpadding="0" class="table00" align="center">
		<tr>	
			<td class="txtr" style="width: 100px"><%=TcacheConfigMo.ALIAS_CACHE_KEY%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${cacheKey}"/>" id="cacheKey" name="cacheKey" maxlength="100"/>
			</td>
		</tr>	
	</table>
	<br/>
		<input type="submit" class="btn01" value="查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('0');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br></br>
	<div class="title01">
	<h2>缓存列表</h2>
</div>
		<div class="groupbtn">
			<joy:security url="/sys/cache/delete.do">
				<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">删除</a>
			</joy:security>
			<joy:security url="/sys/cache/flushAll.do">
				<a href="javascript:void(0)" title="刷新所有缓存" class="btn008" id="btnflush">刷新所有</a>
			</joy:security>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TcacheConfigMo.ALIAS_CACHE_KEY%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TcacheConfigMo.ALIAS_CACHE_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
				<c:forEach var="entry" items="${page.result}" varStatus="v">
					<tr>
						<td><input name="ids" type="checkbox" value="${entry.cacheKey}"/></td>
						<td>${v.index + 1 }</td>
						<td><div><c:out value="${entry.cacheKey}"/></div></td>
						<td><div><c:out value="${entry.cacheName}"/></div></td>
						<td>
							<joy:security url="/sys/cache/delete.do">
								<a href="#" onclick="del('${entry.cacheKey}')">删除</a>
							</joy:security>&nbsp;
							<joy:security url="/sys/cache/showMessage.do">
							<a href="#" onclick="show('${entry.cacheKey}')">详情</a>
							</joy:security>&nbsp;
						</td>
					</tr>
				</c:forEach>
			</table>
     	 <joy:page url="${ctx}/sys/cache/mlist.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(key){
	window.open('${ctx}/sys/cache/showMessage.do?id='+key,'','height=600,width=1200,,location=no,scrollbars');
}
$(function(){
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
			$('#cacheKey').val('');
	});
	
	$("#btnflush").click(function(){
		if(!confirm("确定要刷新所有缓存内容吗？")){
			return false;
		}
		$.post( "${ctx}/sys/cache/flushAll.do", function(data){
					if(data == "1"){
						alert("刷新成功！");
						$('#queryForm').submit();
					}else{
						alert(data);
					}
				}
		);
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/sys/cache/deleteMemcached.do", {"items":ids.join(',')}, 
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


