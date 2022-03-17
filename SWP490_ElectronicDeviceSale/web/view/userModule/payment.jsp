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
                            <p style="color: rgba(163, 23, 23, 0.904);font-size:200%;">Địa chỉ giao hàng</p>

                            <div class="form-group mb-3">
                                <input type="text" class="form-control" placeholder="Họ Tên*" name="payment_name"
                                       minlength="3"
                                       maxlength="50"
                                       required>

                            </div>
                            <div class="form-group row mb-3">
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="Email*"  name="payment_email" minlength="4"
                                           maxlength="255"
                                           required
                                           pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{3,}$"
                                           title="Example: abc@gmail.com">
                                </div>
                                <div class="col-6">
                                    <input type="text" class="form-control" placeholder="Số Điện Thoại*"  name="payment_phone"
                                           maxlength="10"
                                           pattern="(09|03|07|08|05)+([0-9]{8})$"
                                           title="Example: 0912345678"
                                           required>
                                </div>
                            </div>
                            <div class="form-group mb-3">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                          placeholder="Địa Chỉ*" name="payment_address"
                                          minlength="10"
                                          maxlength="255"
                                          required></textarea>
                            </div>
                            <div class="form-group mb-5">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="5"
                                          placeholder="Ghi Chú" name="payment_note" maxlength="255"></textarea>
                            </div>
                            <div> <input type="date" placeholder="Password" name="payment_created" id="the-date" style="display: none">   </div>

                            <div class="form-group mb-5"style="display: none">
                                <input type="text" placeholder="userid_session" name="payment_usersession" value="${sessionScope.username}"> 

                                <input type="text" placeholder="totalmoney_session" name="payment_amount" value="${sumprice}">   
                            </div>
                        </div>
                        <div class="col-5">
                            <div>
                                <p style="color: rgba(163, 23, 23, 0.904);font-size:200%;">Thông tin đơn đặt hàng</p>
                                <table>
                                    <tr>
                                        <th>Sản phẩm  </th>
                                        <th>Hình ảnh</th>
                                        <th>Số lượng</th>
                                        <th>Thành tiền </th>
                                        <th>Đơn vị</th>
                                    </tr>
                                    <tbody>
                                        <c:forEach items="${cart.items}" var="item">
                                            <tr>
                                                <td>${item.product.name } </td>
                                                <td><img src="${item.product.image}"width="80" height="80"></td>
                                                <td width="80" height="80" style="text-align:center;"><strong>${item.qty}</strong></td>
                                                <td width="90" height="80"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}" /> </td>
                                                <td width="80" height="80">VNĐ</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>Tạm tính</th>
                                            <th></th>
                                            <th></th>
                                            <td>${sumprice}</td>
                                            <td>VNĐ</td>
                                        </tr>
                                        <tr>
                                            <th>Phí giao hàng</th>
                                            <th></th>
                                            <th></th>
                                            <td>0</td>
                                            <td>VNĐ</td>
                                        </tr>
                                        <tr>
                                            <th>Tổng cộng</th>
                                            <th></th>
                                            <th></th>
                                            <td><strong>${sumprice}</strong></td>
                                            <td>VNĐ</td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                            <div class="payments">
                                <p style="color: rgba(163, 23, 23, 0.904);">Hình Thức Thanh Toán</p>
                                <div class="form-order-payment" >
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
