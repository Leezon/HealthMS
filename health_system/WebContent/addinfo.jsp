<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>健康监测系统-信息录入</title>
    <meta name="description" content="author:年少模样"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/login.css">
</head>
<body>

<!--顶部导航栏-begin-->
<jsp:include page="header.jsp"></jsp:include>
<!--顶部导航栏-end-->

<!--主内容区-begin-->
<div class="content w">
    <div class="logon_reg">
        <div class="top">
            <a href="#" class="top-login current" id="login">个人信息录入</a>
        </div>
        <div class="main">
            <div class="main-login" id="main_login">
                <div class="login-top">
                    <form action="User?method=addinfo" method="post">
                        <div class="height">
                            身高<br/>
                            <input name="height" type="number" placeholder="单位：CM">
                        </div>
                        <div class="weight">
                            体重<br/>
                            <input name="weight" type="text" placeholder="单位：KG">
                        </div>
                        <div class="birthday">
                            生日<br/>
                            <input name="birthday" type="date">
                        </div>
                        <div class="gender">
                            性别<br/>
                            <select name="gender" id="gender">
                                <option value="男">男</option>
                                <option value="女">女</option>
                            </select>
                        </div>
                        <span id="msg" style="display: none;color:#FF0033;margin-top: 20px;">${msg }</span>
                        <div class="login" style="margin: 70px 0">
                            <input type="submit" value="提交" id="submit">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主内容区-end-->

<!--底部区域-begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部区域-end-->

<script >
window.onload=function () {
	// 登录结果反馈
	var msg = document.getElementById('msg');
	if ((msg.innerText) !== "") {
		msg.style.display="block";
		msg.innerText = msg.innerText;
		setTimeout(function(){
			msg.style.display="none";
		},5000)
	}
}
</script>
</body>
</html>