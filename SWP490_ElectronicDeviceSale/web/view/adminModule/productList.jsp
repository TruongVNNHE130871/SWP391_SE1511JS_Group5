<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-28        1.0         BinhDV         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${url}/css/productList.css" rel="stylesheet" type="text/css"/>
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
        <script>
            function doDelete(id) {
                var confirmDelete = confirm("Do you want to delete?");
                if (confirmDelete) {
                    window.location.href = "ProductDeleteController?productID=" + id;
                }
            }

            function doUpdate(id) {
                var confirmDelete = confirm("Do you want to update?");
                if (confirmDelete) {
                    window.location.href = "ProductUpdateController?productID=" + id;
                }
            }

            function doAdd() {
                window.location.href = "ProductInsertController";
            }
        </script>
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <title>Document</title>
        <style>
            .list-product{
                height: 880px;
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
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="list-product">
                    <button class="btn btn-outline-primary mb-4" onclick="doAdd();">Thêm Sản Phẩm</button>
                    <div class="list-product">
                        <div class="row">
                            <h1 class="col">Danh sách sản phẩm </h1>
                            <form action="ProductListController" method="POST">
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
                                    <!--<th scope="col">Mã Sản Phẩm</th>-->
                                    <th scope="col">Tên Sản Phẩm</th>
                                    <th scope="col">Ảnh</th>
                                    <th scope="col">Danh Mục</th>
                                    <th scope="col">Giá</th>
                                    <th scope="col">Trạng Thái</th>
                                    <th scope="col">Giảm Giá</th>
                                    <th scope="col">Ngày Tạo</th>
                                    <th>
                                        <div class="select-input">
                                            <c:if test="${priceIndex == -1}">
                                                <span class="select-input__label">Giá</span>
                                            </c:if>
                                            <c:if test="${priceIndex == 1}">
                                                <span class="select-input__label select-input__label--active">Giá: Thấp đến Cao</span>
                                            </c:if>
                                            <c:if test="${priceIndex == 2}">
                                                <span class="select-input__label select-input__label--active">Giá: Cao đến Thấp</span>
                                            </c:if>
                                            <i class="select-input__icon fas fa-angle-down"></i>
                                            <ul class="select-input__list">
                                                <li class="select-input__item">
                                                    <a href="${pageContext.request.contextPath}/ProductListController?keyword=${sessionScope.keyword}&priceIndex=-1#menu" class="select-input__item-link">Tất Cả</a>
                                                </li>
                                                <li class="select-input__item">
                                                    <a href="${pageContext.request.contextPath}/ProductListController?keyword=${sessionScope.keyword}&priceIndex=1#menu" class="select-input__item-link">Giá: Thấp đến Cao</a>
                                                </li>
                                                <li class="select-input__item">
                                                    <a href="${pageContext.request.contextPath}/ProductListController?keyword=${sessionScope.keyword}&priceIndex=2#menu" class="select-input__item-link">Giá: Cao đến Thấp</a>
                                                </li>
                                            </ul>
                                        </div>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${requestScope.products}" var="p">
                                <input type="hidden" value="${p.id}" name="productID"/>
                                <tr class="align-middle text-product">

                                    <td>
                                        ${p.name}
                                    </td>
                                    <td>
                                        <img src="${p.image}" alt="" width="60" height="60">
                                    </td>
                                    <td>
                                        ${p.c.id}
                                    </td>
                                    <td>
                                        ${p.price}
                                    </td>
                                    <td>${p.status ? "Available" : "Unavailable"}</td>
                                    <td>${p.discount}</td>
                                    <td>${p.created}</td>
                                    <td>
                                        <button type="submit" onclick="doUpdate(${p.id});" class="btn btn-outline-success text-up-dlt">Cập nhật</button>
                                        <button type="submit" onclick="doDelete(${p.id});" class="btn btn-outline-danger text-up-dlt">Xóa</button>
                                    </td>
                                </tr>           
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="product-filter__page">
                    <span class="product-filter__page-num">
                        <span class="product-filter__page-current">${requestScope.pageindex}</span>/${requestScope.totalpage}
                    </span>
                    <div class="product-filter__page-control">
                        <a href="${pageContext.request.contextPath}/ProductListController?keyword=${sessionScope.keyword}&priceIndex=${priceIndex}&page=${requestScope.pageindex - 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                            <i class="product-filter__page-icon fas fa-angle-left"></i>
                        </a>
                        <a href="${pageContext.request.contextPath}/ProductListController?keyword=${sessionScope.keyword}&priceIndex=${priceIndex}&page=${requestScope.pageindex + 1}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                            <i class="product-filter__page-icon fas fa-angle-right"></i>
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </body>
    <script src="assets/js/pager.js" type="text/javascript"></script>
    <script>
                                            generatePagger('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2);
    </script>
</html>
