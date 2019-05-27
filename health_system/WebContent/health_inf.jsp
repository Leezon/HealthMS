<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>健康监测系统-健康信息</title>
    <meta name="description" content="author:年少模样"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/info.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <style>
    	body{
    	overflow: auto;
    	}
        .mCSB_scrollTools {
            width: 0.5rem !important;
        }

        .mCSB_inside > .mCSB_container {
            margin-right: 0.5rem !important;
        }
        
         .tip{
        	width: 10rem;
		    height: 17rem;
		    background: #FFF;
		    position: fixed;
		    left: 0;
		    bottom: 3rem;
		    border-radius: 0.25rem;
            display: none;
            padding:1rem;
            box-sizing:border-box;
            z-index:99999;
        }
        #close{
            display: inline-block;
		    width: 1.25rem;
		    height: 1.25rem;
		    position: absolute;
		    top: 0;
		    right: 0;
		    background-color: #f2f2f2;
		    border-radius: 50%;
		    cursor: pointer;
		    text-align: center;
        }
    </style>

</head>
<body>
<!--顶部导航栏-begin-->
<jsp:include page="header.jsp"></jsp:include>
<!--顶部导航栏-end-->

<!--主内容区-begin-->
<div class="content">
    <div class="aside">
        <div class="title"><i class="icon-7"></i><span>菜单栏</span></div>
        <div class="nav">
            <div class="content_list">
                <ul id="ul">
                    <li id="1"><i class="icon-1"></i><span>BMI-体质指数</span></li>
                    <li id="2"><i class="icon-2"></i><span>SPORT-步数统计</span></li>
                    <li id="3"><i class="icon-3"></i><span>SLEEP-睡眠情况</span></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main">
        <div class="main-header">
            <span id="header_title">BMI-体质指数</span>
        </div>
        <div class="main-content">
            <div class="box left_info">
            <div class="left_info-1">
            <p><b>BMI[Body Mass Index]</b> 即BMI指数，也叫身体质量指数，是衡量是否肥胖和标准体重的重要指标。
            适用范围：18至65岁的人士。儿童、发育中的青少年、孕妇、乳母、老人及身型健硕的运动员除外。
            世界卫生组织认为BMI指数保持在22左右是比较理想的。</p>
            <table cellpadding="0" cellspacing="0" class="table1">
			    <tr class="thead">
			      <th colspan="4" style="border-left: 0rem; border-right: 0rem;">成年人身体质量指数</th>
				</tr>
		        <tr>
		          <td width="25%" style="border-left: 0rem;"><b>轻体重BMI</b></td>
		          <td width="25%"><b>健康体重BMI</b></td>
		          <td width="25%"><b>超重BMI</b></td> 
				  <td width="25%" style="border-right: 0rem;"><b>肥胖BMI</b></td>
				</tr>
				<tr>
				  <td style="border-left: 0rem;">BMI&lt;18.5</td>
				  <td>18.5≤BMI&lt;24</td>
				  <td>24≤BMI&lt;28</td>
				  <td style="border-right: 0rem;">28≤BMI</td>
				</tr>
			</table>
            </div>
            <div class="left_info-2">
            <p><b>燃脂运动</b> 就是燃烧脂肪的运动，需要满足下面三个必要条件：</p>
            <p>1、该运动要达到中低强度的运动心率；</p>
            <p>2、这种中低强度运动心率的运动要持续20分钟以上；</p>
            <p>3、这种运动必须是大肌肉群的运动，如慢跑、游泳、健身操等。</p>
            <p>用下面的计算器，马上得到适合你的中低强度运动心率，低于这个范围或者高于这个范围，都不是以燃烧脂肪供能为主，减脂效果略差。</p>
            </div>
            <div class="left_info-3">
             <p><b>基础代谢率（BMR）</b> 是指人体在清醒而又极端安静的状态下，不受肌肉活动、环境温度、食物及精神紧张等影响时的能量代谢率。</p>
              <p>基础代谢率对减肥有非常大的影响，每天适量的运动有助于提高身体的基础代谢率，而节食(极端是绝食)会降低人的基础代谢率。通过性别，年龄，身高和体重能粗略计算基础代谢率。</p>
            </div>
            </div>
            <div class="box right_info" id="right_info">
                <div class="chart" id="chart1" style="display: block"></div>
                <div class="chart" id="chart2" style="display: none"></div>
                <div class="chart" id="chart3" style="display: none"></div>
                <p id="BMI" style="display: none">${user.weight/((user.height)*(user.height)/10000) }</p>
            </div>
        </div>
    </div>
</div>
<!--主内容区-end-->


<!--底部区域-begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部区域-end-->


<!-- 弹窗信息-begin -->
<div class="tip">
   <br>
   <p id="time"></p>
   <span id="close">×</span>
</div>
<!-- 弹窗信息-end -->

<!--引入JS代码-->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="js/echarts/echarts.js"></script>
<script src="js/echarts/stepChart.js"></script>
<script src="js/echarts/sleepChart.js"></script>
<script src="js/echarts/bmiChart.js"></script>
<script src="js/echarts/drewCharts.js"></script>
<script src="js/fun.js"></script>
<script>
    $(function () {
    	//时间显示
    	dispTime();
    	
    	//监听span的点击事件
        $("#close").click(function () {
        	console.log(111);
            $(".tip").remove();
        });
    	
        // 执行广告动画
        $(".tip").stop().slideDown(1000).fadeOut(1000).fadeIn(1000);
    	
        // 自定义滚动条
        $(".content_list").mCustomScrollbar({
            theme: "dark"
        });
        
        //一进入页面就执行BMI
         drewBMI();
        
        //改变标题
        $("#ul>li").click(function () {
                $("#header_title").text(this.childNodes[1].innerHTML);
                var chart1 = document.getElementById("chart1");
                var chart2 = document.getElementById("chart2");
                var chart3 = document.getElementById("chart3");
                var BMI = document.getElementById("BMI");
                var index = parseInt(this.id);
                if (index === 1) {
                    chart1.style.display = "block";
                    chart2.style.display = "none";
                    chart3.style.display = "none";
                    drewBMI();

                } else if (index === 2) {
                    chart1.style.display = "none";
                    chart2.style.display = "block";
                    chart3.style.display = "none";
                    drewStepEcharts("chart2", stepUrl, stepOption);

                } else if (index === 3) {
                    chart1.style.display = "none";
                    chart2.style.display = "none";
                    chart3.style.display = "block";
                    drewSleepEcharts("chart3", sleeppUrl, sleepOption);

                }

            }
        )
    })
</script>
</body>
</html>