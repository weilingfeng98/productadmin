<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/commons/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <title>商品运营系统管理平台</title>
    <link href="${ctx}/css/common/joyManagerSystem.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="${ctx}/scripts/md5.js"></script>
</head>

<body style="background-color: #2d70af">
<form action="${ctx}/home/login.do" id="loginForm" method="post">
    <div class="divbody">
        <div class="loginArea">
            <div class="loginPic00">
                <img alt="" height="120" src="${ctx}/images/common/loginPic00.jpg" width="490" /></div>
            <div class="loginbox">
                <div class="bd">
                    <h2>登录系统管理平台</h2>
                    <div class="field">
                        <label for="username">用户名</label><input id="username" class="login-text" maxlength="32" name="username" tabindex="1" type="text" value="" />
                    </div>
                    <div class="field">
                        <label for="">密&nbsp; 码</label><input id="password" class="login-text" maxlength="32" name="password" tabindex="1" type="password" autocomplete="off" /></div>
                    <div class="field">
                        <label for="">验证码</label><input id="checkcode" class="login-text checkcode" maxlength="8" name="checkcode" tabindex="1" type="text" onkeydown="if (event.keyCode == 13){javascript:formValidate();}"/>
                        <img id="random_jpeg" src="${ctx}/servlet/random.jpeg" alt="点击图片可以刷新" height="23"  width="80" />
                        <a href="#" onclick="javascript:refeshCode()">看不清<br />
                            换一张</a></div>
                    <div class="submit">
                        <input class="S-Submit" name="Submit1" type="button" value="" onclick="formValidate()"/></div>
                </div>
            </div>
            <div class="login-bg" style="margin-right: auto;margin-left: auto;padding-top: 50px;">
               <img alt="" src="${ctx}/images/common/loginPic01.png" /></div> 
        </div>
        <div class="loginFooter">
            Copyright ©上海集盛信息科技有限公司</div>
    </div>
</form>
<script type="text/javascript">
    if (top.location != self.location){
        top.location=self.location;
    }

    function formValidate(){

        if($('#username').val()==''){
            alert('请输入用户名!');
            return false;
        }

        if($('#password').val()==''){
            alert('请输入密码!');
            return false;
        }

        if($('#randomCode').val()==''){
            alert("请输入验证码！");
            refeshCode();
            return false;
        }

        var password = hex_md5(hex_md5($('#password').val()).toUpperCase()).toUpperCase();
        $("#password").val(password);
        $('#loginForm').submit();
    }

    function refeshCode() {
        document.getElementById('random_jpeg').src = '${ctx}/servlet/random.jpeg?'+Math.random();
    }

    function checkPaw(){
        if (!(/[a-z]/.test($('#password').val()) && /[A-Z]/.test($('#password').val()) && /[0-9]/.test($('#password').val()))) {
            $("#submitButton").click = function(){};
            return false;
        }else{
            return true;
        }
    }

    var resInfo = "${resInfo}";
    if(resInfo != '' && resInfo.length > 0) {
        if(resInfo == "wrongpass"){
            alert("用户名或密码错误！");
        }
        if(resInfo == "wrongrandomCode"){
            alert("验证码输入错误！");
        }
        if(resInfo == "noRight"){
            alert("您没有权限访问该系统！");
        }
    }

</script>
</body>

</html>
