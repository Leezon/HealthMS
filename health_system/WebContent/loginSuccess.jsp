<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>登录成功</title>
    <meta name="description" content="author:网络B161 李讯"/>
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/userLogin.css">
    <script type="text/javascript">
        onload = function () {
            go();
           	setInterval(go, 1000);
       	};
       	var x = 6; //利用了全局变量来执行
       	function go() {
            x--;
            if (x > 0) {
                 document.getElementById("countdown").innerHTML = x+'s';  //每次设置的x的值都不一样了。
            } else {
                 location.href = 'index.jsp';
            }
        }
    </script>
</head>
<body>
<!--登录成功-->
<div class="publicStyle" id="loginSuccess">
    登录成功,<span id="countdown" style="color: #40b7ed"></span>后自动跳转到首页
    <br>
    <br>
    <br>
    <a href="index.jsp" class="return submit-btn">回到首页</a>
</div>
<div class="mask_bg"></div>
<div class="mask"></div>
</body>
</html>