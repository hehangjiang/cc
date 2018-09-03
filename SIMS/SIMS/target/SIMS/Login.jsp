<%--
  Created by IntelliJ IDEA.
  User: lv
  Date: 17/9/9
  Time: 下午11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <title>彩码自助访客系统</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />

    <link rel="stylesheet" href="css/login.css" />
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
<h2 class="login-title">彩码自助系统</h2>
<div id="loginbox">
    <form id="loginform" class="form-vertical" action="${pageContext.request.contextPath}/User/login.actionf?">
        <h3>登录</h3>
        <br>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="text" name="userAccount" placeholder="用户名" />
                </div>
            </div>
        </div>
        <br>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="password" name="userPassword" placeholder="密码" />
                </div>
            </div>
        </div>
        <br>
        <div class="form-actions">
            <span class="pull-left"><a class="flip-link" id="to-recover">忘记</a></span>
            <span class="pull-center"><input type="submit" id="login" class="btn btn-inverse" value="登录" /></span>
            <span class="pull-right"><a href="registered.jsp" class="fluid-link" id="to-register">注册</a></span>
        </div>
    </form>
    <form id="recoverform" action="#" class="form-vertical" >
        <p>Enter your e-mail address below and we will send you instructions how to recover a password.</p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="text" placeholder="E-mail address" />
                </div>
            </div>
        </div>
        <div class="form-actions forgetPassword">
            <span class="pull-left"><a href="#" class="flip-link" id="recover-to-login">&lt; Back to login</a></span>
            <span class="pull-right"><input type="submit" class="btn btn-inverse" value="Recover" /></span>
        </div>
    </form>

    <form id="registerform" action="#" class="form-vertical" >
        <p>register</p>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="text" placeholder="E-mail address" />
                </div>
            </div>
        </div>
        <br>
        <div class="form-actions register">
            <span class="pull-left"><a href="#" class="flip-link" id="to-login">&lt; Back to login</a></span>
            <span class="pull-right"><input type="submit" class="btn btn-inverse" value="Register" /></span>
        </div>
    </form>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/login.js"></script>

</body>
</html>
