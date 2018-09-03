<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/6
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application</title>

    <!--对移动设备友好，确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/font-awesome.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/animate.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/lightbox.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/main.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/responsive.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath() %>/css/fileinput.min.css" rel="stylesheet">

    <!--[if lt IE 9]>
    <script src="<%=request.getContextPath() %>/js/html5shiv.js"></script>
    <script src="<%=request.getContextPath() %>/js/respond.min.js"></script>
    <script src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
    <script src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
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
                        <li><a href="index.jsp">首页</a></li>
                        <li class="active"><a href="application.jsp">访客预约</a></li>
                        <li><a href="Login.jsp">住户登录</a></li>
                        <!--&lt;!&ndash;下拉式&ndash;&gt;-->
                        <!--<li class="dropdown"><a href="">待定2<i class="fa fa-angle-down"></i></a>-->
                        <!--<ul role="menu" class="sub-menu">-->
                        <!--<li><a href="">about</a></li>-->
                        <!--<li><a href="">about</a></li>-->
                        <!--</ul>-->
                        <!--</li>-->

                        <!--<li class="dropdown"><a href="portfolio.html">待定<i class="fa fa-angle-down"></i></a>-->
                        <!--<ul role="menu" class="sub-menu">-->
                        <!--<li><a href="portfolio.html">Portfolio Default</a></li>-->
                        <!--<li><a href="portfoliofour.html">Isotope 3 Columns + Right Sidebar</a></li>-->
                        <!--</ul>-->
                        <!--</li>-->
                        <!--<li><a href="shortcodes.html ">Shortcodes</a></li>-->
                    </ul>
                </div>
                <!--<div class="search">-->
                <!--<form role="form">-->
                <!--<i class="fa fa-search"></i>-->
                <!--<div class="field-toggle">-->
                <!--<input type="text" class="search-form" autocomplete="off" placeholder="Search">-->
                <!--</div>-->
                <!--</form>-->
                <!--</div>-->
            </div>
        </div>
    </header>

    <div class="alert alert-warning" id="warning" hidden="hidden">
        <a class="close" data-dismiss="alert">
            &times;
        </a>
        <strong>警告！</strong>您的网络连接有问题。
    </div>

    <section>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-offset-3">
                    <!--<div class="col-sm-12">-->
                    <div class="contact-form bottom">
                        <div class="row">
                            <h2 class="text-center header2">访问申请</h2>
                        </div>
                        <form id="main-contact-form" name="content" method="post" action="${pageContext.request.contextPath}/Visitor/application.actionf?">
                            <div class="form-group">
                                <input type="text" name="visitorName" class="form-control" required="required" placeholder="姓名">
                            </div>
                            <div class="form-group">
                                <input type="text" name="visitorPhone" class="form-control" required="required" placeholder="联系方式">
                            </div>
                            <div class="form-group">
                                <input type="email" name="visitorEmail" class="form-control" required="required" placeholder="邮箱">
                            </div>
                            <div class="form-group">
                                <input type="text" name="host" class="form-control" required="required" placeholder="预访对象">
                            </div>
                            <div class="form-group">
                                <div class='input-group date form_datetime' id='datetimepicker11'>
                                    <input type='text' class="form-control" name="visitTime" required="required" placeholder="来访时间">
                                    <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                </div>
                            </div>
                            <div class="form-group">
                                <%--<textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="来访目的简要描述"></textarea>--%>
                                <textarea name="message" required="required" class="form-control" rows="8" placeholder="来访目的简要描述"></textarea>

                            <label  class="col-sm-3 control-label">上传面部照片</label>
                            <div class="col-sm-8">
                                <img id="headimage" class="cover-radius"  src="${basePath}/images/人脸识别.png" style="cursor: pointer;" />
                                <input id="picture_upload" name="visitorPic" type="file" onchange="upload_cover(this)" style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; opacity: 0; cursor: pointer;"/>
                                <small class="help-block cover-tips" style="color: #dd4b39;display: none;">请上传照片</small>
                            </div>

                            <div class="form-group">
                                <input type="submit" name="submit" class="btn btn-submit" value="提交">
                            </div>
                        </form>

                        <%--<form name="Form2" action="${pageContext.request.contextPath}/Visitor/imageUpload.actionf?" method="post"  enctype="multipart/form-data">--%>
                            <%--<h1>使用spring mvc提供的类的方法上传文件</h1>--%>
                            <%--<input type="file" name="file">--%>
                            <%--<input type="submit" value="upload"/>--%>
                        <%--</form>--%>

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

    <script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/lightbox.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/wow.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="<%=request.getContextPath() %>/js/ajaxfileupload.js"></script>
    <script type="text/javascript">
        $(".form_datetime").datetimepicker({
            language:  'zh-CN',  //日期
            format: "yyyy-mm-dd hh:ii",
            showMeridian: true,
            autoclose: true,
            todayBtn: true
        });
    </script>

    <script>
        function upload_cover(obj) {
            ajax_upload(obj.id, function(data) { //function(data)是上传图片的成功后的回调方法
                var isrc = data.replace(/\/\//g, '/'); //获取的图片的绝对路径
                console.log(isrc)
                print(isrc)

                $('#headimage').attr('src', isrc); //给<input>的src赋值去显示图片
            });
        }
        function ajax_upload(feid, callback) { //具体的上传图片方法
            if (image_check(feid)) { //自己添加的文件后缀名的验证
                $.ajaxFileUpload({
                    fileElementId: feid,    //需要上传的文件域的ID，即<input type="file">的ID。
                    url: "${pageContext.request.contextPath}/Visitor/imageUpload", //后台方法的路径
                    type: 'post',   //当要提交自定义参数时，这个参数要设置成post
                    dataType: 'json',   //服务器返回的数据类型。可以为xml,script,json,html。如果不填写，jQuery会自动判断。
                    secureuri: false,   //是否启用安全提交，默认为false。
                    async : true,   //是否是异步
                    success: function(data) {   //提交成功后自动执行的处理函数，参数data就是服务器返回的数据。
                        $("#warning").show();
                        if (callback) callback.call(this, data);
                        window.showModalDialog('图片上传成功！')
                        alert('图片上传成功！')
                    },
                    error: function(data, status, e) {  //提交失败自动执行的处理函数。
                        console.error(e);
                        alert('图片上传失败！')
                    }
                });
            }
        }
        function image_check(feid) { //自己添加的文件后缀名的验证
            var img = document.getElementById(feid);
            return /.(jpg|png|gif|bmp)$/.test(img.value)?true:(function() {
//                modals.info('图片格式仅支持jpg、png、gif、bmp格式，且区分大小写。');
                return false;
            })();
        }
    </script>

</body>
</html>
