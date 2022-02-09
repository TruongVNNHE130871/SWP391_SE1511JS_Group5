<%-- 
    Document   : homePage
    Created on : Feb 10, 2022, 3:30:39 AM
    Author     : soide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/userModule/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login </title>
        <link rel="stylesheet" href="../userModule/assets/css/login.css" />
    </head>

    <form action="login" method="Post">
        <div class="login-box">
            <h1>Login</h1>
            <div class="textbox">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="username">
            </div>
            <div class="textbox">
                <i class="fas fa-lock"></i>
                <input type="password" placeholder="Password" name="password">
            </div>
            <div><p style="display: block"><input type="checkbox" id="rememberme">Remember me</p> </div>
            <input type="submit" class="btn" value="Login">
            <di> <a href="">Forgot Password</a></di>
        </div>
    </form>
</body>
</html>
