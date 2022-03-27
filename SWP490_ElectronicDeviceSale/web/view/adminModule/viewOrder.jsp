<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-03-07        1.0         BinhDV         First Implement
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../assets/css/viewOrder.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <title>JSP Page</title>
        <style>
            .list-product{
                height: 640px;
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

        <script>
            function doDetail(id) {
                window.location.href = "OrderDetailController?orderDetailId=" + id;
            }

        </script>
    </head>
    <!--side bar-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="list-product">
                    <div class="row">
                        <h1 class="col">Danh sách đặt hàng </h1>
                        <form action="SearchOrderDetailController" method="POST">
                            <div class="col-5 my-3 d-flex form-search m-0 me-5">
                                <input type="text" size="35" name="keyword" value="${sessionScope.keyword}" placeholder="Tìm theo tên sản phẩm"/>
                                <button type="submit" class="btn-search">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                    </svg>
                                </button>
                            </div>
                        </form>
                    </div>
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <!--                                <th scope="col">STT</th>-->
                                <th scope="col">Tên</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa Chỉ</th>
                                <th scope="col">Lưu Ý</th>
                                <th scope="col">Tổng Cộng</th>
                                <th scope="col">Hình Thức Thanh Toán</th>
                                <th scope="col">Trạng Thái</th>
                                <th scope="col"> 
                                    <div class="select-input">
                                        <c:if test="${statusIndex == -1}">
                                            <span class="select-input__label">Tất cả</span>
                                        </c:if>
                                        <c:if test="${statusIndex == 1}">
                                            <span class="select-input__label select-input__label--active">Xác nhận</span>
                                        </c:if>
                                        <c:if test="${statusIndex == 2}">
                                            <span class="select-input__label select-input__label--active">Chờ lấy hàng</span>
                                        </c:if>
                                        <c:if test="${statusIndex == 3}">
                                            <span class="select-input__label select-input__label--active">Hoàn tất</span>
                                        </c:if>
                                        <c:if test="${statusIndex == 4}">
                                            <span class="select-input__label select-input__label--active">Đã huỷ</span>
                                        </c:if>
                                        <i class="select-input__icon fas fa-angle-down"></i>
                                        <ul class="select-input__list">
                                            <li class="select-input__item">
                                                <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=-1#menu" class="select-input__item-link">Tất cả</a>
                                            </li>
                                            <li class="select-input__item">
                                                <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=1#menu" class="select-input__item-link">Xác nhận</a>
                                            </li>
                                            <li class="select-input__item">
                                                <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=2#menu" class="select-input__item-link">Chờ lấy hàng</a>
                                            </li>
                                            <li class="select-input__item">
                                                <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=3#menu" class="select-input__item-link">Hoàn tất</a>
                                            </li>
                                            <li class="select-input__item">
                                                <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=4#menu" class="select-input__item-link">Đã huỷ</a>
                                            </li>
                                        </ul>
                                    </div>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.orderdetails}" var="od">
                                <tr>
                                    <!--<td scope="row"></td>-->
                                    <td>
                                        ${od.user_name}
                                    </td>
                                    <td>
                                        ${od.user_phone}
                                    </td>
                                    <td>
                                        ${od.user_mail}
                                    </td>
                                    <td>
                                        ${od.address}
                                    </td>
                                    <td>
                                        ${od.note}
                                    </td>
                                    <td>
                                        ${od.amount}
                                    </td>
                                    <td>
                                        ${od.payment}
                                    </td>
                                    <td>
                                        <c:if test="${od.status == 'Hoan tat'}">
                                            <span style="color: #198754;">Hoàn tất</span>
                                        </c:if>
                                        <c:if test="${od.status == 'Xac nhan'}">
                                            <span style="color: #212529;">Xác nhận</span>
                                        </c:if>
                                        <c:if test="${od.status == 'Da huy'}">
                                            <span style="color: #ee2c4a;">Đã huỷ</span>
                                        </c:if>
                                        <c:if test="${od.status == 'Cho lay hang'}">
                                            <span style="color: blue;">Đang giao hàng</span>
                                        </c:if>
                                    </td>
                                    <td>
                                        <div class="detail-deliver">
                                            <button type="submit" onclick="doDetail(${od.id});" class="btn btn-outline-success text-up-dlt">Chi tiết</button>
                                            <c:if test="${od.status == 'Xac nhan'}">

                                            </c:if>
                                        </div>
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
                        <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=${statusIndex}&page=${requestScope.pageindex - 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                            <i class="product-filter__page-icon fas fa-angle-left"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/ViewAllOrderController?statusIndex=${statusIndex}&page=${requestScope.pageindex + 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                            <i class="product-filter__page-icon fas fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>