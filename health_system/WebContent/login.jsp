<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>健康监测系统-登录/注册</title>
    <meta name="description" content="author:109"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
<!--顶部导航栏-begin-->
<jsp:include page="header.jsp"></jsp:include>
<!--顶部导航栏-end-->



<!--主内容区-begin-->
<div class="content w">
    <div class="logon_reg">
        <div class="top">
            <a href="#" class="top-login current" id="login">我要登录</a>
            <a href="#" class="top-register" id="register">我要注册</a>
        </div>
        <div class="main">
            <div class="main-login" id="main_login">
                <div class="login-top">
                    <form action="User?method=login" method="post" id="loginForm">
                        <div class="username">
                            账号<br/>
                            <input id="user" name="username" type="text" placeholder="用户名/手机/邮箱">
                        </div>
                        <div class="password">
                            密码<br/>
                            <input id="pswd" name="password" type="password" placeholder="请输入密码">
                        </div>
                        <div class="remember">
                            <input id="remember" name="remember" type="checkbox">记住密码
                        </div>
                        <div class="login">
                            <input type="submit" value="登 录">
                        </div>
                        <span id="msg" style="display: none;color:#FF0033;margin-top: 20px;">${msg }</span>
                    </form>
                </div>
                <div class="login-center">
                    <a href="#">找回密码</a>
                    <span>|</span>
                    <p>还没有注册账号？</p>
                    <span>|</span>
                    <a href="#">立即注册</a>
                </div>
                <div class="kuaijie-bottom">
                    <div class="kuaijie-title">
                        <span>使用第三方账号直接登录</span>
                    </div>
                    <div class="kuaijie-img">
                        <a href="#"><img src="images/qq.png" alt=""></a>
                        <a href="#"><img src="images/wechat.png" alt=""></a>
                    </div>
                </div>
            </div>
            <div class="main-register" id="main_register">
                <div class="register-top">
                    <form action="User?method=reg" method="post">
                        <div class="phone-number">
                            手机号<br/>
                            <input name="phone" type="tel" placeholder="填写你的手机号作为登录账户">
                        </div>
                        <div class="username">
                            账号<br/>
                            <input name="username" type="text" placeholder="中、英文均可，最长20个字符或10个汉字">
                        </div>
                        <div class="password">
                            密码<br/>
                            <input name="password" type="password" placeholder="6-30位英文、数字、符号，区分大小写">
                        </div>
                        <div class="message-check">
                            短信验证码<br/>
                            <input type="text" name="message-check">
                            <input type="button" value="获取短信验证码">
                        </div>
                        <div class="invitation-code">
                            邀请码<span>(选填)</span><br/>
                            <input name="code" type="text" placeholder="如果有邀请码，请填写">
                        </div>
                        <div class="register">
                            <input type="submit" value="注 册">
                        </div>
                    </form>
                </div>
                <div class="kuaijie-bottom">
                    <div class="kuaijie-title">
                        <span>使用第三方账号直接登录</span>
                    </div>
                    <div class="kuaijie-img">
                        <a href="#"><img src="images/qq.png" alt=""></a>
                        <a href="#"><img src="images/wechat.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--主内容区-end-->

<!--底部区域-begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部区域-end-->


<!--引入JS代码-->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/login.js"></script>
</body>
</html>