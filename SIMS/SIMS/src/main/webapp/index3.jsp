<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!--
request.getContextPath()  获得当前项目的跟目录
String basePath ==  http://localhost:8080
1、request.getScheme() 返回协议的名称 http，和后面的"://" 拼起来就成了 http://
2、request.getServerName() 这是获取你的服务器的名称，如果你的应用部署在本机那么其就返回localhost或者127.0.0.1
3、request.getServerPort() 是你应用使用的端口，比如8080或者80等等
-->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>文件上传</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">

</head>

<body>


<%--<form id="loginform" class="form-vertical" action="${pageContext.request.contextPath}/User/login.actionf?">--%>
<form id="loginform" class="form-vertical">

    <h3>登录</h3>
    <br>
    <div class="control-group">
        <div class="controls">
            <div class="input-prepend">
                <input type="text" name="userAccount" id="userAccount" placeholder="用户名" />
            </div>
        </div>
    </div>
    <br>
    <div class="control-group">
        <div class="controls">
            <div class="input-prepend">
                <input type="password" name="userPassword" id="userPassword" placeholder="密码" />
            </div>
        </div>
    </div>
    <br>
    <div class="form-actions">
        <span class="pull-left"><a href="" class="flip-link" id="to-recover">忘记</a></span>
        <span class="pull-center"><input type="submit" class="btn btn-inverse" value="登录" onclick="countAll()" /></span>
        <span class="pull-right"><a href="registered.jsp" class="fluid-link" id="to-register">注册</a></span>
    </div>
</form>

<script>
    function countAll() {
        var userAccount = $('#userAccount').val();
        var userPassword = $('#userPassword').val();

        $.ajax({
            url: "${pageContext.request.contextPath}/User/login",
            type: "POST",
            cache: false,
            data: {userAccount: userAccount,
                userPassword: userPassword},
            success: function(datas){
                alert(datas)

            }
        error: function(result, status) {
                if (status == 'error') {
                    alert("系统发生错误");
                }
            }
        });

    }

</script>



</body>
</html>