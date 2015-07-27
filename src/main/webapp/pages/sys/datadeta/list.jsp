<%@ page import="com.ny.b2b.sys.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=TbaseDatadeta.TABLE_ALIAS%> 维护</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${ctx}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/sys/datadeta/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<div align="center">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>
			<td class="txtr" style="width: 100px"><%=TbaseDatadeta.ALIAS_PROJ_ID%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${projId}"/>" id="projId" name="projId" maxlength="200"/>
			</td>	
			<td class="txtr" style="width: 100px"><%=TbaseDatadeta.ALIAS_PROJ_NAME%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${projName}"/>" id="projName" name="projName" maxlength="200"/>
			</td>
			<td class="txtr" style="width: 100px"><%=TbaseDatadeta.ALIAS_SN%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${sn}"/>" id="sn" name="sn" maxlength="10"/>
			</td>
			<td class="txtr" style="width: 100px"><%=TbaseDatadeta.ALIAS_DATATYPE_ID%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${datatypeId}"/>" id="datatypeId" name="datatypeId" maxlength="5"/>
			</td>
		</tr>	
	</table>
	<br/>
		<input type="submit" class="btn01" value="精确查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('0');"/>
		<input type="submit" class="btn01" value="模糊查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br></br>
	<div class="title01">
	<h2><%=TbaseDatadeta.TABLE_ALIAS%>列表</h2>
</div>
		<div class="groupbtn">
<%-- 			<joy:security url="/sys/datadeta/create.do"> --%>
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnadd">
			新增</a>
<%-- 			</joy:security> --%>
<%-- 			<joy:security url="/sys/datadeta/update.do"> --%>
			<a href="javascript:void(0)" title="修改" class="btn002" id="btnedit">
			修改</a>
<%-- 			</joy:security> --%>
<%-- 			<joy:security url="/sys/datadeta/delete.do"> --%>
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">
			删除</a>
<%-- 			</joy:security> --%>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			 	<th><%=TbaseDatadeta.ALIAS_PROJ_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TbaseDatadeta.ALIAS_PROJ_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TbaseDatadeta.ALIAS_SN%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TbaseDatadeta.ALIAS_DATATYPE_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			<th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.projId}"/></td>
				<td>${v.index + 1 }</td>
				<td>
				<div><c:out value="${entry.projId}"/></div>
				</td>				
				<td>
				<div><c:out value="${entry.projName}"/></div>
				</td>
				
				<td>
				<div><c:out value="${entry.sn}"/></div>
				</td>
				
				<td>
				<div>
				<c:out value="${entry.datatypeName}"/>
				</div>
				</td>
				
			<td>
<%-- 			<joy:security url="/sys/datadeta/show.do"> --%>
			<a href="#" onclick="show('${entry.projId}')">详情</a>
<%-- 			</joy:security>&nbsp; --%>
<%-- 			<joy:security url="/sys/datadeta/update.do"> --%>
			<a href="#" onclick="edit('${entry.projId}')">修改</a>
<%-- 			</joy:security>&nbsp; --%>
<%-- 			<joy:security url="/sys/datadeta/delete.do"> --%>
			<a href="#" onclick="del('${entry.projId}')">删除</a>
<%-- 			</joy:security>&nbsp; --%>
			</td>
			</tr>
			</c:forEach>
			</table>
     	 <joy:page url="${ctx}/sys/datadeta/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${ctx}/sys/datadeta/show.do?projId='+id,'','height=600,width=600,,location=no,scrollbars');
}
function edit(id){
	window.open('${ctx}/sys/datadeta/edit.do?projId='+id,'','height=600,width=600,location=no,scrollbars');
}

function del(id){
	var ids = [];
	ids.push(id);
	if(confirm("确定要删除吗？")){
	$.post( "${ctx}/sys/datadeta/delete.do", {"items":ids.join(',')}, 
			function(data){
				if(data=='1'){
					alert('删除成功');
					$('#queryForm').submit();
				}else{
					alert('删除失败');
				}
			}
	);}
}

$(function(){
	
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		window.open('${ctx}/sys/datadeta/edit.do?projId='+$id.val(),'','height=600,width=600,,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${ctx}/sys/datadeta/create.do','','height=600,width=600,,location=no,scrollbars');
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
			$('#projName').val('');
			$('#sn').val('');
			$('#datatypeId').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/sys/datadeta/delete.do", {"items":ids.join(',')}, 
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


