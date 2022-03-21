<%-- 
    Document   : changeStatus.jsp
    Created on : Mar 18, 2022, 3:24:40 AM
    Author     : ASUS
--%>

<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%
    Order order = (Order)session.getAttribute("order");
%>
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
                        <form method="Post">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th scope="col">Tên khách hàng</th>
                                        <th scope="col">Ngày Mua</th>                                 
                                        <th scope="col">Ngày giao hàng</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <%=order.getUsername().getUserName() %>
                                        </td>
                                        <td>
                                            <%=order.getOrderDate() %>
                                        </td>
                                        <td>
                                            <div style="margin-left:200px;">
                                            <input style="width: 30%; "type="date" placeholder="Ngày giao hàng" class="form-control mb-4" name="deliveryDate" value =<%=order.getDeliveryDate() %>
                                            </div>
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
                        <button type="submit" class="btn btn-outline-success">Cập nhập</button>
                        <!-- error message -->
                            <p style="color:red; display:block">
                                ${errorMsg}                               
                            </p>
                            <!-- success message -->
                            <p style="color:blue; display:block">
                                ${successMsg}
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
</body>
</html>
