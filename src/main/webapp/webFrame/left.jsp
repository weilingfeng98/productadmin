<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link rel="stylesheet" href="${ctx}/css/zTreeStyle/zTreeStyle.css" type="text/css">
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.all-3.1.js"></script>
	<title>左侧菜单</title>

<SCRIPT type="text/javascript">
		<!--
		var setting = {
			data: {
				simpleData: {
					enable:true,
					idKey: "id",
					pIdKey: "pid",
					rootPId: ""
				}
			},
			callback: {
				onClick: function(event, treeId, treeNode) {
					//alert(treeId+"----"+treeNode.id);
					if(!treeNode.isParent){
						window.parent.treeClick(treeId, treeNode);
					}
				}
			}
		};

		var zNodes =[
			{"id":1,  "name":"商品管理","pid":0},
            {"id":2,  "name":"商品列表","srcurl":"${ctx}/goods/info/list.do","pid":1},
            {"id":4,  "name":"商品分类","srcurl":"${ctx}/goods/cate/list.do","pid":1},
            {"id":5,  "name":"商品品牌","srcurl":"${ctx}/goods/brandinfo/list.do","pid":1},
            {"id":6,  "name":"供应商管理","pid":0},
            {"id":7,  "name":"供应商列表","srcurl":"${ctx}/goods/supplier/list.do","pid":6},

            {"id":9,  "name":"组织结构管理","pId":0},
            {"id":10,  "name":"用户列表","srcurl":"${ctx}/sys/user/list.do","pid":9},
            {"id":14,  "name":"部门列表","srcurl":"${ctx}/sys/queryUser.do","pid":9},
            {"id":15,  "name":"缓存管理","pid":0},
            {"id":16,  "name":"缓存配置","srcurl":"${ctx}/sys/cache/list.do","pid":15},
            {"id":18,  "name":"缓存管理","srcurl":"${ctx}/sys/cache/mlist.do","pid":15},
            {"id":11,  "name":"系统配置列表","srcurl":"${ctx}/sys/config/list.do","pid":15},
            {"id":19,  "name":"权限管理","pid":0},
            {"id":20,  "name":"权限列表","srcurl":"${ctx}/call/priviate.do","pid":19},
            {"id":21,  "name":"角色管理","srcurl":"${ctx}/call/priviate.do","pid":19},
            {"id":21,  "name":"权限分配","srcurl":"${ctx}/call/priviate.do","pid":19},
            {"id":25,  "name":"系统管理","pid":0},
            {"id":26,  "name":"标准数据","srcurl":"${ctx}/sys/datadeta/list.do","pid":25}

		];

		$(document).ready(function(){
			/*$.post("${ctx}/privilege/load.rls",function(data){
				if(data != null){
					var zNodes = eval(data);
					$.fn.zTree.init($("#treeDemo"), setting, zNodes);
				}
			});*/
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
		});
		//-->
	</SCRIPT>

</head>

<body style="background-color: #eef9ff; margin-left:0px; margin-top:0px">
<div class="content_wrap">
	<div class="zTreeDemoBackground left">
		<ul id="treeDemo" class="ztree"></ul>
	</div>
</div>
</body>
</html>

