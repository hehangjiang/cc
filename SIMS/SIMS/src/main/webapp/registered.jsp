<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/7
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>彩码自助访客系统</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">


    <style type="text/css">
        .forgetPassword{
            height: 60px;
        }
        .register{
            height: 60px;
        }
    </style>
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

                    <a class="navbar-brand" href="index.jsp">
                        <h1><img src="images/home/zjpc.png" alt="logo"></h1>
                    </a>

                </div>

                <!--右侧的导航栏-->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp">首页</a></li>
                        <li class="active"><a href="application.jsp">访客预约</a></li>
                        <li><a href="Login.jsp">住户登录</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-offset-3">
                    <!--<div class="col-sm-12">-->
                    <div class="contact-form bottom">
                        <div class="row">
                            <h2 class="text-center header2">用户注册</h2>
                        </div>
                        <form id="main-contact-form" name="content" method="post" action="${pageContext.request.contextPath}/User/registered.actionf?">
                            <div class="form-group">
                                <input type="text" name="userAccount" required="required" class="form-control" placeholder="账号名"></input>
                            </div>
                            <div class="form-group">
                                <<input type="password" id="password1" name="userPassword" required="required" class="form-control" placeholder="密码"></input>
                            </div>
                            <%--<div class="form-group">--%>
                                <%--<<input type="password" id="password2" name="userPassword" required="required" class="form-control" placeholder="确认密码"></input>--%>
                            <%--</div>--%>
                            <div class="form-group">
                                <input type="text" name="userName" class="form-control" required="required" placeholder="姓名">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userPhone" class="form-control" required="required" placeholder="联系方式">
                            </div>
                            <div class="form-group">
                                <input type="email" name="userEmail" class="form-control" required="required" placeholder="邮箱">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userLocat" class="form-control" required="required" placeholder="注册位置">
                            </div>
                            <div class="form-group">
                                <input type="text" name="userNum" required="required" class="form-control" placeholder="教工号/学工号"></input>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="提交">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="images/home/bg_counter.png" width="50%" alt="">
                </div>
                <div class="col-sm-2"></div>
                <div class="col-md-3 col-sm-4">
                    <div class="contact-info bottom">
                        <h2>联系方式</h2>
                        <address>
                            联系人：何杭江<br>
                            <br>
                            E-mail: <a href="mailto:765185513@qq.com">765185513@qq.com</a> <br>
                            <br>
                            Phone: 15757172589<br>
                        </address>

                        <h2>地址</h2>
                        <address>
                            浙江杭州滨江区滨文路555号, <br>
                            <br>
                            浙江警察学院<br>
                        </address>
                    </div>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-md-4 col-sm-12">
                    <div class="contact-form bottom">
                        <h2>意见反馈</h2>
                        <form id="main-contact-form" name="contact-form" method="post" action="">
                            <div class="form-group">
                                <input type="text" name="name" class="form-control" required="required" placeholder="姓名">
                            </div>
                            <div class="form-group">
                                <input type="email" name="email" class="form-control" required="required" placeholder="邮箱">
                            </div>
                            <div class="form-group">
                                <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="反馈意见"></textarea>
                            </div>
                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="提交">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p>&copy; 浙江警察学院 2018 </p>
                        <p>Designed by HHJ</p>
                    </div>
                </div>
            </div>
        </div>
    </footer>


    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/lightbox.min.js"></script>
    <script type="text/javascript" src="js/wow.min.js"></script>
    <script type="text/javascript" src="js/main.js"></script>

</body>
</html>
