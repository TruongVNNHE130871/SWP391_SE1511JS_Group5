<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/userModule/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="assets/css/login.css" rel="stylesheet" type="text/css"/>
    </head>

    <body>
        <!-- Login form -->
        <form action="LoginController" method="Post">
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
                <div><p style="display: block"><input type="checkbox" name="remember">Remember me</p> </div>
                <!-- Error message -->
                <p style="color:red; display:block">${errorMsg}
                    <!-- /Error message -->
                </p>
                <input type="submit" class="btn" value="Login">
                <div> <a href="">Forgot password</a></div>
                <div> <a href="${pageContext.request.contextPath}/HomePageController">Back to home</a></div>
            </div>
        </form>
        <!-- /Login form -->
    </body>
</html>
