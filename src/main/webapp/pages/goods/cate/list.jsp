<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><%=GoodsCatMo.TABLE_ALIAS%> 维护</title>
    <script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/joy.js"></script>
    <link type="text/css" rel="stylesheet" href="${ctx}/css/common/joyManagerSystem.css"/>
    <script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/zTree/jquery.ztree.all-3.1.js"></script>
    <link rel="stylesheet" href="${ctx}/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <style type="text/css">
        .ztree li button.add {
            margin-left:2px;
            margin-right: -1px;
            background-position:-144px 0;
            vertical-align:top;
            *vertical-align:middle;
        }
    </style>
</head>
<body>
<div class="title01">
    <h2>商品类目维护<span class="zksq"></span></h2>
</div>

<br/>
<table border=0 height=600px align=left width="100%" class="table00">
    <tr>
        <td width=270px align=left valign=top style="BORDER-RIGHT: #999999 1px dashed" height="680px">
            <ul id="treeDemo" class="ztree" style="width:270px; overflow:auto;"></ul>
        </td>
        <td align=left valign=top>
            <div id="deptDiv" class="right">
                <form name="goodsCatForm" id="goodsCatForm" action="${ctx}/goods/cate/saveOrUpdate.do" method="post" >
                    <input type="hidden" id="goodscatId" name="id" value="" />
                    <input type="hidden" id="optType" name="optType" value="" />
                    <table class="formTable">
                        <tr>
                            <th style="width: 101px" class="th_r"><b>*</b>类目名称：</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <input id="name" name="name" type="text" style="width: 200px" onfocus="changeMemo(this, 12, 'catname_totalCount')" onblur="cleanHtml(this, 12, 'catname_totalCount')" onKeyUp="changeMemo(this,12,'catname_totalCount');"/>
                                        <span class="tempInfo"></span><span class="prompt"><span id="catname_totalCount" style="color: #f00;"></span></span>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th style="width: 101px" class="th_r">类目编码：</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <input id="catCode" name="catCode" type="text" style="width: 200px" readonly="readonly" />
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th style="width: 101px" class="th_r">类目排序：</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <input id="catOrder" name="catOrder" type="text" style="width: 200px" onfocus="changeMemo(this, 8, 'catOrder_totalCount')" onblur="cleanHtml(this, 8, 'catOrder_totalCount')" onKeyUp="changeMemo(this,8,'catOrder_totalCount');"/>
                                        <span class="tempInfo"></span><span class="prompt"><span id="catOrder_totalCount" style="color: #f00;"></span></span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 101px" class="th_r">显示控制：</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <label><input type="radio" id="display0" name="catShow" value="0" />首页隐藏</label>
                                        <label><input type="radio" id="display1" name="catShow" value="1" />首页显示</label>
                                        <label><input type="radio" id="display2" name="catShow" value="2" />全局隐藏</label>
                                        <span class="tempInfo"></span>
                                    </div>
                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th style="width: 101px" class="th_r">父类目：</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <input type="hidden" id="parentId" name="parentId" readonly="readonly" />
                                        <input id="parendName" name="parendName" type="text" style="width: 200px" readonly="readonly" />
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th style="width: 101px">&nbsp;</th>
                            <td>
                                <div class="clearfix">
                                    <div class="input" style="float:left;">
                                        <input type="button" id="deptSubBtn" value="提 交" onclick="javascript:formSubmit()" name="Button4" class="base_btns6">
                                        <input type="button" id="deptRollBackBtn" value="回 滚" onclick="javascript:formRollBack()" name="Button4" class="base_btns6">
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </td>
    </tr>
</table>



<!-- 类目树的代码放到当前页面，在被包含页时在IE6下会报错。 -->
<style type="text/css">
    .ztree li span.button.add {margin-left:2px; margin-right: -1px; background-position:-144px 0; vertical-align:top; *vertical-align:middle}
