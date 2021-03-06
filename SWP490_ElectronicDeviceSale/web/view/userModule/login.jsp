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
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <link href="${url}/css/login.css" rel="stylesheet" type="text/css"/>
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
    </head>
    <!--Start logo header left-->
    <header>
        <div class="img-header bg-light">
            <a href="${pageContext.request.contextPath}/HomePageController">
                <img src="${url}/images/logo-header.png" alt="" width="150" height="100" 
                     class="ms-5"></a><span class="title-logo fs-2 mx-2">Đăng nhập</span>
        </div>
    </header>
    <!--End logo header left-->
    <body>

        <div class="container">
            <div class="row">
                <!-- Start logo banner left  -->
                <div class="col-6">
                    <div class="img-logo-left">
                        <img src="${url}/images/logo-header.png" alt="" width="400" height="300">
                        <p class="title-logo-body">Nền tảng thương mại điện tử <br> phổ biến nhất trên thế giới </p>
                    </div>
                </div>
                <!-- End logo banner left  -->
                <!-- Start login form -->
                <div class="col-6">
                    <form action="LoginController" method="Post" style="align-items: center;" class="edit-login">
                        <div class="form-login">
                            <p class="title-login text-center my-2">Đăng nhập</p>
                            <div class="form-group">
                                <input  type="text" placeholder="Tài khoản*" name="username" value="${inputUsername}"class="form-control mb-3"
                                        maxlength="50">
                            </div>
                            <div class="form-group mb-3">
                                <input id="password"type="password" placeholder="Mật khẩu*" name="password" value="${inputPassword}"class="form-control"
                                       maxlength="50">
                                <img onclick="myfunction()" src="${url}/images/eye.png"> Hiện mật khẩu
                            </div>
                            <!-- Error message -->
                            <p style="color:red; display:block">${errorMsg}
                                <!-- /Error message -->
                            </p>
                            <div class="form-group mb-3 text-center">
                                <a href="${pageContext.request.contextPath}/forgetPassword" class="color-link">Bạn quên mật khẩu?</a>
                            </div>
                            <div class="form-group text-center mb-3">
                                <button type="submit" class="btn btn-outline-success">Đăng nhập</button>
                            </div>
                            <p class="text-singup text-center">Lần đầu bạn truy cập? <a href="${pageContext.request.contextPath}/SignUp">Tạo tài khoản</a></p>
                        </div>
                    </form>
                </div>
                <!-- End login form -->
            </div>
        </div>
        <script type="text/javascript">
            var x = true;
            function myfunction() {
                if (x) {
                    document.getElementById('password').type = "text";
                    x = false;
                } else {
                    document.getElementById('password').type = "password";
                    x = true;
                }
            }
        </script>
    </body>
</html>
