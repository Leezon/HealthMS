<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--顶部导航栏-begin-->
<header class="header">
    <nav class="nav">
        <div class="nav-left">
            <h1><a href="index.jsp">Health MS</a></h1>
        </div>
        <div class="nav-center">
            <ul>
                <li><a href="index.jsp">首页</a></li>
                <li><a href="health_inf.jsp">健康信息</a></li>
                <li><a href="health_plan.jsp">健康计划</a></li>
                <li><a href="daily_rec.jsp">每日推荐</a></li>
                <li><a href="consult.jsp">专家咨询</a></li>
            </ul>
        </div>
        <div class="nav-right">
            <ul>
        <%
            String username = (String) session.getAttribute("username");
            boolean logined = false;
            if (username != null) {
                logined = true;
            }
            if (!logined) {
        %>
        <li ><a href="login.jsp"><i class="icon-4"></i></a></li>
        <li><a href="login.jsp"><i class="icon-5"></i></a></li>
        <%
        } else {
        %>
        <li ><a href="addinfo.jsp"><%=username%></a></li>
        <li><a href="doLogout.jsp"><i class="icon-6"></i></a></li>
        <%
            }
        %>
            </ul>
        </div>
    </nav>
</header>
<!--顶部导航栏-end-->