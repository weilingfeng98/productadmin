<%@ page import="com.ny.b2b.sys.model.TsysConfigMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=TsysConfigMo.TABLE_ALIAS%> 维护</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${ctx}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/sys/config/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_KEY_NAME%>：</td>		
			<td width="200px">
				&nbsp;<input value="<c:out value="${keyName}"/>" id="keyName" name="keyName" maxlength="255"/>
			</td>
			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_VALUE%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${value}"/>" id="value" name="value" maxlength="1000"/>
			</td>
		</tr>
		<tr>
			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_MEMO%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${memo}"/>" id="memo" name="memo" maxlength="500"/>
			</td>
<%-- 			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_SN%>：</td>		 --%>
<!-- 			<td> -->
<%-- 				&nbsp;<input value="<c:out value="${sn}"/>" id="sn" name="sn" maxlength="10"/> --%>
<!-- 			</td> -->
			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_ENABLED%>：</td>		
			<td>
<%-- 				&nbsp;<input value="<c:out value="${enabled}"/>" id="enabled" name="enabled" maxlength="1"/> --%>
			<select name="enabled" id="enabled">
				       <option value="">请选择...</option>
				        <option value="y" <c:if test="${enabled == 'y'}">selected="selected"</c:if> >启用</option>
				        <option value="n" <c:if test="${enabled == 'n'}">selected="selected"</c:if> >禁用</option>
		    </select>
			</td>
		</tr>	
		<tr>	


<%-- 			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_TYPE%>：</td>		 --%>
<!-- 			<td> -->
<%-- 				&nbsp;<input value="<c:out value="${type}"/>" id="type" name="type" maxlength="10"/> --%>
<!-- 				 <select name="type" id="type"> -->
<!-- 				       <option value="">请选择...</option> -->
<%-- 				        <option value="json" <c:if test="${type == 'json'}">selected="selected"</c:if> >JSON</option> --%>
<%-- 				        <option value="NUMBER" <c:if test="${type == 'NUMBER'}">selected="selected"</c:if> >数字</option> --%>
<%-- 				        <option value="STRING" <c:if test="${type == 'STRING'}">selected="selected"</c:if> >字符串</option>			      --%>
<!-- 				 </select> -->
<!-- 			</td> -->
			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_MODULE%>：</td>		
			<td>
				<select name="module" id="module">
			       <option value="">请选择...</option>
			        <option value="ALL" <c:if test="${module == 'ALL'}">selected="selected"</c:if> >系统</option>
			        <option value="HOTEL" <c:if test="${module == 'HOTEL'}">selected="selected"</c:if> >酒店</option>
			        <option value="GOODS" <c:if test="${module == 'GOODS'}">selected="selected"</c:if> >集采</option>			     
				    <option value="FLIGHT" <c:if test="${module == 'FLIGHT'}">selected="selected"</c:if> >机票</option>
			    </select>
			</td>
<%-- 			<td class="txtr" style="width: 100px"><%=TsysConfigMo.ALIAS_APP%>：</td>		 --%>
<!-- 			<td> -->
<%-- 				&nbsp;<input value="<c:out value="${app}"/>" id="app" name="app" maxlength="100"/> --%>
<!-- 			</td> -->
		</tr>	
	</table>
	<br/>
	<div align="center">
		<input type="submit" class="btn01" value="精确查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('0');"/>
		<input type="submit" class="btn01" value="模糊查询" onclick="$('#pageNumber').val('1');$('#pageSize').val('10');$('#queryType').val('1');"/>
		<input type="button" class="btn01" value="清 空" id="btnclear"/>
	</div>
</form>
	<br></br>
	<div class="title01">
	<h2><%=TsysConfigMo.TABLE_ALIAS%>列表</h2>
</div>
		<div class="groupbtn">
			<joy:security url="/sys/config/show.do">
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnshow">
			查看</a>
			</joy:security>
			<joy:security url="/sys/config/create.do">
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnadd">
			新增</a>
			</joy:security>
			<joy:security url="/sys/config/update.do">
			<a href="javascript:void(0)" title="修改" class="btn002" id="btnedit">
			修改</a>
			</joy:security>
			<joy:security url="/sys/config/delete.do">
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">
			删除</a>
			</joy:security>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TsysConfigMo.ALIAS_KEY_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
