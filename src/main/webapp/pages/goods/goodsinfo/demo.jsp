<%@ page import="com.ny.b2b.goods.model.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/commons/taglibs.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title><%=GoodsInfoMo.TABLE_ALIAS%>新增</title>
	<script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
	<script type="text/javascript" src="${ctx}/scripts/validform/Validform_v5.3.2_min.js"></script>
	<link href="${ctx}/css/validform/style.css" rel="stylesheet" type="text/css" />
	<link href="${ctx}/css/validform/demo.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="${ctx}/scripts/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div class="main">
    <div class="wraper">
        <p class="tr"><a href="demo.html" class="blue ml10 fz12">返回示例首页&raquo;</a></p>
        
    	<h2 class="green">智能的提示信息</h2>
        
        <form class="form1" action="ajax_post.php">
            <ul>
                <li>
                    <label class="label"><span class="need">*</span> 中文名：</label>
                    <input type="text" value="" name="name" datatype="zh2-4" class="inputxt" />
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 密码：</label>
                    <input type="password" value="" name="userpassword" datatype="n" class="inputxt" />
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 确认密码：</label>
                    <input type="password" value="" name="userpassword2" datatype="*6-20" class="inputxt" />
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 所在城市：</label>
                    <select name="province" datatype="*"><option value="">请选择城市</option><option value="1">瑞金市</option></select>
                </li>
                <li>
                	<label class="label"><span class="need">*</span> 性别：</label>
                    <input type="radio" value="1" name="gender" id="male" class="pr1" datatype="*" /><label for="male">男</label> <input type="radio" value="2" name="gender" id="female" class="pr1" /><label for="female">女</label>
                </li>
                <li>
                    <label class="label"><span class="need">*</span> 购物网：</label>
                    <input name="shoppingsite2" class="rt2" id="shoppingsite21" type="checkbox"  value="1" /><label for="shoppingsite21">新蛋</label>
                    <input name="shoppingsite2" class="rt2" id="shoppingsite22" type="checkbox"  value="2" /><label for="shoppingsite22">淘宝</label>
                    <input name="shoppingsite2" class="rt2" id="shoppingsite23" type="checkbox"  value="3" /><label for="shoppingsite23">京东</label>
                </li>
            </ul>
            <div class="action">
                <input type="submit" value="提 交" /> <input type="reset" value="重 置" />
            </div>
        </form>
        
        <h2>说明：</h2>
        <div class="tipmsg">
        	<p>1、没有找到Validform_checktip时，会根据tiptype自动创建显示提示信息的标签；</p>
            <p>2、没有绑定nullmsg时，默认查找Validform_label标签内的文字做提示，传入了“label”参数时会查找label指定的选择符；</p>
            <p>3、没有绑定errormsg时，自动根据datatype输出相应提示文字；</p>
        </div>
         
    </div>
</div>
	
</body>
<script type="text/javascript">
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	var demo=$(".form1").Validform({
		tiptype:3,
		label:".label",
		showAllError:true,
		datatype:{
			"zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
		},
		ajaxPost:true,
		callback:function(data){
			alert (data);
		}
	});
	
	
	//通过$.Tipmsg扩展默认提示信息;
	//$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
	demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
	
	/* demo.addRule([{
		ele:".inputxt:eq(0)",
		datatype:"zh2-4"
	},
	{
		ele:".inputxt:eq(1)",
		datatype:"*6-20"
	},
	{
		ele:".inputxt:eq(2)",
		datatype:"*6-20",
		recheck:"userpassword"
	},
	{
		ele:"select",
		datatype:"*"
	},
	{
		ele:":radio:first",
		datatype:"*"
	},
	{
		ele:":checkbox:first",
		datatype:"*"
	}]); */
	
})

</script>
</html>

