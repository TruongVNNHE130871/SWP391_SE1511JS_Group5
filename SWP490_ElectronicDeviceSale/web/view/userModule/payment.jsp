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
        <form action="${pageContext.request.contextPath}/PaymentController" method="post">
            <div class="container mt-5">
                <div class="row">
                    <div class="col-7 form-ship">
                        <p>Địa chỉ giao hàng</p>

                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Họ Tên*" required="required" name="payment_name">
                        </div>
                        <div class="form-group row mb-3">
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Email*"  required="required" name="payment_email">
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control" placeholder="Số Điện Thoại*" required="required" name="payment_phone">
                            </div>
                        </div>
                        <div class="form-group mb-3">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                      placeholder="Địa Chỉ*" required="required" name="payment_address"></textarea>
                        </div>
                        <div class="form-group mb-5">
                            <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                      placeholder="Ghi Chú*" name="payment_notr"></textarea>
                        </div>
                        <div class="form-group mb-5"style="display: none">
                            <input type="text" placeholder="userid_session" name="payment_usersession" value="${userName }"> 

                            <input type="text" placeholder="totalmoney_session" name="payment_amount" value="${sumprice}">   
                        </div>
                    </div>
                    <div class="col-5">
                        <div class="infor-order">
                            <p style="color: rgba(163, 23, 23, 0.904);">Thông tin đơn hàng</p>
                            <table>
                                <tr>
                                    <th>Sản Phẩm</th>
                                    <th>Số Tiền</th>
                                </tr>
                                <tbody>
                                    <c:forEach items="${cart.items}" var="item">
                                        <tr>
                                            <td>${item.product.name } <strong> x  ${item.qty}</strong></td>
                                            <td>${item.price}VNĐ</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>Tạm tính</th>
                                        <td>${sumprice} VNĐ</td>
                                    </tr>
                                    <tr>
                                        <th>Thuế</th>
                                        <td>0 VNĐ</td>
                                    </tr>
                                    <tr>
                                        <th>Tổng cộng</th>
                                        <td><strong>${sumprice} VNĐ</strong></td>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                        <div class="payments">
                            <p style="color: rgba(163, 23, 23, 0.904);">Hình Thức Thanh Toán</p>
                            <div class="form-order-payment">
                                  <input type="radio" id="html" name="payment"checked value="0" value="">
                                  <label for="cod">Thanh toán khi nhận hàng (COD)</label><br>
                                <button type="submit"class="btn-payments mt-3"> Đặt hàng </button>
                            </div>

                        </div>
                        <c:if test="${sessionScope.userName != null && sessionScope.cart == null}">
                            <br>
                            <p style="color: red">Bạn đã đặt hàng thành công!Bạn có thê tiếp tục mua hàng <a href="${pageContext.request.contextPath}/HomePageController" style="color: #754110">tại đây!</a></p>
                        </c:if>
                    </div>
                </div>
            </div>
        </form>      

    </body>
</html>
