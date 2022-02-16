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
        <div class="container-fluid bg-light" id="header">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-2">
                    <img src="${url}/images/logo-header.png" alt="" width="150" height="60">
                </div>
                <div class="col-5 mt-3 ">
                    <input type="text" name="keyword" size="40" value="${requestScope.keyword}">
                    <button type="submit" class="btn-dark rounded px-3">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                        </svg>
                    </button>
                </div>

                <div class="col-1 mt-3">
                    <a class="link-cart">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
                        <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                        </svg>
                    </a>
                </div>

                <c:if test="${sessionScope.username != null}">

                    <p class="col-1 mt-3"><strong>Hello</strong> ${username }</p>
                    <a href="${pageContext.request.contextPath}/ViewProfileController" class="col-1 mt-3 hidden-xs">Profile</a>
                    <a href="${pageContext.request.contextPath}/LogOutController" class="col-1 mt-3 hidden-xs">Logout</a>
                </c:if>

                <c:if test="${sessionScope.username == null}">
                    <a href="${pageContext.request.contextPath}/SignUp" 
                       class="col-1 mt-3 hidden-xs" >SignUp</a>
                    <a href="${pageContext.request.contextPath}/LoginController"
                       class="col-1 mt-3">Login</a>
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
