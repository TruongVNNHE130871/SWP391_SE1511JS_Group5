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
        <title>Check outs</title>
        <link href="${url}/css/checkout.css" rel="stylesheet" type="text/css"/>
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

    <body>
        <div  id="content">
            <!-- Start banner -->
            <div class="image-parent">
                <img src="${url}/images/banner-cart.png" alt="" height="350px" width="100%" class="">
                <div class="title-image">
                    <p class="text-cart text-white text-center">Thanh Toán</p>
                    <p>
                        <a href="${pageContext.request.contextPath}/HomePageController">Trang Chủ /</a>
                        <a style="color:#fff"> Thông Tin Thanh Toán</a>
                    </p>
                </div>
            </div>
            <!--End banner  -->

        </div>
        <div class="container mt-5">
            <div class="row">
                <div class="col-7 form-ship">
                    <p>Địa chỉ giao hàng</p>
                    <form action="">
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Họ Tên*">
                        </div>
                        <div class="form-group row mb-3">
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Email*">
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Số Điện Thoại*">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                      placeholder="Địa Chỉ*"></textarea>
                        </div>
                        <div class="form-group mb-5">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                      placeholder="Ghi Chú*"></textarea>
                        </div>
                    </form>
                </div>
                <div class="col-5">
                    <div class="infor-order">
                        <p style="color: rgba(163, 23, 23, 0.904);">Thông tin đơn hàng</p>
                        <table>
                            <tr>
                                <th>Sản Phẩm</th>
                                <th>Số Tiền</th>
                            </tr>
                            <tr>
                                <td>x1</td>
                                <td>12.600 VNĐ</td>
                            </tr>
                            <tr>
                                <th>Tạm Tính</th>
                                <td>12.600 VNĐ</td>
                            </tr>
                            <tr>
                                <th>Thuế</th>
                                <td>0</td>
                            </tr>
                            <tr>
                                <th>Tổng Cộng</th>
                                <th>12.600 VNĐ</th>
                            </tr>
                        </table>
                    </div>
                    <div class="payments">
                        <p style="color: rgba(163, 23, 23, 0.904);">Hình Thức Thanh Toán</p>
                        <div class="form-order-payment">
                              <input type="radio" id="html" name="fav_language" value="">
                              <label for="cod">Thanh toán khi nhận hàng (COD)</label><br>
                            <button class="btn-payments mt-3"> Đặt hàng </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
