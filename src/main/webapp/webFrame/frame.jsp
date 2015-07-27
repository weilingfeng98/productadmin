<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctx}/css/common/joyManagerSystem.css" />
<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
<script type="text/javascript" src="${ctx}/scripts/dateUtils.js"></script>
<title>商旅后台管理平台-CRM客户管理系统</title>
<script type="text/javascript">
function quit(){
	window.location.href="${ctx}/home/logout.do";
}
</script>
</head>

<body style="background-color: #2281B3;">
<div class="header">
	<div class="logo">
		<img alt="joy电子商务网后台管理系统logo" height="74" longdesc="joy电子商务网后台管理系统logo" src="${ctx}/images/common/logo.png" width="580" /></div>
	<div class="userarea">
		<div>
			<span id="hourZone"></span>好，<span class="user">${sessionScope.USERNAME }</span>，欢迎你！</div>
		<div class="gggn">
			<a class="password mr20" id="resetPwd">修改密码</a><a class="quit" href="#" onclick="quit();">安全退出</a></div>
	</div>
</div>
<div id="mainbody">
	<div id="leftmenu">
		<div class="panel-title">
			<span class="layout-button-hidden"></span><span id="dh">导航菜单</span>
		</div>
		<div id="switchBar"><img src="${ctx}/images/common/layout-button-show.gif" alt="展开" height="17" width="19" /></div>
		<div class="panel-body"><iframe id="frame_menu" frameborder="0" scrolling="yes" src="${ctx}/webFrame/left.jsp" target="_blank"></iframe></div>
	</div>
	<div id="rightContainer">
		<div class="tab-wrap" style="height:30px;overflow: hidden;">
			<ul class="tab-list clearfix" id="toptabs">
				<li class="tabs-selected" style="width:80px"><span id=yeqian_content onclick='javascript:iframehide("content");'>欢迎页</span></li>
			</ul>
		</div>
		<div id="iframCreater">
			<iframe id="frame_content" frameborder="0" scrolling="auto" src="${ctx}/webFrame/main.jsp" target="_blank"></iframe>
		</div>
	</div>
</div>
<div class="footer">
	<div class="version">
		商品运营系统管理平台V1.0版本</div>
	<div class="date">
		当前日期：<span id="currDateShow"></span></div>
	<div class="brower">
		（推荐浏览配置：IE7.0+ 1280x800）</div>
</div>
<script type="text/javascript">
$(function(){
	$("#resetPwd").click(function(){
		window.open('${ctx}/sys/user/toResetPwd.do','','height=500,width=500,resizable=yes,location=no,scrollbars');
	});
});


//重置窗口内容
var iframe_h = 800;
var iframe_w = 1024;
var tabs_w = $("#toptabs").width() - 300; //页签条总宽度

function resetContent(){
	setWindowSize();
	if(iframe_h>0 && iframe_w>0){
		document.getElementById('frame_menu').style.height = (iframe_h-145 )+ "px";
		document.getElementById('frame_content').style.height = (iframe_h-150 )+ "px";
		document.getElementById('frame_content').style.width = (iframe_w*1-203)+ "px";
	}else{
	 	window.setInterval("resetContent()", 203);
	}
	//窗口大小变化时，重新设置mainframe宽度
	var iw = 0;
	if($("#switchBar").css('visibility')!='hidden') iw = 203;
	else iwh = 40;
	resetMainFrameWidth(150,iw);
}

//窗口尺寸
function setWindowSize(){
	var window_h=document.documentElement.clientHeight;
	var window_w=document.documentElement.clientWidth;
	if(window_h==0 || window_w==0){
		window_h=document.body.clientHeight;
		window_w=document.body.clientWidth;
	}
	iframe_h = window_h;
	iframe_w = window_w;
}

window.onload=resetContent;
window.onresize=resetContent;

