<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-21        1.0         VinhNT         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="${url}/css/cart.css" rel="stylesheet" type="text/css"/>
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
        <style>
            table, th, td {
                border: 1px solid rgb(230, 230, 230);
                border-collapse: collapse;
                text-align: center;
                background-color: #F8F8F8;
                padding: 20px;
            }
        </style>
    </head>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->


    <!-- Cart view section -->
    <body>

        <!-- Start banner -->
        <div  id="content">
            <div class="image-parent">
                <img src="${url}/images/banner-cart.png" alt="" height="350px" width="100%" class="">
                <div class="title-image">
                    <p class="text-cart text-white text-center">Giỏ Hàng</p>
                    <p>
                        <a href="${pageContext.request.contextPath}/HomePageController">Trang Chủ /</a>
                        <a style="color:#fff"> Thông Tin Giỏ Hàng</a>
                    </p>
                </div>
            </div>

            <!--End banner  -->
            <div class="container-table">
                <form action="${pageContext.request.contextPath}/UpdateCartController" method="post">
                    <table style="width:100%">
                        <thead>
                            <tr>
                                <th>Xóa Sản Phẩm</th>
                                <th>Hình Ảnh</th>
                                <th>Tên Sản Phẩm</th>
                                <th>Giá</th>
                                <th>Số Lượng</th>
                                <th>Giảm Giá</th>
                                <th>Thành Tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${cart.items}" var="item">
                                <tr>
                                    <td><a class="remove-link" href="${pageContext.request.contextPath}/DeleteToCart?id=${item.product.id}">X</a></td>
                                    <td><a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${item.product.id}"><img src="${item.product.image}" alt="img${item.product.name }" width="100" height="100"></a></td>
                                    <td><a class="aa-cart-title" href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${item.product.id}">${item.product.name }</a></td>
                                    <td>${item.product.price} VNĐ</td>
                                    <td><input class="input-quantity" type="number" name="${item.product.id}" value="${item.qty}" min=1></td>
                                    <td>${item.product.discount} %</td>
                                    <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> VNĐ</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="6" class=""><strong>TỔNG TIỀN</strong></td>
                                <td><strong>${sumprice} VNĐ</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <button class="update-cart" type="submit">Cập Nhật Giỏ Hàng</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>

                <hr>
                <div class="infor-cart text-center">
                    <p class="text-center fs-3">Thông Tin Giỏ Hàng</p>
                    <table class="mx-auto" width="60%">
                        <tr>
                            <th>Tạm Tính</th>
                            <td>${sumprice} VNĐ</td>
                        </tr>
                        <tr>
                            <th>VAT</th>
                            <td>0 VND</td>
                        </tr>
                        <tr>
                            <th>Tổng Cộng</th>
                            <td><strong>${sumprice} VNĐ</strong></td>
                        </tr>
                        <tr><td colspan="2"><a href="${pageContext.request.contextPath}/PaymentController" class="update-cart mt-5 text-decoration-none">Thanh Toán</a></td></tr>
                    </table>
                </div>
            </div>
        </div>


    </body>
    <!-- / Cart view section -->

    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
</html>
