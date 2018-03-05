<%@ page import="com.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/2
  Time: 14:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>SignalR Simple Chat</title>
    <style type="text/css">
        .readercontainer {
            background-color: #99CCFF;
            border: thick solid #808080;
            padding: 20px;
            margin: 20px;
        }
        .container textarea{
            width: 100%;
        }
    </style>

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

    <%
        User user = (User)request.getSession().getAttribute("user");
        String userName = user.getUserName();
    %>


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
                        <h1><img src="images/home/zjpc.png" alt="logo">Welcome <span id="username"><%=userName%></span></h1>
                    </a>

                </div>

                <!--右侧的导航栏-->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="user.jsp">首页</a></li>
                        <!--<li class="active"><a href="Application.html">访客预约</a></li>-->
                        <li><a href="/history.jsp">来访记录</a></li>
                        <li class="active"><a href="/CCReader.jsp">在线识别</a></li>
                        <%--<li><a href="/information.jsp">个人信息</a></li>--%>
                    </ul>
                </div>
                <%--<div class="search">--%>
                <%--<form role="form">--%>
                <%--<i class="fa fa-search"></i>--%>
                <%--<div class="field-toggle">--%>
                <%--<input type="text" class="search-form" autocomplete="off" placeholder="Search">--%>
                <%--</div>--%>
                <%--</form>--%>
                <%--</div>--%>
            </div>
        </div>
    </header>

    <section>
        <div class="container">
            <div class="row clearfix">
                <p><strong>扫码器状态：<span id="status"></span></strong></p>
                <p><strong>目前模式：<span id="mode"></span></strong></p>
                <p><input type="button" id="start" value="开始"/> <input type="button" id="stop" value="停止"/></p>
                <div class="">
                    <div class="readercontainer col-md-5">
                        <p><input type="button" id="continous-mode" value="连续模式" /></p>
                        <textarea id="continous-block"  rows="10"></textarea>
                    </div>
                    <div class="readercontainer col-md-5">
                        <p><input type="button" id="batch-mode" value="批量模式" /></p>
                        <textarea id="batch-block"  rows="10"></textarea>
                    </div>
                    <!--<div class="readercontainer col-md-4">-->

                    <!--<input type="button" id="quantitative-mode" value="定量模式" />-->
                    <!--<label>数量：</label><input type="text" id="quantitative-count" value="10" />-->
                    <!--<textarea id="quantitative-block"  rows="10"></textarea>-->
                    <!--</div>-->
                </div>
            </div>
        </div>
    </section>


<!--Script references. -->
<!--Reference the jQuery library. -->
<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
<!--Reference the SignalR library. -->
<script src="http://cdn.bootcss.com/signalr.js/2.2.2/jquery.signalR.min.js"></script>
<!--Reference the autogenerated SignalR hub script. -->
<script src="http://localhost:22029/signalr/hubs"></script>
<!--Add script to update the page and send messages.-->
<script type="text/javascript">
    var mode = 0;

    $(function () {
        //Set the hubs URL for the connection
        $.connection.hub.url = "http://localhost:22029/signalr";

        // Declare a proxy to reference the hub.
        var chat = $.connection.myHub;

        // Create a function that the hub can call to broadcast messages.
        chat.client.receiveCodes = function (codesStr) {
            console.log(codesStr);
            var visitorCC = new Array();
            //输入的str中最后都带","，先去掉最后的逗号再根据逗号进行分割，得到数组
            visitorCC = codesStr.substring(0,codesStr.length-1).split(",");
            console.log(visitorCC);

            if(mode === 0) $('#continous-block').val( $('#continous-block').val() + codesStr);
            if(mode === 1) {
//                $('#batch-block').val( $('#batch-block').val() + codesStr);
                $.ajax({
                    url: "${pageContext.request.contextPath}/User/queryByCC",
                    type: "POST",
                    data: {colorCode:visitorCC},
                    datatype:"json",
                    traditional: true,
                    async: false,
                    success: function(datas){
//                        $("#countAll").text(datas);
                        alert(datas + ",警察学院欢迎您的来访！");
                        console.log("访客姓名："+ datas);
                        $('#batch-block').val( $('#batch-block').val() + datas + ",");
                    },
                    error: function(result, status) {
                        if (status == 'error') {
                            alert("系统发生错误");
                        }
                    }
                })
            }
            if(mode === 2) $('#quantitative-block').val( $('#quantitative-block').val() + codesStr);
        };

        //根据访客的彩码找到访客的资料


        chat.client.serverStarted = function() {
            $('#status').text("扫描中...")
            $('#start').attr('disabled', true);
            $('#stop').removeAttr('disabled');
        }

        chat.client.serverStoped = function() {
            $('#status').text('停止');
            $('#stop').attr('disabled', true);
            $('#start').removeAttr('disabled');
        }


        // Start the connection.
        $.connection.hub.start().done(function () {
            $('#continous-mode').click(function(){ mode = 0; $('#mode').text('连续模式'); chat.server.setMode(3, 0); });
            $('#batch-mode').click(function(){ mode = 1; $('#mode').text('批量模式'); chat.server.setMode(1, 0);});
            $('#quantitative-mode').click(function(){
                mode = 2;
                $('#mode').text('定量模式');
                chat.server.setMode(2, parseInt($('#quantitative-count').val(), 10));
            });

            $('#start').click(function(){
                chat.server.startScan();
            });

            $('#stop').click(function(){
                chat.server.stopScan();
            });
        });
    });
</script>
</body>
</html>
