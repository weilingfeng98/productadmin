<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page import="com.ny.b2b.user.model.UserInfoMo" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=UserInfoMo.TABLE_ALIAS%> 维护</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
	<link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="title01">
	<h2>搜索<span class="zksq"><!-- <a href="" title="收起展开"><img alt="展开收起按钮" height="7" src="${ctx}/images/zksq.png" width="13" /></a> --></span></h2>
</div>
<form id="queryForm" name="queryForm" action="<c:url value="/sys/user/list.do"/>" method="post" style="display: inline;">
	<input type="hidden" id="pageNumber" name="pageNumber" value="<c:out value="${pageNumber}" default="1"/>"/>
	<input type="hidden" id="pageSize" name="pageSize" value="<c:out value="${pageSize}" default="10"/>"/>
	<input type="hidden" id="queryType" name="queryType" value="<c:out value="${queryType}" default="0"/>"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table00">
		<tr>	
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_USER_NAME%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${userName}"/>" id="userName" name="userName" maxlength="30"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_REAL_NAME%>：</td>
			<td>
				&nbsp;<input value="<c:out value="${realName}"/>" id="realName" name="realName" maxlength="20"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_EMP_NO%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${empNo}"/>" id="empNo" name="empNo" maxlength="10"/>
			</td>
            <td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_SEX%>：</td>
            <td>
                &nbsp;<select name="sex" id="sex">
                <option value="">请选择</option>
                <option value="1">男</option>
                <option value="2">女</option>
            </select>
            </td>
		</tr>	
		<tr>	
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_MOBILE%>：</td>
			<td>
				&nbsp;<input value="<c:out value="${mobile}"/>" id="mobile" name="mobile" maxlength="20"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_EMAIL%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${email}"/>" id="email" name="email" maxlength="50"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_JOB%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${job}"/>" id="job" name="job" maxlength="30"/>
			</td>
		</tr>	
		<tr>	
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_DEPT_ID%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${deptId}"/>" id="deptId" name="deptId" maxlength="32"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_DEPT_CODE%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${deptCode}"/>" id="deptCode" name="deptCode" maxlength="50"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_IS_ADMIN%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${isAdmin}"/>" id="isAdmin" name="isAdmin" maxlength="1"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_ROLE_ID%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${roleId}"/>" id="roleId" name="roleId" maxlength="30"/>
			</td>
		</tr>	
		<tr>	
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_STATUS%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${status}"/>" id="status" name="status" maxlength="8"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_DEL_FLAG%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${delFlag}"/>" id="delFlag" name="delFlag" maxlength="1"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_CREATOR%>：</td>		
			<td>
				&nbsp;<input value="<c:out value="${creator}"/>" id="creator" name="creator" maxlength="32"/>
			</td>
			<td class="txtr" style="width: 100px"><%=UserInfoMo.ALIAS_INSERT_TIME%>：</td>		
			<td>
				&nbsp;<input onClick="WdatePicker()" value="<c:out value="${insertTimeBegin}"/>" id="insertTimeBegin" name="insertTimeBegin" size="10"/>
				<input onClick="WdatePicker()" value="<c:out value="${insertTimeEnd}"/>" id="insertTimeEnd" name="insertTimeEnd" size="10"/>
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
	<br></br>
	<div class="title01">
	<h2><%=UserInfoMo.TABLE_ALIAS%>列表</h2>
</div>
		<div class="groupbtn">
			<joy:security url="/sys/user/create.do">
			<a href="javascript:void(0)" title="新建" class="btn001" id="btnadd">新增</a>
			</joy:security>
			<joy:security url="/sys/user/update.do">
			<a href="javascript:void(0)" title="修改" class="btn002" id="btnedit">修改</a>
			</joy:security>
			<joy:security url="/sys/user/delete.do">
			<a href="javascript:void(0)" title="删除"  class="btn004" id="btndelete">删除</a>
			</joy:security>
		</div>
		<div>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="tb" class="table02">
			<thead>
			 <tr>
			 	<th><input id="allChoose" type="checkbox"/></th>
			 	<th>序号<div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_USER_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_REAL_NAME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_EMP_NO%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_SEX%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_MOBILE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_EMAIL%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_JOB%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_DEPT_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_DEPT_CODE%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_IS_ADMIN%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_ROLE_ID%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_STATUS%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_DEL_FLAG%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_CREATOR%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_INSERT_TIME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_UPDATOR%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
				<th><%=UserInfoMo.ALIAS_UPDATE_TIME%><div style="width: 65px; height: 1px; overflow: hidden;"></div></th>
			    <th>操作<div style="width: 75px; height: 1px; overflow: hidden;"></div></th>
	        </tr>
	        </thead>
			<c:forEach var="entry" items="${page.result}" varStatus="v">
			<tr>
				<td><input name="ids" type="checkbox" value="${entry.id}"/></td>
				<td>${v.index + 1 }</td>
				<td>
				<div><c:out value="${entry.userName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.realName}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.empNo}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.sex}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.mobile}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.email}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.job}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.deptId}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.deptCode}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.isAdmin}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.roleId}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.status}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.delFlag}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.creator}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.insertTimeString}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.updator}"/></div>
				</td>
				<td>
				<div><c:out value="${entry.updateTimeString}"/></div>
				</td>
				<td>
					<joy:security url="/sys/user/show.do">
						<a href="#" onclick="show('${entry.id}')">详情</a>
				    </joy:security>&nbsp;
					<joy:security url="/sys/user/update.do">
						<a href="#" onclick="edit('${entry.id}')">修改</a>
				    </joy:security>&nbsp;
					<joy:security url="/sys/user/delete.do">
						<a href="#" onclick="del('${entry.id}')">删除</a>
				    </joy:security>&nbsp;
				</td>
			</tr>
			</c:forEach>
			</table>
     	 <joy:page url="${ctx}/sys/user/list.do" id="logForm" submitForm="queryForm" joy="true"/>
</div>

<script type="text/javascript">
function show(id){
	window.open('${ctx}/sys/user/show.do?id='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}
function edit(id){
	window.open('${ctx}/sys/user/edit.do?id='+id,'','height=600,width=600,resizable=yes,location=no,scrollbars');
}

$(function(){
	
	$('#btnedit').click(function(){
		var $id = $('[name=ids]:checkbox:checked');
		
		if($id.length==0){
			alert("请选择要修改的信息！");
			return false;
		}
		window.open('${ctx}/sys/user/edit.do?id='+$id.val(),'','height=600,width=600,resizable=yes,location=no,scrollbars');
	});
	
	$('#btnadd').click(function(){
		window.open('${ctx}/sys/user/create.do','','height=600,width=600,resizable=yes,location=no,scrollbars');
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
			$('#userName').val('');
			$('#pwd').val('');
			$('#realName').val('');
			$('#empNo').val('');
			$('#sex').val('');
			$('#mobile').val('');
			$('#email').val('');
			$('#job').val('');
			$('#deptId').val('');
			$('#deptCode').val('');
			$('#isAdmin').val('');
			$('#roleId').val('');
			$('#status').val('');
			$('#delFlag').val('');
			$('#creator').val('');
			$('#insertTimeBegin').val('');
			$('#insertTimeEnd').val('');
			$('#updator').val('');
			$('#updateTimeBegin').val('');
			$('#updateTimeEnd').val('');
	});
});

function del(id){
	var ids = [];
	ids.push(id);
	v_deleteItems(ids);
}

function v_deleteItems(ids){
	if(ids.length>0 && confirm("确定要删除吗？")){
		$.post( "${ctx}/sys/user/delete.do", {"items":ids.join(',')}, 
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


