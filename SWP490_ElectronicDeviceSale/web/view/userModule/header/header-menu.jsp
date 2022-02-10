<%-- 
    Document   : menu
    Created on : Feb 8, 2022, 9:01:55 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
        <link href="../../../assets/css/stylemenu.css" rel="stylesheet" type="text/css"/>
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
    <body>
        <div class="container-fluid bg-danger " id="header">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-2">

                    <img src="${url}/images/logo.png" alt="" width="150" height="60">

                </div>
                <div class="col-5 mt-3 ">
                    <input type="text" size="40">
                    <button>Search</button>
                </div>

                <div class="col-2 mt-3 text-white">Cart</div>

                <c:if test="${sessionScope.username != null}">
                    <p class="col-1 mt-3 text-white"><strong>Hello</strong> ${username }</p>
                    <a href="${pageContext.request.contextPath}/LogOutController" class="col-1 mt-3 text-white hidden-xs">Logout</a>
                </c:if>
                    
                <c:if test="${sessionScope.username == null}">
                    <a href="${pageContext.request.contextPath}/view/client/register" 
                       class="col-1 mt-3 text-white hidden-xs" >SignUp</a>
                    <a href="${pageContext.request.contextPath}/LoginController"
                       class="col-1 mt-3 text-white">Login</a>
                </c:if>

            </div>
            <div class="row text-center bg-dark text-white mt-1">
                <div class="col-2"><a href="" class="category-link">Điện Thoại</a></div>
                <div class="col-2"><a href="" class="category-link">Laptop </a></div>
                <div class="col-2"><a href="" class="category-link">PC </a></div>
                <div class="col-2"><a href="" class="category-link">Phụ kiện </a></div>
                <div class="col-2"><a href="" class="category-link">Linh kiện </a></div>
                <div class="col-2"><a href="" class="category-link">Khuyến mại</a></div>
            </div>
        </div>
    </body>

</html>