<%-- 				<th><%=TsysConfigMo.ALIAS_TYPE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th> --%>
				<th><%=TsysConfigMo.ALIAS_VALUE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TsysConfigMo.ALIAS_MEMO%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
<%-- 				<th><%=TsysConfigMo.ALIAS_SN%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th> --%>
				<th><%=TsysConfigMo.ALIAS_ENABLED%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=TsysConfigMo.ALIAS_MODULE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
<%-- 				<th><%=TsysConfigMo.ALIAS_APP%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th> --%>
<!-- 			<th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th> -->
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.id}"/></td>
				<td>${v.index + 1 }</td>
				
				<td>
				<div><c:out value="${entry.keyName}"/></div>
				</td>
				
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.type}"/></div> --%>
<!-- 				</td> -->
				
				<td align="left">
				<div title="${entry.value}">${fn:substring(entry.value, 0, 50) }</div>
				</td>
				
				<td>
				<div><c:out value="${entry.memo}"/></div>
				</td>
				
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.sn}"/></div> --%>
<!-- 				</td> -->
				
				<td>
				<c:if test="${entry.enabled eq 'n'}">
				<div>禁用</div>
				</c:if>
				<c:if test="${entry.enabled eq 'y'}">
				<div>启用</div>
				</c:if>
				</td>
				
				<td>
				<c:if test="${entry.module == 'ALL'}">
				系统
				</c:if>
				<c:if test="${entry.module == 'HOTEL'}">
				酒店
				</c:if>
				<c:if test="${entry.module == 'GOODS'}">
				集采
				</c:if>
				<c:if test="${entry.module == 'FLIGHT'}">
				机票
				</c:if>
				</td>
				
<!-- 				<td> -->
<%-- 				<div><c:out value="${entry.app}"/></div> --%>
<!-- 				</td> -->
				
<!-- 			<td> -->
<%-- 			<joy:security url="/sys/config/show.do"> --%>
<%-- 			<a href="#" onclick="show('${entry.id}')">详情</a> --%>
<%-- 			</joy:security>&nbsp; --%>
<%-- 			<joy:security url="/sys/config/update.do"> --%>
<%-- 			<a href="#" onclick="edit('${entry.id}')">修改</a> --%>
<%-- 			</joy:security>&nbsp; --%>
<%-- 			<joy:security url="/sys/config/delete.do"> --%>
<%-- 			<a href="#" onclick="del('${entry.id}')">删除</a> --%>
<%-- 			</joy:security>&nbsp;</td> --%>
			</tr>
			</c:forEach>
			</table>
     	 <joy:page url="${ctx}/sys/config/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${ctx}/sys/config/show.do?id='+id,'','height=600,width=500,,location=no,scrollbars');
}
function edit(id){
	window.open('${ctx}/sys/config/edit.do?id='+id,'','height=600,width=500,location=no,scrollbars');
}

function del(id){
	var ids = [];
	ids.push(id);
	if(confirm("确定要删除吗？")){
	$.post( "${ctx}/sys/config/delete.do", {"items":ids.join(',')}, 
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
		window.open('${ctx}/sys/config/edit.do?id='+$id.val(),'','height=600,width=700,,location=no,scrollbars');
	});
	
	$('#btnshow').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要查看的信息！");
			return false;
		}
		window.open('${ctx}/sys/config/show.do?id='+$id.val(),'','height=600,width=700,,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${ctx}/sys/config/create.do','','height=600,width=700,,location=no,scrollbars');
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
			$('#keyName').val('');
			$('#type').val('');
			$('#value').val('');
			$('#memo').val('');
			$('#sn').val('');
			$('#enabled').val('');
			$('#module').val('');
			$('#app').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/sys/config/delete.do", {"items":ids.join(',')}, 
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


