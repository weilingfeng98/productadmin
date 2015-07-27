<%@ page import="com.ny.b2b.sys.model.TcacheConfigMo" %>
<%@ page import="com.ny.b2b.sys.util.CacheConfig" %>
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
<form id="queryForm" name="queryForm" action="<c:url value="/sys/cache/listRE.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px"><%=TcacheConfigMo.ALIAS_CACHE_KEY%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${cacheKey}"/>" id="cacheKey" name="cacheKey" maxlength="100"/>
			</td>
		</tr>	
	</table>
	<br/>
	<div align="center">
		<input type="submit" class="btn01" value="查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br>
	<div class="title01">
	<h2><%=TcacheConfigMo.TABLE_ALIAS%>列表</h2>
</div>
		<div class="groupbtn">
			
			<joy:security url="/sys/cache/showRE.do">
			<a href="javascript:void(0)" title="详情" class="btn002" id="btnshow">详情</a>
			</joy:security>
			<joy:security url="/sys/cache/delRE.do">
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">删除</a>
			</joy:security>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>缓存KEY<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th>缓存名称<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=CacheConfig.ALIAS_USER_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=CacheConfig.ALIAS_APPCONTEXT%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=CacheConfig.ALIAS_IP%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=CacheConfig.ALIAS_INSERT_TIME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				
				
			    <th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.cacheKey}"/></td>
				<td>${v.index + 1 }</td>
				<td>
				<div><c:out value="${entry.cacheKey}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.cacheName}"/></div>
				</td>
				<td>
				<div>
				  <cache:user showAttr="userName,userName" id="${entry.userId}" userType="ALL" defaultValue="${entry.userId}"/>				
				</div>
				</td>
				
				<td>
				<div><c:out value="${entry.appContext}"/></div>
				</td>
				
				<td>
				<div><c:out value="${entry.ip}"/></div>
				</td>
				
				<td>
				<div><c:out value="${entry.insertTime}"/></div>
				</td>
				
				<td>
					<joy:security url="/sys/cache/showRE.do">
						<a href="#" onclick="show('${entry.cacheKey}')">详情</a>
				    </joy:security>&nbsp;
					&nbsp;
					<joy:security url="/sys/cache/delete.do">
						<a href="#" onclick="del('${entry.cacheKey}')">删除</a>
				    </joy:security>&nbsp;
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <joy:page url="${ctx}/sys/cache/listRE.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${ctx}/sys/cache/showRE.do?id='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}


$(function(){
	$('#btnshow').click(function(){
		if($('[name=ids]:checkbox:checked').length>0){
			var ids = [];
			$('[name=ids]:checkbox:checked').each(function(){ids.push($(this).val())});
			show(ids[0]);
		}else{
			alert("请选择后进行操作！");
		}
		
	});
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		window.open('${ctx}/contract/TcacheConfigMo/edit.do?id='+$id.val(),'','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${ctx}/contract/TcacheConfigMo/create.do','','height=600,width=600,resizable=yes,location=no,scrollbars');
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
			$('#cacheKey').val('');
			$('#cacheName').val('');
			$('#cacheType').val('');
			$('#storeType').val('');
			$('#sqlText').val('');
			$('#mapClass').val('');
			$('#insertTimeBegin').val('');
			$('#insertTimeEnd').val('');
			$('#updateTimeBegin').val('');
			$('#updateTimeEnd').val('');
			$('#comments').val('');
			$('#keyAttr').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/sys/cache/delRE.do", {"items":ids.join(',')}, 
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


