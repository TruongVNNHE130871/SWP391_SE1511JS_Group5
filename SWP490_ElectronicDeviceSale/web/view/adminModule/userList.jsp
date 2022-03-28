<<<<<<< Updated upstream


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${url}/css/stylelistuser.css">
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
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <title>Danh sách người dùng</title>
        <style>
            .list-product{
                height: 600px;
            }
            .order-empty-container{
                width: 100%;
                height: 600px;
                text-align: center;
            }

            .order-empty{
                box-shadow: 0 1px 1px 0 rgb(0 0 0 / 5%);
                border-radius: 0.125rem;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100%;
                background: #fff;
            }

            .order-empty-icon{
                background-position: 50%;
                background-size: contain;
                background-repeat: no-repeat;
                width: 100px;
                height: 100px;
                background-image: url(https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/assets/5fafbb923393b712b96488590b8f781f.png);
            }

            .order-empty-text{
                margin: 20px 0 0;
                font-size: 18px;
                line-height: 1.4;
                color: rgba(0,0,0,.8);
            }

            .box-search-order{
                width: 30%;
                margin: auto;
            }
            .product-filter__page {
                display: flex;
                align-items: center;
                margin-left: auto;
            }

            .product-filter__page-num {
                font-size: 0.9375rem;
                color: #333;
                margin-right: 22px;
            }

            .product-filter__page-current {
                color:  #ee4d2d;
            }

            .product-filter__page-control {
                border-radius: 0.5rem;
                overflow: hidden;
                display: flex;
                width: 72px;
                height: 36px;
                border: 1px solid;
            }

            .product-filter__page-btn {
                flex: 1;
                background-color: #fff;
                display: flex;
                text-decoration: none;
            }

            .product-filter__page-btn:first-child {
                border-right: 1px solid black;
            }

            .product-filter__page-btn--disabled {
                background-color: #f9f9f9;
                cursor: default;
                pointer-events: none;
            }

            .product-filter__page-btn--disabled .product-filter__page-icon {
                color: #ccc;
                pointer-events: none;
            }

            .product-filter__page-icon {
                margin: auto;
                font-size: 0.875rem;
                color: #555;
            }

            .select-input {
                position: relative;
                min-width: 100px;
                padding: 0 12px;
                background-color: #fff;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 0.5rem;
                z-index: 1;
                border: 1px solid;
            }

            .select-input:hover .select-input__list {
                display: block;
                animation: fadeIn ease-out 0.4s;
            }

            .select-input__label {
                font-size: 0.875rem;
            }

            .select-input__label--active{
                color:  #ff7800;
            }

            .select-input__icon {
                font-size: 1.25rem;
                color: #616060;
                position: relative;
            }

            .select-input__list {
                position: absolute;
                left: 0;
                right: 0;
                top: calc(100% + 1px);
                border-radius: 2px;
                background-color: #fff;
                padding: 9px 16px;
                display: none;
                margin: 0;
                box-shadow: 0 1px 2rem 0 rgba(0, 0, 0, 0.2);
            }

            .select-input__item {
                list-style: none;
            }

            .select-input__item-link {
                text-decoration: none;
                display: block;
                padding: 9px 0;
                font-size: 0.9375rem;
                color: #000;
                border-radius: 2px;
            }

            .select-input__item-link:hover {
                color:  #ff7800;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .btn-search{
                padding: 0 15px;
                background-color: black;
                color: #fff;
                border: none;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;

            }
        </style>
    </head>
    <!--Start side bar-menu-->
    <jsp:include page = "./sideBar.jsp" />
    <!--End side bar -menu-->
    <body>
        <div class="container mt-5">
            <div class="list-product">
                <!--                <form method="Post">
                                    <input type="input" placeholder="Tên tài khoản người dùng" class="form-control mb-4" name="search">
                                    <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
                                </form>-->
                <p class="fs-5 fw-bold">Danh sách người dùng: </p>
                <form action="UserListController" method="POST">
                    <div class="col-5 my-3 d-flex form-search m-0 me-5">
                        <input type="text" size="35" name="keyword" value="${sessionScope.keyword}" placeholder="Tìm theo tên tài khoản"/>
                        <button type="submit" class="btn-search">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </button>
                    </div>
                </form>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <!--<th scope="col">Mã</th>-->
                            <th scope="col">Họ Tên</th>
                            <th scope="col">Tài khoản</th>
                            <th scope="col">Mật khẩu</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Email</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">

                                <div class="select-input">
                                    <c:if test="${statusIndex == -1}">
                                        <span class="select-input__label">Tất Cả</span>
                                    </c:if>

                                    <c:if test="${statusIndex == 1}">
                                        <span class="select-input__label select-input__label--active">Hoạt Động</span>
                                    </c:if>
                                    <c:if test="${statusIndex == 0}">
                                        <span class="select-input__label select-input__label--active">Bị Cấm</span>
                                    </c:if>
                                    <i class="select-input__icon fas fa-angle-down"></i>
                                    <ul class="select-input__list">
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=-1#menu" class="select-input__item-link">Tất Cả</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=1#menu" class="select-input__item-link">Hoạt Động</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=0#menu" class="select-input__item-link">Bị Cấm</a>
                                        </li>
                                    </ul>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${requestScope.users}" var= "users">
                            <tr>                           
                                <td>
                                    ${users.name}
                                </td>
                                <td>
                                    ${users.userName}
                                </td>
                                <td>
                                    ${users.passWord}
                                </td>
                                <td>
                                    <c:if test = "${users.gender == true}">Nam</c:if>
                                    <c:if test = "${users.gender == false}">Nữ</c:if>                         
                                    </td>
                                    <td>
                                    ${users.phone}
                                </td>
                                <td>
                                    ${users.email}
                                </td>
                                <td>
                                    <c:if test = "${users.status == true}">
                                        <span style="color: #50D050;">Hoạt động</span>
                                    </c:if>
                                    <c:if test = "${users.status == false}">
                                        <span style="color: #FF0A0A;">Bị cấm</span>
                                    </c:if>  
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/ViewUserDetailController?idUser=${users.id}">Xem chi tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="product-filter__page">
                <span class="product-filter__page-num">
                    <span class="product-filter__page-current">${requestScope.pageindex}</span>/${requestScope.totalpage}
                </span>
                <div class="product-filter__page-control">
                    <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=${statusIndex}&page=${requestScope.pageindex - 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                        <i class="product-filter__page-icon fas fa-angle-left"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=${statusIndex}&page=${requestScope.pageindex + 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                        <i class="product-filter__page-icon fas fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
=======


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${url}/css/stylelistuser.css">
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
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <title>Danh sách người dùng</title>
        <style>
            .list-product{
                height: 600px;
            }
            .order-empty-container{
                width: 100%;
                height: 600px;
                text-align: center;
            }

            .order-empty{
                box-shadow: 0 1px 1px 0 rgb(0 0 0 / 5%);
                border-radius: 0.125rem;
                overflow: hidden;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                width: 100%;
                height: 100%;
                background: #fff;
            }

            .order-empty-icon{
                background-position: 50%;
                background-size: contain;
                background-repeat: no-repeat;
                width: 100px;
                height: 100px;
                background-image: url(https://deo.shopeemobile.com/shopee/shopee-pcmall-live-sg/assets/5fafbb923393b712b96488590b8f781f.png);
            }

            .order-empty-text{
                margin: 20px 0 0;
                font-size: 18px;
                line-height: 1.4;
                color: rgba(0,0,0,.8);
            }

            .box-search-order{
                width: 30%;
                margin: auto;
            }
            .product-filter__page {
                display: flex;
                align-items: center;
                margin-left: auto;
            }

            .product-filter__page-num {
                font-size: 0.9375rem;
                color: #333;
                margin-right: 22px;
            }

            .product-filter__page-current {
                color:  #ee4d2d;
            }

            .product-filter__page-control {
                border-radius: 0.5rem;
                overflow: hidden;
                display: flex;
                width: 72px;
                height: 36px;
                border: 1px solid;
            }

            .product-filter__page-btn {
                flex: 1;
                background-color: #fff;
                display: flex;
                text-decoration: none;
            }

            .product-filter__page-btn:first-child {
                border-right: 1px solid black;
            }

            .product-filter__page-btn--disabled {
                background-color: #f9f9f9;
                cursor: default;
                pointer-events: none;
            }

            .product-filter__page-btn--disabled .product-filter__page-icon {
                color: #ccc;
                pointer-events: none;
            }

            .product-filter__page-icon {
                margin: auto;
                font-size: 0.875rem;
                color: #555;
            }

            .select-input {
                position: relative;
                min-width: 100px;
                padding: 0 12px;
                background-color: #fff;
                display: flex;
                justify-content: space-between;
                align-items: center;
                border-radius: 0.5rem;
                z-index: 1;
                border: 1px solid;
            }

            .select-input:hover .select-input__list {
                display: block;
                animation: fadeIn ease-out 0.4s;
            }

            .select-input__label {
                font-size: 0.875rem;
            }

            .select-input__label--active{
                color:  #ff7800;
            }

            .select-input__icon {
                font-size: 1.25rem;
                color: #616060;
                position: relative;
            }

            .select-input__list {
                position: absolute;
                left: 0;
                right: 0;
                top: calc(100% + 1px);
                border-radius: 2px;
                background-color: #fff;
                padding: 9px 16px;
                display: none;
                margin: 0;
                box-shadow: 0 1px 2rem 0 rgba(0, 0, 0, 0.2);
            }

            .select-input__item {
                list-style: none;
            }

            .select-input__item-link {
                text-decoration: none;
                display: block;
                padding: 9px 0;
                font-size: 0.9375rem;
                color: #000;
                border-radius: 2px;
            }

            .select-input__item-link:hover {
                color:  #ff7800;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            .btn-search{
                padding: 0 15px;
                background-color: black;
                color: #fff;
                border: none;
                border-top-right-radius: 5px;
                border-bottom-right-radius: 5px;

            }
        </style>
    </head>
    <!--Start side bar-menu-->
    <jsp:include page = "./sideBar.jsp" />
    <!--End side bar -menu-->
    <body>
        <div class="container mt-5">
            <div class="list-product">
                <!--                <form method="Post">
                                    <input type="input" placeholder="Tên tài khoản người dùng" class="form-control mb-4" name="search">
                                    <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
                                </form>-->
                <p class="fs-5 fw-bold">Danh sách người dùng: </p>
                <form action="UserListController" method="POST">
                    <div class="col-5 my-3 d-flex form-search m-0 me-5">
                        <input type="text" size="35" name="keyword" value="${sessionScope.keyword}" placeholder="Tìm theo tên tài khoản"/>
                        <button type="submit" class="btn-search">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                            </svg>
                        </button>
                    </div>
                </form>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <!--<th scope="col">Mã</th>-->
                            <th scope="col">Họ Tên</th>
                            <th scope="col">Tài khoản</th>
                            <th scope="col">Mật khẩu</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Email</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">

                                <div class="select-input">
                                    <c:if test="${statusIndex == -1}">
                                        <span class="select-input__label">Tất Cả</span>
                                    </c:if>

                                    <c:if test="${statusIndex == 1}">
                                        <span class="select-input__label select-input__label--active">Hoạt Động</span>
                                    </c:if>
                                    <c:if test="${statusIndex == 0}">
                                        <span class="select-input__label select-input__label--active">Bị Cấm</span>
                                    </c:if>
                                    <i class="select-input__icon fas fa-angle-down"></i>
                                    <ul class="select-input__list">
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=-1#menu" class="select-input__item-link">Tất Cả</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=1#menu" class="select-input__item-link">Hoạt Động</a>
                                        </li>
                                        <li class="select-input__item">
                                            <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=0#menu" class="select-input__item-link">Bị Cấm</a>
                                        </li>
                                    </ul>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${requestScope.users}" var= "users">
                            <tr>                           
                                <td>
                                    ${users.name}
                                </td>
                                <td>
                                    ${users.userName}
                                </td>
                                <td>
                                    ${users.passWord}
                                </td>
                                <td>
                                    <c:if test = "${users.gender == true}">Nam</c:if>
                                    <c:if test = "${users.gender == false}">Nữ</c:if>                         
                                    </td>
                                    <td>
                                    ${users.phone}
                                </td>
                                <td>
                                    ${users.email}
                                </td>
                                <td>
                                    <c:if test = "${users.status == true}">
                                        <span style="color: #50D050;">Hoạt động</span>
                                    </c:if>
                                    <c:if test = "${users.status == false}">
                                        <span style="color: #FF0A0A;">Bị cấm</span>
                                    </c:if>  
                                </td>
                                <td>
                                    <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/ViewUserDetailController?idUser=${users.id}">Xem chi tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="product-filter__page">
                <span class="product-filter__page-num">
                    <span class="product-filter__page-current">${requestScope.pageindex}</span>/${requestScope.totalpage}
                </span>
                <div class="product-filter__page-control">
                    <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=${statusIndex}&page=${requestScope.pageindex - 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                        <i class="product-filter__page-icon fas fa-angle-left"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/UserListController?keyword=${sessionScope.keyword}&statusIndex=${statusIndex}&page=${requestScope.pageindex + 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                        <i class="product-filter__page-icon fas fa-angle-right"></i>
                    </a>
                </div>
            </div>
        </div>
    </body>
</html>
>>>>>>> Stashed changes
