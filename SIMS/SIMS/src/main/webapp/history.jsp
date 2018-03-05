<%@ page import="com.model.User" %>
<%@ page import="com.controller.UserController" %>
<%@ page import="javax.annotation.Resource" %>

<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/2/6
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">

    <!--对移动设备友好，确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>History</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/lightbox.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href="css/bootstrap-table.css" rel="stylesheet">



    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
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
                    <li class="active"><a href="/history.jsp">来访记录</a></li>
                    <li><a href="/CCReader.jsp">在线识别</a></li>
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

<!--一个总数统计-->
<section id="main-content">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
                <div class="info-box blue-bg">
                    <i class="fa fa-group"></i>
                    <div class="count" id="pass"></div>
                    <div class="title">已同意总人数</div>
                </div><!--/.info-box-->
            </div><!--/.col-->

            <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-sm-12 col-xs-12" >
                <div class="info-box brown-bg">
                    <i class="fa fa-exchange"></i>
                    <div class="count" id="pending"></div>
                    <div class="title">待处理数</div>
                </div><!--/.info-box-->
            </div><!--/.col-->

            <div class="col-lg-3 col-lg-offset-1 col-md-3 col-md-offset-1 col-sm-12 col-xs-12">
                <div class="info-box dark-bg">
                    <i class="fa fa-calendar"></i>
                    <div class="count" id="countAll"></div>
                    <div class="title">总申请人数</div>
                </div><!--/.info-box-->
            </div><!--/.col-->
        </div>
    </div>
</section>

<!--详细的列表,使用bootstarp-table进行前端分页-->
<div class="container">
    <div class="row" >
        <div class="col-sm-offset-2 col-sm-8">
            <h3 class="panel panel-title text-center">待处理申请</h3>
            <%--<table id="list_visitor_table"></table>--%>
            <table id="list_visitor_table"></table>
        </div>
    </div>
</div>



</body>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/lightbox.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/wow.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/bootstrap-table-zh-CN.js"></script>


<script>

    var host = document.getElementById("username").innerHTML;
//    var pendingNum = 0;

    //统计已同意的人数
    $.ajax({
        url: "${pageContext.request.contextPath}/User/pass",
        type: "POST",
        data: {userName:host},
        datatype:"json",
        async: false,
        success: function(datas){
            $("#pass").text(datas);
        },
        error: function(result, status) {
            if (status == 'error') {
                alert("系统发生错误");
            }
        }
    })


    //统计待处理的人数
    $.ajax({
        url: "${pageContext.request.contextPath}/User/pending",
        type: "POST",
        data: {userName:host},
        datatype:"json",
        async: false,
        success: function(datas){
            pendingNum = datas;
            $("#pending").text(datas);
        },
        error: function(result, status) {
            if (status == 'error') {
                alert("系统发生错误");
            }
        }
    })


//  统计所有申请者数量
    $.ajax({
        url: "${pageContext.request.contextPath}/User/countAll",
        type: "POST",
        data: {userName:host},
        datatype:"json",
        async: false,
        success: function(datas){
            $("#countAll").text(datas);
        },
        error: function(result, status) {
            if (status == 'error') {
                alert("系统发生错误");
            }
        }
    })


    //获取待处理来访人员信息
    $.ajax({
        url: "${pageContext.request.contextPath}/User/getPending",
        type: "POST",
        data: {userName:host},
        datatype:"json",
        async: false,
        success: function(results){
            console.log(results);
            $(function () {
                $("#list_visitor_table").bootstrapTable({
                    method: 'get',
                    cache: false,
                    height: 400,
                    striped: true,        //设置为 true 会有隔行变色效果
                    undefinedText: "空",  //当数据为 undefined 时显示的字符
                    pagination: true,     //分页
                    pageSize: 5,          //如果设置了分页，页面数据条数
                    pageNumber:1,         //如果设置了分页，首页页码
                    pageList: [10, 20, 50, 100, 200, 500],
                    search: true,   //显示搜索框
                    showColumns: true,   //是否显示 内容列下拉框
                    showRefresh: false,
                    showExport: false,
                    exportTypes: ['csv','txt','xml'],
                    clickToSelect: true,
                    columns:
                        [
                            {field:"checked",checkbox:true},
                            {field:"visitorName",title:"访客姓名",align:"center",valign:"middle",sortable:"true"},
                            {field:"visitorPhone",title:"访客电话",align:"center",valign:"middle",sortable:"true"},
                            {field:"visitTime",title:"来访时间",align:"center",valign:"middle",sortable:"true",
                                formatter: function (value, row, index) {
                                    return subDate(value);
                                    }
                            },
                            {field:"button",title:"操作",events:operateEvents,formatter:AddFunctionAlty,align:"center",valign:"middle",sortable:"true"}
                        ],
                    data:results,
                });
            })
        },
        error: function(result, status) {
            if (status == 'error') {
                alert("人员待处理名单加载发生错误");
            }
        }
    })

    //转换日期格式(时间戳转换为datetime格式)
    function changeDateFormat(cellval) {
        var dateVal = cellval + "";
        if (cellval != null) {
            var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
            var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
            var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

            var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
            var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
            var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

            return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
        }
    }

    //从数据库中取出来的时间秒后带.0，直接去除
    function subDate(value) {
        if (value != null){
            value = String(value);
            return value.substring(0,value.length - 2)}
    }

    function AddFunctionAlty(value,row,index) {
        return[
            '<button id="agree" type="button" class="btn btn_default">同意</button> &nbsp;&nbsp;',
            '<button id="disagree" type="button" class="btn btn_default">拒绝</button> &nbsp;&nbsp;',
        ].join("")
    }

    window.operateEvents = {
        "click #agree":function (e,value,row,index) {
            var visitorName = row.visitorName;
            var visitTime = row.visitTime;
//            visitTime = changeDateFormat(visitTime);
            var t = $(this).parent().parent();
            console.log(visitorName);
            console.log(visitTime);
            console.log(host);
            $.ajax({
                url: "${pageContext.request.contextPath}/User/agree",
                type: "POST",
                data: {visitorName:visitorName, host:host, visitTime:visitTime},
                datatype:"json",
                async: false,
                success: function(datas){
//                    $("#countAll").text(datas);
                    console.log(datas);
                    alert("操作成功,该访客的彩码编号为：" + datas);
//                    $(this).parent().parent().remove();
                    t.remove();
                },
                error: function(result, status) {
                    if (status == 'error') {
                        alert("操作失败");
                    }
                }
            })
        },
        "click #disagree":function (e,value,row,index) {
            var visitorName = row.visitorName;
            var visitTime = row.visitTime;
            visitTime = changeDateFormat(visitTime);
            var t = $(this).parent().parent();
            console.log(visitorName);
            console.log(visitTime);
            console.log(host);
            $.ajax({
                url: "${pageContext.request.contextPath}/User/disagree",
                type: "POST",
                data: {visitorName:visitorName, host:host, visitTime:visitTime},
//                data:{userName:host},
                datatype:"json",
                async: false,
                success: function(datas){
//                    $("#countAll").text(datas);
                    alert("操作成功");
//                    $(this).parent().parent().remove();
                    t.remove();
                },
                error: function(result, status) {
                    if (status == 'error') {
                        alert("操作失败");
                    }
                }
            })
        }
    }


</script>
</html>
