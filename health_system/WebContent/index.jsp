<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>健康监测系统-关注健康，关注数据！</title>
    <meta name="description" content="author:109"/>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/fonts.css">
    <link rel="stylesheet" href="css/swiper.min.css">
    <link rel="stylesheet" href="css/nprogress.css">
    <style>
        .swiper-container {
            width: 100%;
            height: 500px;
            margin: 0 auto;
        }

        .swiper-slide > img {
            width: 100%;
            height: 100%;
        }

         .swiper-pagination-bullet {
            width: 24px;
            height: 14px;
            border-radius: 7px;
        }

        .swiper-pagination-bullet-active {
            background: #ff6d64 !important;
        }
    </style>
</head>
<body>
<!--顶部导航栏-begin-->
<jsp:include page="header.jsp"></jsp:include>
<!--顶部导航栏-end-->


<!--轮播图区域-begin-->
<div class="swiper">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="images/swiper-images/swiper-01.png" alt=""></div>
            <div class="swiper-slide"><img src="images/swiper-images/swiper-02.png" alt=""></div>
            <div class="swiper-slide"><img src="images/swiper-images/swiper-03.png" alt=""></div>
            <div class="swiper-slide"><img src="images/swiper-images/swiper-04.png" alt=""></div>
        </div>
        <!-- 如果需要分页器 -->
        <div class="swiper-pagination"></div>
    </div>
</div>
<!--轮播图区域-end-->


<!--主内容区-begin-->

<div class="motto">
    <span>关注健康，关注数据</span>
</div>

<div id="main">
    <div class="widget-index-tools">
        <div class="container">
            <div class="widget-title">
                <h2><span>健康工具</span><span></span></h2>
            </div>
            <ul class="row">
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont iconfont-fire icon-kaluli"></a>
                    <h3>卡路里计算器</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont icon-1"></a>
                    <h3>身体质量指数(BMI)</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont iconfont-weight1 icon-2"></a>
                    <h3>标准体重计算</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont iconfont-weight2 icon-3"></a>
                    <h3>健康体重范围</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont iconfont-loop icon-daixie"></a>
                    <h3>基础代谢计算</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
                <li class="col-md-4 col-sm-4 col-xs-12 item">
                    <a href="health_plan.jsp" class="iconfont iconfont-bike icon-yundong"></a>
                    <h3>燃脂运动计算</h3>
                    <p>添加食物计算每日摄取卡路里</p>
                </li>
            </ul>
        </div>
    </div>

    <div class="widget-index-topics">
        <div class="container">
            <div class="widget-title">
                <h2><span>热门关注</span><span class="red-line"></span></h2>
            </div>
            <table class="topics">
                <tbody>
                <tr>
                    <td><a href="#">减肥食谱</a></td>
                    <td><a href="#">减肥运动</a></td>
                    <td><a href="#">如何减肥</a></td>
                    <td><a href="#">减肥方法</a></td>
                    <td><a href="#">学生减肥</a></td>
                    <td><a href="#">夏季减肥</a></td>
                </tr>
                <tr>
                    <td><a href="#">瘦腰</a></td>
                    <td><a href="#">瘦腿</a></td>
                    <td><a href="#">便秘</a></td>
                    <td><a href="#">减肥平台期</a></td>
                    <td><a href="#">超模25</a></td>
                    <td><a href="#">春季减肥</a></td>
                </tr>
                <tr>
                    <td><a href="#">上班族减肥</a>
                    </td>
                    <td><a href="#">减肥与生理期</a>
                    </td>
                    <td><a href="#">节食减肥</a></td>
                    <td><a href="#">跑步减肥</a></td>
                    <td><a href="#">游泳减肥</a></td>
                    <td><a href="#">瘦手臂</a></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
<!--主内容区-end-->


<!--底部区域-begin-->
<jsp:include page="footer.jsp"></jsp:include>
<!--底部区域-end-->


<!--引入JS代码-->
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/slider/swiper.min.js"></script>
<script src="js/slider/useSwiper.js"></script>
<script src="js/nprogress/nprogress.js"></script>
<script src="js/nprogress/useNprogress.js"></script>
</body>
</html>