<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/19
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <!--上传图片、文件的代码-->
    <form action="${pageContext.request.contextPath}/uploads" method="post" enctype="multipart/form-data" >
        <input type="file" name="file">
        <input type="submit">
    </form>
    <!--接收-->
    <img src="${pageContext.request.contextPath}/${img}"/>
</body>
</html>
