<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
DATE         Version       AUTHOR          DESCRIPTION
2022-02-20     1.0         BinhDV         First Implement
--%>

<%@page import="java.sql.Date"%>
<%@page import="model.User"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("orders");
    String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "";
    }
    Date orderDate = (Date) session.getAttribute("orderDate");
    Date deliveryDate = (Date) session.getAttribute("deliveryDate");

%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../assets/css/stylelistuser.css">
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
        <title>Document</title>
    </head>
    <header>
        <div class="infor d-flex justify-content-around">
            <div class="text-admin mt-2">ADMIN Order Management</div>
            <div class="image-admin">
                <img src="https://duytan.thinkingschool.vn/wp-content/uploads/avatars/1/5c2ecfd10c228-bpfull.png" alt="" width="80" height="80" class="rounded-circle">
            </div>
        </div>
    </header>
    <body>
        <div class="container mt-5">
            <div class="list-product">
                <form method="Post">
                    <div style="margin-left: 550px;">
                        <input type="input" placeholder="Tên tài khoản" class="form-control mb-4 " name="searchUsername" style ="width: 30%" value =<%=username%>>
                        <input type="date" class="form-control mb-4" name="searchOrderDate" style ="width: 30% "  value =<%=orderDate%>>
                        <input type="date" class="form-control mb-4" name="searchDelivaryDate"  style ="width: 30%"  value =<%=deliveryDate%>>
                        <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
                    </div>
                </form>
                <p>danh sách đơn đặt hàng: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">Mã đơn hàng</th>
                            <th scope="col">Tên tài khoản</th>
                            <th scope="col">Ngày đặt hàng</th>
                            <th scope="col">Ngày giao hàng</th>
                            <th scope="col">Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Order order : orders) {
                        %>                      
                        <tr>
                            <td>
                                <%=order.getId()%>
                            </td>
                            <td>
                                <%
                                    User user = new User();
                                    user = order.getUsername();
                                %>
                                <%=user.getUserName()%>
                            </td>
                            <td>
                                <%=order.getOrderDate()%>
                            </td>
                            <td>
                                <%
                                    if (order.getDeliveryDate() == null) {
                                %>
                                chưa xác định ngày giao hàng
                                <%} else {%>
                                <%=order.getDeliveryDate()%>
                                <%}%>
                            </td>
                            <td>
                                <%
                                    if (order.getDeliveryDate() == null) {
                                %>
                                Xác nhận
                                <%} else {%>
                                Hoàn tất
                                <%}%>
                            </td>
                            <td>
                                <a class="page-link link-info" href="changeStatus?orderID=<%=order.getId()%>">Change Status</a>
                            </td>
                        </tr>                       
                        <%}%>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination pagination-lg">
                        <c:forEach begin="1" end="${maxPage}" var="pageIndex">
                            <li class="page-item"><a class="page-link" href="listOrder?pageIndex=${pageIndex}">${pageIndex}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>
