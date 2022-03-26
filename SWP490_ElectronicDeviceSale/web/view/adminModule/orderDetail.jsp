<%-- 
    Document   : orderDetail
    Created on : Mar 7, 2022, 8:12:16 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <title>JSP Page</title>
        <style>
            .order-sumprice{
                color: #ee4d2d;
                font-size: 20px;
                line-height: 30px;
                float: right;
            }

            .deliver{
                display: flex;
                justify-content: flex-end;
                padding-top: 30px;
            }

            .deliver>button:first-child{
                margin-right: 25px;
            }
        </style>
        <script>
            function doDeliver(id) {
                window.location.href = "DeliverController?orderDetailId=" + id;
            }

            function doComplete(id) {
                window.location.href = "CompleteDeliverController?orderDetailId=" + id;
            }

            function doCancel(orderDetailId) {
                var confirmDelete = confirm("Do you want to cancel this order?");
                if (confirmDelete) {
                    window.location.href = "OrderCancelController?orderDetailId=" + orderDetailId;
                }
            }
        </script>
    </head>
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="row">
                    <div class="list-product">
                        <p class="fw-bold fs-5">Chi tiết mua hàng: </p>

                        <table class="table text-center">
                            <thead>
                                <tr>
                                    <th scope="col">ID Khách Hàng</th>
                                    <th scope="col">Tên Khách Hàng</th>
                                    <th scope="col">SĐT</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Ngày Mua</th>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Hoan tat'}">
                                        <th scope="col">Đã Thanh Toán</th>
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Da huy'}">
                                        <th scope="col">Ngày Huỷ Đơn</th>
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Xac nhan' || requestScope.order.orderdetail.status == 'Cho lay hang'}">
                                        <th scope="col">Ngày Giao Hàng Dự Kiến</th>
                                        </c:if>
                                    <th scope="col">Trạng thái</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        ${requestScope.order.username.id}
                                    </td>
                                    <td>
                                        ${requestScope.order.username.name}
                                    </td>
                                    <td>
                                        ${requestScope.order.orderdetail.user_phone}
                                    </td>
                                    <td>
                                        ${requestScope.order.orderdetail.user_mail}
                                    </td>
                                    <td>
                                        ${requestScope.order.orderDate}
                                    </td>
                                    <td>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Da huy'}">
                                            ${requestScope.order.deliveryDate}
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Xac nhan' || requestScope.order.orderdetail.status == 'Cho lay hang'}">
                                            ${requestScope.order.deliveryDate}
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Hoan tat'}">
                                            ${requestScope.order.deliveryDate}
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Hoan tat'}">
                                            <span style="color: #198754;">Hoàn tất</span>
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Xac nhan'}">
                                            <span style="color: #212529;">Chờ xác nhận</span>
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Da huy'}">
                                            <span style="color: #ee2c4a;">Đã huỷ</span>
                                        </c:if>
                                        <c:if test="${requestScope.order.orderdetail.status == 'Cho lay hang'}">
                                            <span style="color: #212529;">Đang giao hàng</span>
                                        </c:if>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="product-list">
                        <p>Sản phẩm: </p>
                        <table class="table">
                            <c:set var = "sumPrice" value = "${0}"/>
                            <c:forEach items="${requestScope.items}" var="item">
                                <tr>
                                    <td>
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="${item.product.image}" alt="" width="80" height="80">
                                            </div>
                                            <div class="col-7">
                                                <p>${item.product.name} ${item.product.ram}gb</p>
                                                <p>x${item.qty}</p>
                                            </div>
                                            <div class="col-3">
                                                <p><b>Đơn giá: </b> ${item.product.price} VNĐ</p>
                                                <p><b>Tổng giá: </b> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}"/> VNĐ</p>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <c:set var = "sumPrice" value = "${sumPrice + item.price}"/>
                            </c:forEach>
                        </table>
                        <div class="order-sumprice">Tổng số tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sumPrice}"/> VNĐ</div>
                    </div>
                    <div class="deliver">
                        <c:if test="${requestScope.order.orderdetail.status == 'Xac nhan'}">
                            <button type="submit" onclick="doDeliver(${requestScope.order.orderdetail.id});" class="btn btn-outline-success text-up-dlt">Xuất đơn</button>
                            <button type="submit" onclick="doCancel(${requestScope.order.orderdetail.id});" class="btn btn-outline-danger text-up-dlt">Huỷ đơn</button>
                        </c:if>
                        <c:if test="${requestScope.order.orderdetail.status == 'Cho lay hang'}">
                            <button type="submit" onclick="doComplete(${requestScope.order.orderdetail.id});" class="btn btn-outline-success text-up-dlt">Đã giao</button>
                        </c:if>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>
