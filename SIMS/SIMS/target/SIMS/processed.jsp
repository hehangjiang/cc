<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/7
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">

    <!--对移动设备友好，确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Index</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<header id="header">
    <!--最上方菜单栏-->
    <div class="navbar navbar-inverse" role="banner">
        <div class="container">
            <!--左边的图标-->
            <div class="navbar-header">
                <!--点击图片跳转到主页-->
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <a class="navbar-brand" href="user.jsp">
                    <h1><img src="images/home/zjpc.png" alt="logo">Welcome</h1>
                </a>

            </div>

            <!--右侧的导航栏-->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="user.jsp">首页</a></li>
                    <!--<li class="active"><a href="Application.html">访客预约</a></li>-->
                    <!--下拉式-->
                    <li class="dropdown active"><a href="">预约申请<i class="fa fa-angle-down"></i></a>
                        <ul role="menu" class="sub-menu">
                            <li><a href="notprocessed.jsp">未处理</a></li>
                            <li class="active"><a href="processed.jsp">过往申请</a></li>
                        </ul>
                    </li>

                    <li><a href="history.jsp">来访记录</a></li>
                    <li><a href="information.jsp">个人信息</a></li>
                </ul>
            </div>
            <div class="search">
                <form role="form">
                    <i class="fa fa-search"></i>
                    <div class="field-toggle">
                        <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>

<!--详细的列表-->
<div class="row" >
    <div class="col-sm-offset-2 col-sm-8">
        <section class="table-Header">
            <header><strong>已处理申请</strong></header>
        </section>
        <table class="table table-striped table-bordered table-hover">
            <thead>
            <tr>
                <th>来访日期</th>
                <th>姓名</th>
                <th>联系方式</th>
                <th>具体时间</th>
                <th>留言</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>2018-1-1</td>
                <td>Mark</td>
                <td>123456789</td>
                <td>10:50</td>
                <td>hello</td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
