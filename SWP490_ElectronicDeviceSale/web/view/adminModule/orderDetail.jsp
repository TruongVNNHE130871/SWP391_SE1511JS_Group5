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
                                    <th scope="col">Ngày Mua</th>
                                    <th scope="col">Ngày Giao Hàng Dự Kiến</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        ${requestScope.order.username.id}
                                    </td>
                                    <td>
                                        ${requestScope.order.orderDate}
                                    </td>
                                    <td>
                                        ${requestScope.order.deliveryDate}
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="product-list">
                        <p>Sản phẩm: </p>
                        <table class="table">
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
                            </c:forEach>
                        </table>
                    </div>

                </div>
            </div>

        </div>
    </body>
</html>
