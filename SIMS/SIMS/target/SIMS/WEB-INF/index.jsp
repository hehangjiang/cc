<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <title>留学生信息管理系统</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/bootstrap-responsive.min.css" />

    <link rel="stylesheet" href="css/login.css" />
</head>

<h2 class="login-title">留学生信息管理系统</h2>
<div id="loginbox">
    <form id="loginform" class="form-vertical" action="User/login" method="post" >
        <h3>Login</h3>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="text" placeholder="Username" name="userName"/>
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="input-prepend">
                    <input type="password" placeholder="Password" name="userPwd" />
                </div>
            </div>
        </div>

        <div class="form-actions">
            <span class="pull-center"><input type="submit" class="btn btn-inverse" value="Login" /></span>
        </div>
    </form>
</div>

<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/login.js"></script>
</body>
</html>