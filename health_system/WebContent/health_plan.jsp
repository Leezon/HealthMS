<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>健康监测系统-健康计划</title>
    <meta name="description" content="author:109"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/fonts.css">
    <style type="text/css">
	    .content{
	    	padding-top:90px;
	    }
	    table{
	    	background: #f2f2f2;
	    }
   	 	th{
	   	 	height:40px;
	   	 	line-height: 40px;
	   	 	border:1px solid #ff6e64
   	 	}
    	td{
    		padding:40px 20px;
	    	width:400px;
	    	text-align: center;
	    	border:1px solid #ff6e64
    	}
    	input{
    		width:200px;
    		height:30px;
    		border: 1px solid #ff6e64;
    		border-radius:5px;
    	}
    	input[type=radio]{
    		width:20px;
    		height:20px;
    	}
    	input[type=button]{
	    	cursor: pointer;
	    	width:80px;
    		height:40px;
    		background: #ff6e64;
    		color:#fff;
    	}
    	input[type=text]{
    		font-size: 16px;
    	}
    	.gender{
	    	height: 30px;
	    	line-height: 30px
    	}
    	.gender input, .gender span{
    		vertical-align: middle;
    	}
    	.plan{
    		width:100%;
    		height:370px;
    		background: #f2f2f2;
    		padding:40px;
    		box-sizing:border-box;
    	}
    	.plan>span:first-child, .plan>p{
    		color:#333;
    	}
    	th{
	    	color:#333;
	    	font-weight:700;
    	}
    	
    </style>
</head>
<body>
<!--顶部导航栏-begin-->
<jsp:include page="header.jsp"></jsp:include>
<!--顶部导航栏-end-->

<!--主内容区-begin-->
<div class="content w">
	<div class="tools">
		<table>
		<tr>
			<th>BMI计算</th>
			<th>MBR计算 </th>
			<th>SBW计算 </th>
		</tr>
		<tr>
			<td>
				<label>身高：<input type="text" id="BMI_H"> CM</label><br/><br/>
				<label>体重：<input type="text" id="BMI_W"> KG&nbsp;</label><br/><br/>
				<label><input type="button" value="计算" id="BMI_btn"></label>
			</td>
			<td>
				<label>年龄：<input type="text" id="DX_age"> 岁&nbsp;&nbsp;</label><br/><br/>
				<label>身高：<input type="text" id="DX_H"> CM</label><br/><br/>
				<label>体重：<input type="text" id="DX_W"> KG</label><br/><br/>
				<div class="gender">
					<input type="radio" name="DX_gender" value="男"><span>男</span>
					<input type="radio" name="DX_gender"  value="女"><span>女</span>
				</div><br/>
				<label><input id="DX_btn" type="button" value="计算"></label>
			</td>
			<td>
				<label>身高：<input type="text" id="SBW_H"> CM</label><br/><br/>
				<div class="gender">
					<input type="radio" name="difang" value="北方人"><span>北方人</span>
					<input type="radio" name="difang"  value="南方人"><span>南方人</span>
				</div><br/>
				<label><input id="SBW_btn" type="button" value="计算"></label>
			</td>
		</tr>
		</table>
	</div>
	<div class="plan">
		<span >以上计算器仅对成年人有效，计算结果仅供参考。</span>
		<br><br>
		<p>计算结果将在这里显示：</p><br>
		<span id="BMI_result" style="display: none"></span>
		<span id="MBR_result" style="display: none"></span>
		<span id="SBW_result" style="display: none"></span>
	</div>
</div>
<!--主内容区-end-->

<!--底部区域-begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部区域-end-->


<!--引入JS代码-->
<script type="text/javascript">
	window.onload=function(){
		//1.计算BMI
		$("BMI_btn").onclick=function(){
			var BMI_H=$("BMI_H").value;
			var BMI_W=$("BMI_W").value;
			if(BMI_H==""||BMI_W==""){
				alert("请输入完整的数据！");
				return;
			}
			var result=(BMI_W/(BMI_H*BMI_H)*10000).toFixed(2);
			$("BMI_result").innerText="您的身体质量指数为："+result;
			$("BMI_result").style.display="block";
		};
		//2.计算代谢
		//BMR(男)=(13.7×体重(公斤))+(5.0×身高(厘米))-(6.8×年龄)+66
　　		//BMR(女)=(9.6×体重(公斤))+(1.8×身高(厘米))-(4.7×年龄)+655
		$("DX_btn").onclick=function(){
			var DX_result=0;
			var DX_age=$("DX_age").value;
			var DX_H=$("DX_H").value;
			var DX_W=$("DX_W").value;
			var genders=document.getElementsByName("DX_gender");
			var gender=null;
			for(var i=0;i<genders.length;i++){
				if (genders[i].checked==true){
					gender=genders[i].value;
				}
			}
			if(gender==null||DX_age==""||DX_H==""||DX_W==""){
				alert("请输入完整的数据！");
				return;
			}else if(gender=="男"){
				DX_result=13.7*DX_W+5.0*DX_H-6.8*DX_age+66;
				$("MBR_result").innerText="您的基础代谢率为："+DX_result.toFixed(2)+"大卡";
			}else if(gender=="女"){
				DX_result=9.6*DX_W+1.8*DX_H-4.7*DX_age+655;
				$("MBR_result").innerText="您的基础代谢率为："+DX_result.toFixed(2)+"大卡";
			}
			$("MBR_result").style.display="block";
		};
		//3.SBW计算
		//专门针对以南北地区划分的中国人的公式:
		//北方人理想体重（kg）=[身高（cm）-150]×0.6+50；
		//南方人理想体重（kg）=[身高（cm）-150]×0.6+48。
		var SBW_result=0;
		$("SBW_btn").onclick=function(){
			var SBW_H=$("SBW_H").value;
			var difangs=document.getElementsByName("difang");
			var difang=null;
			for(var i=0;i<difangs.length;i++){
				if (difangs[i].checked==true){
					difang=difangs[i].value;
				}
			}
			if(difang==null||SBW_H==""){
				alert("请输入完整的数据！");
				return;
			}else if(difang=="北方人"){
				SBW_result=(SBW_H-150)*0.6+50;
				$("SBW_result").innerText="您的标准体重大概为："+SBW_result.toFixed(2)+"KG";
			}else if(difang=="南方人"){
				SBW_result=(SBW_H-150)*0.6+48;
				$("SBW_result").innerText="您的标准体重大概为："+SBW_result.toFixed(2)+"KG";
			}
			$("SBW_result").style.display="block";
		}
	};
	function $(id){
		return typeof(id)==='string'?document.getElementById(id):null;
	}	
</script>
</body>
</html>