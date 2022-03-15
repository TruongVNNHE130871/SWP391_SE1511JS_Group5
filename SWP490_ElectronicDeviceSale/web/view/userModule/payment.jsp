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
        <c:if test="${sessionScope.username != null && sessionScope.cart != null}">
            <form action="${pageContext.request.contextPath}/PaymentController" method="post">
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-7 form-ship">
                            <p style="color: rgba(163, 23, 23, 0.904);font-size:200%;text-align:center;">Địa chỉ giao hàng</p>

                            <div class="form-group mb-3">
                                <input type="text" class="form-control" placeholder="Họ Tên*" required="required" name="payment_name">
                            </div>
                            <div class="form-group row mb-3">
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="Email*"  name="payment_email" minlength="4"
                                           maxlength="40" 
                                           title="The domain portion of the email address is invalid (the portion after the @)." 
                                           pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$"
                                           required>
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="Số Điện Thoại*"  pattern="[0-9]{10}"
                                           required name="payment_phone">
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                          placeholder="Địa Chỉ*" required="required" name="payment_address"></textarea>
                            </div>
                            <div class="form-group mb-5">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                          placeholder="Ghi Chú*" name="payment_note"></textarea>
                            </div>
                            <div> <input type="date" placeholder="Password" name="payment_created" id="the-date" style="display: none">   </div>

                            <div class="form-group mb-5"style="display: none">
                                <input type="text" placeholder="userid_session" name="payment_usersession" value="${sessionScope.username}"> 

                                <input type="text" placeholder="totalmoney_session" name="payment_amount" value="${sumprice}">   
                            </div>
                        </div>
                        <div class="col-5">
                            <div>
                                <p style="color: rgba(163, 23, 23, 0.904);font-size:200%;">Thông tin đơn hàng</p>
                                <table>
                                    <tr>
                                        <th>Sản phẩm  </th>
                                        <th></th>
                                        <th>Số tiền </th>
                                    </tr>
                                    <tbody>
                                        <c:forEach items="${cart.items}" var="item">
                                            <tr>
                                                <td>${item.product.name } <strong> x  ${item.qty}</strong></td>
                                                <td> <img src="${item.product.image}" alt="" width="80" height="80"></td>
                                                <td><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" />VNĐ</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Tạm tính</th>
                                            <th></th>
                                            <td>${sumprice} VNĐ</td>
                                        </tr>
                                        <tr>
                                            <th>Phí giao hàng</th>
                                            <th></th>
                                            <td>0 VNĐ</td>
                                        </tr>
                                        <tr>
                                            <th>Tổng cộng</th>
                                            <th></th>
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

                        </div>
                    </div>
                </div>
            </form> 
        </c:if>
        <c:if test="${sessionScope.username != null && sessionScope.cart == null}">
            <br>
            <p class="c" style="color: red">Bạn đã đặt hàng thành công!</p>
            <br>
            <p class="c">Bạn có thể tiếp tục mua hàng <a href="${pageContext.request.contextPath}/HomePageController" style="color: #FF0000">tại đây!</a></p>
        </c:if>

    </body>
    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
    <script>
        var date = new Date();

        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();

        if (month < 10)
            month = "0" + month;
        if (day < 10)
            day = "0" + day;

        var today = year + "-" + month + "-" + day;


        document.getElementById('the-date').value = today;
    </script>
</html>