</style>
<script type="text/javascript">
    var isShow = false;
    var dragId;
    var setting = {
        /*async: {
         enable: true,
         url:"${ctx}/goods/cate/getGoodsCatList.html",
         autoParam:["id"],
         dataFilter: filter
         },*/
        view: {
            expandSpeed:"",
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: false
        },
        data: {
            simpleData: {enable: true}
        },
        edit: {
            enable: true,
            removeTitle: "删除类目",
            renameTitle: "修改类目",
            drag:{isMove:false}
        },
        callback: {
            onClick: onClick,
            beforeRemove: beforeRemove,
            beforeDrag: beforeDrag,
            beforeDrop: beforeDrop,
            beforeEditName: beforeEditName
        }
    };

    $(function(){
        var t = new Date().getTime();
        $.getJSON("${ctx}/goods/cate/ajaxAllGoodsCatList.do",{t:t},function(data){
            $.fn.zTree.init($("#treeDemo"), setting, data);
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            var nodes = zTree.getSelectedNodes();
            if (nodes.length>0) {
                zTree.expandNode(nodes[0], true, false, true);
            }
            var nodes = zTree.transformToArray(zTree.getNodes());
            for(var i =0;i<nodes.length;i++){
                if(nodes[i].pubFlag == 0){
                    nodes[i].icon = "${ctx}/css/zTreeStyle/img/icongreen.png";
                    zTree.updateNode(nodes[i]);
                }
            }
        });
    });

    function beforeDrag(treeId, treeNodes) {
        for ( var i = 0, l = treeNodes.length; i < l; i++) {
            dragId = treeNodes[i].pid;
            if (treeNodes[i].drag === false) {
                return false;
            }
        }
        return true;

    }

    function beforeDrop(treeId, treeNodes, targetNode, moveType) {
        if(targetNode.pid != treeNodes[0].pid || moveType=="inner") {
            alert("只能同级进行拖拽!");
            return false;
        }

        var targetId=targetNode.id;
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var newOrderNum=0;
        var oldNum = zTree.getNodeIndex(treeNodes[0]);
        targetId=targetNode.pid;
        newOrderNum=zTree.getNodeIndex(targetNode);
        if(targetNode.pid == treeNodes[0].pid){
            if( moveType=="next" && oldNum >newOrderNum){
                newOrderNum=newOrderNum+1;
            }else if(moveType=="prev" && oldNum < newOrderNum){
                newOrderNum = newOrderNum-1;
            }
        }

        $.ajax({
            type : "POST",
            url : "${ctx}/goods/cate/moveNode.do",
            data : {
                "id" : treeNodes[0].id,
                "parentFuncId" : targetNode.pid,
                "position" : newOrderNum
            },
            async : false,
            success : function(data) {
                if (data == '1') {
                    var zTree = $.fn.zTree.getZTreeObj("treeDemo");
                    var nodes = zTree.getSelectedNodes();
                    zTree.reAsyncChildNodes(nodes[0].getParentNode(), "refresh");
                }else{
                    alert("移动失败");
                    zTree.reAsyncChildNodes(nodes[0].getParentNode(), "refresh");
                }

            }
        });
    }

    function filter(treeId, parentNode, childNodes) {
        if (!childNodes) return null;
        for (var i=0, l=childNodes.length; i<l; i++) {
            childNodes[i].name = childNodes[i].name.replace(/\.n/g, '.');
            if(childNodes[i].pubFlag == 0){
                childNodes[i].icon = "${ctx}/css/zTreeStyle/img/icongreen.png";
            }
        }
        return childNodes;
    }

    // 鼠标移动到树节点的事件
    function addHoverDom(treeId, treeNode) {
    	var sObj = $("#" + treeNode.tId + "_span");
    	if($("button[name='addbtn']").size()==0){
    		$(sObj).after('<button name="addbtn" id="treeDemo_'+treeNode.id+'_add" class="add" type="button"></button>');
    	}
        var btn = $("#treeDemo_" + treeNode.id+"_add");
        btn.unbind('click');  
         if (btn) btn.eq(0).bind("click", function(){
            $.post("${ctx}/goods/cate/getGoodsCatCode.do",{pid:treeNode.id},
                    function(data){
                        var result = eval("(" + data + ")");
                        if(result.resMsg == "pidnull"){
                            alert("所属类目不能为空！"); return false;
                        }else if(result.resMsg == "notexist"){
                            alert("所属类目不存在！"); return false;
                        }else{
                            $("#optType").val("save");
                            $("#goodsCatForm").attr("action", "${ctx}/goods/cate/saveOrUpdate.do");
                            $("#goodscatId").val("");
                            $("#name").val("");

                            $("#name").next("span.tempInfo").html("");
                            $("#catOrder").next("span.tempInfo").html("");
                            $(":radio[name=catShow]").parent("label").next("span.tempInfo").html("");

                            $("#catOrder").val(result.catOrder);
                            $("#catCode").val(result.catCode);
                            $("#parendName").val(treeNode.name);
                            $("#parentId").val(treeNode.id);
                            $("#deptRollBackBtn").show();

                            $(":radio[name=catShow]").removeAttr("checked").attr("disabled","disabled");
                            $(":radio[name=catShow][value=2]").attr("checked","checked").removeAttr("disabled");

                            $("#deptSubBtn").removeAttr("disabled");
                            $("#deptEditDiv").css({visibility:"visible"});
                            $("#deptRollBackBtn").hide();
                            if(!isShow){
                                $("#deptEditDiv .member_mainnav").css("position","relative").css("left","100px").css("opacity",0);
                                $("#deptEditDiv .member_mainnav").animate({left:'0',opacity:1},"fast");
                                isShow = true;
                            }
                        }
                    }
            );
            return false;
        }); 
    };

    // 鼠标移出树节点事件。
    function removeHoverDom(treeId, treeNode) {
    	$("#treeDemo_"+treeNode.id+"_add").unbind().remove();
    };

    // 点击删除图标时的事件处理。
    function beforeRemove(treeId, treeNode){
        if(treeNode.id == "-1"){
            alert("不能删除顶级菜单");
            return false;
        }
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.selectNode(treeNode);
        if(confirm("确定要删除类目\"" + treeNode.name + "\"吗？")){
            $.ajax({
                type: "post",
                url: "${ctx}/goods/cate/removeGoodsCatById.do",
                data: {id:treeNode.id},
                dataType: "text",
                success: function(data){
                    if(data == "idnull"){
                        alert("类目ID不能为空！");
                        return false;
                    }else if(data == "goodsnull"){
                        alert("要删除的类目不存在！");
                        return false;
                    }else if(data == "subgoods"){
                        alert("该类目下有子类目,请先删除子类目！");
                        return false;
                    }else if(data == "success"){
                        alert("类目删除成功");
                        zTree.removeNode(treeNode);
                        $("#deptEditDiv").css({visibility:"hidden"});
                    }
                }
            });
        }
        return false;
    }

    function beforeEditName(treeId, treeNode){
        if(treeNode.id == "-1"){
            alert("不能修改顶级菜单");
            return false;
        }
        loadEditCatForm(treeNode);
        return false;
    }

    function loadEditCatForm(treeNode){
        $.ajax({
            type: "post",
            url: "${ctx}/goods/cate/getGoodsCatInfo.do",
            data: {id:treeNode.id},
            dataType: "text",
            success: function(data){
                if(data == "idnull"){
                    alert("类目ID不能为空！"); return false;
                }else if(data == "goodsnull"){
                    alert("要修改的类目不存在！"); return false;
                }else{
                    var result = eval("(" + data + ")");
                    $("#goodsCatForm").attr("action", "${ctx}/goods/cate/saveOrUpdate.do");
                    $("#goodscatId").val(result.id);

                    $("#catCode").val(result.catCode);

                    if(result.pubFlag == 0){
                        $("#name").val(result.newName);
                        $("#catOrder").val(result.newOrder);
                        $(":radio[name=catShow]").removeAttr("checked").removeAttr("disabled").eq(result.newShow).attr('checked', 'checked');

                        $("#name").next("span.tempInfo").html("<--&nbsp;"+result.name);
                        $("#catOrder").next("span.tempInfo").html("<--&nbsp;"+result.catOrder);
                        var newShowStr = '';
                        switch (result.catShow){
                            case 0:
                                newShowStr = '首页隐藏 ';
                                break;
                            case 1:
                                newShowStr = '首页显示 ';
                                break;
                            case 2:
                                newShowStr = '全局隐藏 ';
                                break;
                        }
                        $(":radio[name=catShow]").parent("label").next("span.tempInfo").html("<--&nbsp;"+newShowStr);
                        $("#deptRollBackBtn").show();
                    }else{
                        $("#name").val(result.name);
                        $("#catOrder").val(result.catOrder);
                        $(":radio[name=catShow]").removeAttr("checked").removeAttr("disabled").eq(result.catShow).attr('checked', 'checked');

                        $("#name").next("span.tempInfo").html("");
                        $("#catOrder").next("span.tempInfo").html("");
                        $(":radio[name=catShow]").parent("label").next("span.tempInfo").html("");
                        $(":radio[name=catShow]").removeAttr("checked").removeAttr("disabled").eq(result.catShow).attr('checked', 'checked');
                        $("#deptRollBackBtn").hide();
                    }


                    $("#parendName").val(treeNode.getParentNode().name);
                    $("#parentId").val(result.parentId);
                    $("#deptSubBtn").removeAttr("disabled");
                    $("#deptEditDiv").css({visibility:"visible"});
                    if(!isShow){
                        $("#deptEditDiv .member_mainnav").css("position","relative").css("left","150px").css("opacity",0);
                        $("#deptEditDiv .member_mainnav").animate({left:'0',opacity:1},"fast");
                        isShow = true;
                    }
                    return false;
                }
            }
        });


    }


    function onRename(e, treeId, treeNode){
        if(treeNode.id == "-1"){
            alert("不能修改顶级菜单");
            return false;
        }
        return false;
    }

    // 类目维护form的提交事件。
    function formSubmit(){
        var name = $("#name").val();
        if(name == null || name == ""){
            $("#catname_totalCount").html("类目名称不能为空");
            return false;
        }

        var catOrder = $("#catOrder").val();
        if(catOrder == null || catOrder == ""){
            $("#catOrder_totalCount").html("排序不能为空");
            return false;
        }

        var regExp = /^[1-9]\d*$/;
        if (!regExp.exec(catOrder)) {
            $("#catOrder_totalCount").html("排序必须是数字");
            return false;
        }

        $.post("${ctx}/goods/cate/saveOrUpdate.do", $("#goodsCatForm").serialize(), function(data){
        	
            var result = eval("(" + data + ")");
            console.log(result);
            if(result.resMsg != "success"){
                alert(result.resMsg);
                return;
            }
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            var optType = result.optType;
            if(optType == "save"){
                var id = result.id;
                var name = $("#name").val();
                var nodes = zTree.getNodesByParam("id", result.pid);
                var catLevel = nodes[0].catLevel+1;
                var newNodes = {id:id,name:name,pid:result.pid,catLevel:catLevel};
                zTree.addNodes(nodes[0],newNodes);
                //zTree.reAsyncChildNodes(nodes[0], "refresh");
                alert("类目添加成功！");
                $("#parendName").val(result.parendName);
                $("#parentId").val(result.pid);
                //添加成功之后重新获取相应的类目编码信息
                
                $.post("${ctx}/goods/cate/getGoodsCatCode.do",{pid:result.pid},
                        function(data){
                            var result_fun = eval("(" + data + ")");
                            if(result_fun.resMsg == "pidnull"){
                                alert("所属类目不能为空！"); return false;
                            }else if(result_fun.resMsg == "notexist"){
                                alert("所属类目不存在！"); return false;
                            }else{
                                $("#optType").val("save");
                                $("#goodsCatForm").attr("action", "${ctx}/goods/cate/saveOrUpdate.do");
                                $("#goodscatId").val("");
                                $("#name").val("");

                                $("#name").next("span.tempInfo").html("");
                                $("#catOrder").next("span.tempInfo").html("");
                                $(":radio[name=catShow]").parent("label").next("span.tempInfo").html("");

                                $("#catOrder").val(result_fun.catOrder);
                                $("#catCode").val(result_fun.catCode);
                                $("#deptRollBackBtn").show();

                                $(":radio[name=catShow]").removeAttr("checked").attr("disabled","disabled");
                                $(":radio[name=catShow][value=2]").attr("checked","checked").removeAttr("disabled");

                                $("#deptSubBtn").removeAttr("disabled");
                                $("#deptEditDiv").css({visibility:"visible"});
                                $("#deptRollBackBtn").hide();
                                if(!isShow){
                                    $("#deptEditDiv .member_mainnav").css("position","relative").css("left","100px").css("opacity",0);
                                    $("#deptEditDiv .member_mainnav").animate({left:'0',opacity:1},"fast");
                                    isShow = true;
                                }
                            }
                        }
                );

            }else if(optType == "update"){
                var nodes = zTree.getNodesByParam("id", result.id);
                alert("类目维护成功！");
                //zTree.reAsyncChildNodes(nodes[0].getParentNode(), "refresh");
                loadEditCatForm(nodes[0]);//刷新修改form
                //nodes[0].name = $("#name").val();
                nodes[0].icon = "${ctx}/css/zTreeStyle/img/icongreen.png";
                nodes[0].pubFlag = '0';
                zTree.updateNode(nodes[0]);
            }

        });
    }

    function formRollBack(){
        var goodsCatId = $('#goodscatId').val();
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        var nodes = zTree.getNodesByParam("id", goodsCatId);
        $.ajax({
            type: "post",
            url: "${ctx}/goods/cate/ajaxRollBackTempInfo.do",
            data: {id: nodes[0].id},
            dataType: "text",
            success: function(data){
                alert('回滚成功');
                loadEditCatForm(nodes[0]);
                nodes[0].icon = "";
                nodes[0].pubFlag = '1';
                zTree.updateNode(nodes[0]);
            }
        });
    }

    $("#expandTempNode").click(function(){
        var zTree = $.fn.zTree.getZTreeObj("treeDemo");
        zTree.expandAll(false);
        var nodes = zTree.transformToArray(zTree.getNodes());
        for(var i =0;i<nodes.length;i++){
            if(nodes[i].pubFlag == 0){
                zTree.expandNode(nodes[i].getParentNode(), true, false, true);
            }
        }
    });

    function onClick(event, treeId, treeNode, clickFlag) {
        $("#deptEditDiv").css({visibility:"hidden"});
    };

    $(function () {
        var ie6 = $.browser.msie && ($.browser.version == "6.0") && !$.support.style;
        var dv = $('#fixDiv'), st,iLeft = dv.offset().left;
        dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离
        $(window).scroll(function () {
            st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if (st > parseInt(dv.attr('otop'))) {
                if (ie6) {//IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果
                    dv.css({ position: 'absolute', top: st-120 ,left : iLeft-210 });
                }
                else if (dv.css('position') != 'fixed') dv.css({ 'position': 'fixed', top: 0,left :iLeft });
            } else if (dv.css('position') != 'static') dv.css({ 'position': 'static' });
        });
    });
</script>

</body>
</html>


