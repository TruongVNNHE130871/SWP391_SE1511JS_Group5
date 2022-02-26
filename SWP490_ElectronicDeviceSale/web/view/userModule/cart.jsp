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
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
<!--        <link href="${url}/css/cart.css" rel="stylesheet" type="text/css"/>-->
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
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->

    <!-- catg header banner section -->
    <section id="">
        <img src="${url}/images/banner-cart.png" alt="banner giỏ hàng">
        <div class="container">
            <h2>Giỏ hàng</h2>
            <ol class="breadcrumb">
                <li> <a href="${pageContext.request.contextPath}/HomePageController">Trang chủ </a></li>
                <li style="color:#fff">Thông tin giỏ hàng</li>
            </ol>
        </div>
    </section>
    <!-- / catg header banner section -->
    <!-- Cart view section -->
    <section id="">
        <div class="container">
            <form action="${pageContext.request.contextPath}/view/client/cart-update" method="post">
                <div class="">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Bỏ chọn</th>
                                <th>Hình ảnh</th>
                                <th>Tên Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Giảm giá</th>
                                <th>Thành Tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${order.items}" var="item">
                                <tr>
                                    <td><a class="" href="${pageContext.request.contextPath}/cart-delete?id=${item.product.id}"><fa class="fa fa-close"></fa></a></td>
                                    <td><a href="${pageContext.request.contextPath}/product-detail?id=${item.product.id}"><img src="${url}/images/products/img-test/${item.product.image_link}" alt="img${item.product.name }"></a></td>
                                    <td><a class="" href="${pageContext.request.contextPath}/product-detail?id=${item.product.id}">${item.product.name }</a></td>
                                    <td>${item.product.price} VNĐ</td>
                                    <td><input class="" type="number" name="${item.product.id}" value="${item.qty}" min=1></td>
                                    <td>${item.product.discount} %</td>
                                    <td>${item.price}00 VNĐ</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="6" class=""><strong>TỔNG TIỀN</strong></td>
                                <td><strong>${sumprice} VNĐ</strong></td>
                            </tr>
                            <tr>
                                <td colspan="7" class="">
                                    <input class="aa-cart-view-btn" type="submit" value="Cập nhật giỏ hàng">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
            <!-- Cart Total view -->
            <div class="">
                <h4>Thông tin giỏ hàng</h4>
                <table class="">
                    <tbody>
                        <tr>
                            <th>Tạm tính</th>
                            <td>${sumprice} VNĐ</td>
                        </tr>
                        <tr>
                            <th>VAT</th>
                            <td>0 VNĐ</td>
                        </tr>
                        <tr>
                            <th>Tổng cộng</th>
                            <td><strong>${sumprice} VNĐ</strong></td>
                        </tr>
                    </tbody>
                </table>
                <a href="${pageContext.request.contextPath}/checkout" class="">Thanh toán</a>
            </div>
        </div>
    </section>
    <!-- / Cart view section -->

    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
</html>
