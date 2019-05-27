<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>健康监测系统-专家咨询</title>
<meta name="description" content="author:109" />
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/reset.css">
<link rel="stylesheet" href="css/main.css">
  <link rel="stylesheet" href="css/fonts.css">
<link rel="stylesheet" href="css/nprogress.css">
<style type="text/css">
.content {
	padding-top:115px;
	display: flex;
	justify-content: space-between;
	background-color: #fff;
}

.menu {
	width: 300px;
    height: 700px;
    background-color: #ff959e;
    border-radius: 3px;
    overflow:hidden;
}

.menu h3 {
	height: 30px;
	line-height: 30px;
	padding-left: 10px;
	padding: 0 5px;
	border-bottom: none;
	cursor: pointer;
	color: #fff;
}
.menu h3:nth-of-type(-n+2){
	border-bottom:1px solid #fff;
}

.menu p {
	padding: 20px 0;
	padding-left: 5px;
}

.menu>p>a{
	color:#fff;
}

.chat {
	padding: 40px;
	width: 700px;
	height: 615px;
	text-align: center;
	border:1px solid #ff6e64;
	border-radius: 3px;	
}

.chat .chat-bottom input{
	width: 300px;
	height: 25px;
	border-radius: 3px;
	font-size:15px;
	border:1px solid #ff6e64;
}
.chat-bottom span {
	vertical-align: top;

}
.consult-text textarea{
	width: 300px;
	height: 80px;
	resize: none;
	border-radius: 3px;
	font-size:15px;
	border:1px solid #ff6e64;
}
.chat .chat-bottom button{
	width: 60px;
    height: 40px;
    margin: 0 40px;
    cursor: pointer;
    border-radius: 5px;
    background-color: #ff6e64;
    color:#fff;
}
.changecolor {
	background-color: red;
}
.chat-middle{
	padding:40px;	
	box-sizing:border-box;
	background-color: white; 
	color: #ff6e64; 
	border: 1px solid #ff6e64; 
	width: 700px; height: 340px; 
	text-align: left; 
	overflow: auto;
	margin-top: 20px;
	border-radius: 10px;
}
.chat-top .chat-tip{
	color:#ff6e64;
}

</style>
</head>
<body>
	<!--顶部导航栏-begin-->
	<jsp:include page="header.jsp"></jsp:include>
	<!--顶部导航栏-end-->

	<!--主内容区-begin-->
	<div class="content w">
		<div class="menu">
			<h3>我的好友</h3>
			<p>
				<a href="#">张天浩</a><br /> <br /> <a href="#">喻建华</a><br /> <br />
				<a href="#">李讯</a><br /> <br /> <a href="#">魏家辉</a><br /> <br />
				<a href="#">胡金成</a><br /> <br /> <a href="#">官英杰</a><br />
			</p>
			<h3>我的朋友</h3>
			<p>
				<a href="#">张天浩</a><br /> <br /> <a href="#">喻建华</a><br /> <br />
				<a href="#">李讯</a><br /> <br /> <a href="#">魏家辉</a><br /> <br />
				<a href="#">胡金成</a><br /> <br /> <a href="#">官英杰</a><br />
			</p>
			<h3>陌生人</h3>
			<p>
				<a href="#">张天浩</a><br /> <br /> <a href="#">喻建华</a><br /> <br />
				<a href="#">李讯</a><br /> <br /> <a href="#">魏家辉</a><br /> <br />
				<a href="#">胡金成</a><br /> <br /> <a href="#">官英杰</a><br />
			</p>
		</div>

		<div class="chat">
			<div class="chat-top">
				<p class="chat-tip">欢迎进入专家咨询聊天室!!</p>
			</div>
			<div id="message" class="chat-middle">【状态】</div>
			<div class="chat-bottom">
				<br>
				<div>
					<input id="username" type="hidden" value="${sessionScope.username}" required="required" />
				</div>
				<br>
				<div class="consult-text">
					<span>咨询内容</span>
					<textarea name="" id="text" cols="30" rows="10"></textarea>
				</div>
				<br>
				<div>
					<button onclick="send()">发送</button>
					<button onclick="closeWebSocket()">关闭</button>
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
	<script src="js/nprogress/nprogress.js"></script>
	<script src="js/nprogress/useNprogress.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".menu p:not(:first)").hide();
			$(".menu h3").css("background", "#ff6e64");
			$(".menu h3").hover(
					function() {
						$(this).css("background-color", "#272e57").siblings("h3")
								.css("background-color", "#ff6e64");
					});
			$(".menu h3").mouseleave(function() {
				$(".menu h3").css("background", "#ff6e64");
			}); //离开时将其变为原来颜色
			var index = $(".menu h3").index(this);
			$(".menu h3").click(function() {
				$(this).next("p").slideToggle().siblings("p").slideUp();
			});
		});
	</script>
	<script type="text/javascript">
		var websocket = null;
		var username = document.getElementById('username').value;
		if(username==''){
			alert('请先登录!');
		}else{
			
			//判断当前浏览器是否支持WebSocket
			if ('WebSocket' in window) {
				websocket = new WebSocket("ws://localhost:8080/health_system/webSocket");
			} else {
				alert('不支持WebSocket!')
			}
			
			//连接发生错误的回调方法
			websocket.onerror = function() {
				setMessageInnerHTML("error");
			};
	
			//连接成功建立的回调方法
			websocket.onopen = function(event) {
				setMessageInnerHTML("聊天室开启");
			}
	
			//接收到消息的回调方法
			websocket.onmessage = function() {
				setMessageInnerHTML(event.data);
			}
	
			//连接关闭的回调方法
			websocket.onclose = function() {
				setMessageInnerHTML("聊天室关闭");
			}
	
			//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
			window.onbeforeunload = function() {
				websocket.close();
			}
	
			//将消息显示在网页上
			function setMessageInnerHTML(innerHTML) {
				document.getElementById('message').innerHTML += innerHTML + '<br/>';
			}
	
			//关闭连接
			function closeWebSocket() {
				websocket.close();
			}
	
			//发送消息
			function send() {
// 				var username = document.getElementById('username').value;
				var message = document.getElementById('text').value;
				var msg = "【" + username + "】发言:" + message;
				websocket.send(msg);
			}
		}
	</script>
</body>
</html>