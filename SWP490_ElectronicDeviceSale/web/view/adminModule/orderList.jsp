

<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    ArrayList<Order> orders = (ArrayList<Order>) session.getAttribute("orders");
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
            <div class="text-admin mt-2">ADMIN List Order</div>
            <div class="image-admin">
                <img src="https://duytan.thinkingschool.vn/wp-content/uploads/avatars/1/5c2ecfd10c228-bpfull.png" alt="" width="80" height="80" class="rounded-circle">
            </div>
        </div>
    </header>
    <body>
        <div class="container mt-5">
            <div class="list-product">
                <form method="Post">
                    <input type="input" placeholder="Username" class="form-control mb-4" name="search">
                    <button type="submit" class="btn btn-outline-success">tìm kiếm</button>
                </form>
                <p>List User: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">Username</th>
                            <th scope="col">OrderDate</th>
                            <th scope="col">DeliveryDate</th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${orders}" var= "order" end = "${orders.size()}">
                            <tr>
                                <td>
                                    ${order.username}
                                </td>
                                <td>
                                    ${order.orderDate}
                                </td>
                                <td>
                                    ${order.deliveryDate}
                                </td>
                                <td>
                                    Shipped
                                </td>
                                <td>
                                    <button class="btn btn-outline-danger">Details</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination pagination-lg">
                        <c:forEach begin="1" end="${maxPage}" var="pageIndex">
                            <li class="page-item"><a class="page-link" href="search?pageIndex=${pageIndex}">${pageIndex}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>