<%-- 
    Document   : forgotPassword
    Created on : Feb 10, 2022, 10:50:26 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Forget password<h1>
        <form action="login" method="Post">
        <div class="login-box">
            <h1>Email</h1>
            <div class="textbox">
                <i class="fas fa-user"></i>
                <input type="text" placeholder="Username" name="username">
                <di> <a href="login.jsp">try to Login?</a></di>
                <input type="submit" class="btn" value="Send Code">
            </div>            
    </form>
    </body>
</html>
