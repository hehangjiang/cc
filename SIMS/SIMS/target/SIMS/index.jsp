<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!DOCTYPE html>
<head>
    <meta charset="UTF-8">

    <!--对移动设备友好，确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Home</title>
    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/lightbox.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/responsive.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath() %>/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath() %>/js/respond.min.js"></script>
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

                <a class="navbar-brand" href="index.jsp">
                    <h1><img src="images/home/zjpc.png" alt="logo"></h1>
                </a>

            </div>

            <!--右侧的导航栏-->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="index.jsp">首页</a></li>
                    <li><a href="application.jsp">访客预约</a></li>
                    <li><a href="Login.jsp">住户登录</a></li>
                </ul>
            </div>
        </div>
    </div>
</header>

<!--一个动态动画-->
<section id="home-slider">
    <div class="container">
        <div class="row">
            <div class="main-slider">
                <div class="slide-text">
                    <h1>彩码自助访客系统</h1>
                    <p>本系统是彩码技术与人脸识别技术在访客系统中的应用。旨在保证安全性与便捷性的前提下，解决预约、出入口登记、事后追溯等问题。访客可以通过点击按钮，进入访客界面；住户则可通过申请后进入用户界面查看来访信息。</p>
                    <a href="application.jsp" class="btn btn-common" >预约</a>
                    <a href="Login.jsp" class="btn btn-common">登录</a>
                </div>
                <img src="images/home/slider/highhouse.png" class="slider-house" alt="slider image">
                <img src="images/home/slider/camera.png" class="slider-camera" alt="slider image">
                <img src="images/home/slider/face.png" class="slider-face" alt="slider image">
            </div>
        </div>
    </div>
</section>

<!--彩码性能介绍-->
<section id="action" class="responsive">
    <div class="vertical-center">
        <div class="container">
            <div class="row">
                <div class="action take-tour">
                    <div class="col-sm-1"></div>
                    <div class="col-sm-7 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                        <h1 class="title">自助访客系统</h1>
                        <p>彩码技术 & 人脸识别技术双重保护</p>
                    </div>
                    <div class="col-sm-5 text-center wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                        <img src="images/home/colorcode.png" class="tour-img">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--性能-->
<section id="features">
    <div class="container">
        <div class="row">
            <div class="single-features">
                <div class="col-sm-2"></div>
                <div class="col-sm-3 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                    <img src="images/home/far.png" class="img-responsive" alt="">
                </div>
                <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                    <h2>远距离识别</h2>
                    <P>对于二维码和条码的近距离识别，彩码的识别距离最多可达到50米。</P>
                </div>
            </div>
            <div class="single-features">
                <div class="col-sm-5 col-sm-offset-1 align-right wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                    <h2>多码识别</h2>
                    <P>相比二维码和条码，彩码可以多码同时识别，大大提高了识别效率。</P>
                </div>
                <div class="col-sm-1"></div>
                <div class="col-sm-5 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                    <img src="images/home/many.png" class="img-responsive" alt="">
                </div>
            </div>
            <div class="single-features">
                <div class="col-sm-2"></div>
                <div class="col-sm-3 wow fadeInLeft" data-wow-duration="500ms" data-wow-delay="300ms">
                    <img src="images/home/town.png" class="img-responsive" alt="">
                </div>
                <div class="col-sm-6 wow fadeInRight" data-wow-duration="500ms" data-wow-delay="300ms">
                    <h2>无电磁干扰</h2>
                    <P>在特定场合，RFID是不被允许的。这种情况下，彩码也能获得较好的效果。</P>
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


<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lightbox.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>
</body>
</html>