//点击左侧菜单中的树节点会调用此方法 
function treeClick(treeId, treeNode){
	var v = $("*").filter("li");  //原先按.tabs-selected获取
	var total_width = 50; //定义所有li宽度之和(初始值)
	var second_li = null; //取第2个li元素
	var second_id = 0; //第2个页签编号
	for(var i =0;i<v.length;i++){
		var n = v[i];
		if($(n).children("span").attr("id")=="yeqian_"+treeNode.id){//存在此页签时则显示当前点击的页签内容，隐藏其他
			iframehide(treeNode.id);
			break;
		}else if(i ==v.length-1 && $(n).children("span").attr("id")!="yeqian_"+treeNode.id){//创建页签和iframe 并显示当前内容隐藏其他
			$("#toptabs").append("<li class='tabs-selected'><span id=yeqian_"+treeNode.id+" onclick='javascript:iframehide(\""+treeNode.id+"\");'>"+treeNode.name+"</span><a class='close' href='javascript:closeWindow(\""+treeNode.id+"\");'><img alt='close' height='11' src='${ctx}/images/common/tab_close.png' width='11' /></a></li>");
			iframeadd(treeNode.srcurl,treeNode.id);
		}
		if(i==1){
			second_li = n;
			second_id = $(n).children("span").attr("id").substring(7);
		}
		if(i>0) total_width += ($(n).width() + 3 ); //每个li间隔宽度
	}
	//当超过页签总宽度时,移除第2个页签和对应的iframe
	if(total_width >= tabs_w){
		var remiframe = "frame_"+second_id;
		$("#"+remiframe).remove();
		$(second_li).remove();
	}
}
//创建页签所对应的iframe 并进行 高度等属性的设置 
function iframeadd (src,id){
	$("#iframCreater").append("<iframe id='frame_"+id+"' frameborder=0 scrolling='auto' src='"+src+"' target=_blank></iframe>");
	resetNewContent('frame_'+id);
	iframehide(id);
}
//手动创建tab页
function iframehandadd(name,src,id){
	var v = $("*").filter("li");  //原先按.tabs-selected获取
	for(var i =0;i<v.length;i++){
		var n = v[i];
		if($(n).children("span").attr("id")=="yeqian_"+id){//存在此页签时则显示当前点击的页签内容，隐藏其他
			iframehide(id);
			break;
		}else if(i ==v.length-1 && $(n).children("span").attr("id")!="yeqian_"+id){//创建页签和iframe 并显示当前内容隐藏其他
			$("#toptabs").append("<li class='tabs-selected'><span id=yeqian_"+id+" onclick='javascript:iframehide(\""+id+"\");'>"+name+"</span><a class='close' href='javascript:closeWindow(\""+id+"\");'><img alt='close' height='11' src='${ctx}/images/common/tab_close.png' width='11' /></a></li>");
			iframeadd(src,id);
		}
	}
}

//根据 ID 显示此iframe 并隐藏其他 的Iframe
function iframehide(id){
	var v = "frame_"+id;
	var f = $("iframe[id *= frame_][id!= frame_menu]");
	for(var i =0;i<f.length;i++){
		if(f[i].id==v){
			$(f[i]).show();
		}else{
			$(f[i]).hide();
		}
	}

	//遍历列表，对非当前选中页签置取消焦点设置
	var p = $("*").filter("li");
	for(var i =0;i<p.length;i++){
		var n = p[i];
		if($(n).children("span").attr("id")=="yeqian_"+id){//存在此页签时则激活页签，隐藏其他
			$(n).removeClass("un_tabs-selected");
			$(n).addClass("tabs-selected");
			//$(n).toggleClass("tabs-selected");
		}else{
			$(n).removeClass("tabs-selected");
			$(n).addClass("un_tabs-selected");
		}
	}
}

//根据 ID 关闭页签 并 关闭对应的iframe的方法
function closeWindow(id){
	var remiframe = "frame_"+id;
	$("#"+remiframe).remove();

	var v = $("*").filter("li"); //原先按.tabs-selected获取
	for(var i =0;i<v.length;i++){
		n = v[i];
		if($(n).children("span").attr("id")=="yeqian_"+id){
			$(n).remove();
			break;
		}
	}

	//删除到最后一个则显示欢迎页，其他的则显示最后一个页面信息
	if($("*").filter("li").length==1){  //$("*").filter(".tabs-selected").length==1
		iframehide("content");
	}else{
		//var l = $("*").filter(".tabs-selected").last();
		var l = $("*").filter("li").last();
		iframehide($(l).children("span").attr("id").split("_")[1]);
	}
}

//设置新设置的iframe的高度等属性
function resetNewContent(id){
	setWindowSize();
	if(iframe_h>0 && iframe_w>0){
		document.getElementById(id).style.height = (iframe_h-150 )+ "px";
		document.getElementById(id).style.width = (iframe_w*1-203)+ "px";
	}else{
	 	window.setInterval("resetNewContent(id)", 203);
	}
}

//初始化时隐藏展开图标
$(document).ready(function(){
	$("#switchBar").hide();
	$("#currDateShow").text(getCurDateStr());
	$("#hourZone").text(getCurHourZone());
});
//缩回图标可见时操作
if($(".layout-button-hidden").show()){
	setWindowSize();
	$(".layout-button-hidden").click(function(){
		$(".panel-title").hide();
		$(".panel-body").hide();
		$("#leftmenu").width(15);
		$("#switchBar").show();
		$('#switchBar').height(iframe_h-125);
		$('#frame_content').width(iframe_w*1-40);
		resetMainFrameWidth(150,40);
	});
}
//展开图标可见时的操作
if($("#switchBar").show()){
	setWindowSize();
	$("#switchBar").click(function(){
		$("#switchBar").hide();
		$("#leftmenu").width(175);
		$(".panel-title").show();
		$(".panel-body").show();
		$('#frame_content').width(iframe_w*1-203);
		resetMainFrameWidth(150,203);
	});
}

function resetMainFrameWidth(ih,iw){
	setWindowSize();
	var fi = $("#iframCreater iframe");
	for(var i =0;i<fi.length;i++){
		var nid = fi[i].id;
		if(nid != 'frame_menum' && nid != 'frame_content'){
			if(document.getElementById(nid)!=null){
				document.getElementById(nid).style.height = (iframe_h*1-ih )+ "px";
				document.getElementById(nid).style.width = (iframe_w*1-iw)+ "px";
			}
		}
	}
}
	
  </script>
</body>
</html>