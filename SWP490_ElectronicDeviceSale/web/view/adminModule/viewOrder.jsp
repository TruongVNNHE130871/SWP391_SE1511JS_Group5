<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-03-07        1.0         BinhDV         First Implement
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            table tr:nth-child(2){
                counter-reset: rowNumber;
            }
            table tr {
                counter-increment: rowNumber;
            }
            table tr td:first-child::before {
                content: counter(rowNumber);
                min-width: 1em;
                margin-right: 0.5em;
            }
        </style>
        <script>
            function doDetail(id) {
                window.location.href = "OrderDetailController?orderDetailId=" + id;
            }

        </script>
    </head>
    <!--side bar-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="list-product">
                    <p>Danh sách đặt hàng: </p>

                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa Chỉ</th>
                                <th scope="col">Lưu Ý</th>
                                <th scope="col">Tổng Cộng</th>
                                <th scope="col">Hình Thức Thanh Toán</th>
                                <th scope="col">Trạng Thái</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.orderdetails}" var="od">
                                <tr>
                                    <td scope="row"></td>
                                    <td>
                                        ${od.user_name}
                                    </td>
                                    <td>
                                        ${od.user_phone}
                                    </td>
                                    <td>
                                        ${od.user_mail}
                                    </td>
                                    <td>
                                        ${od.address}
                                    </td>
                                    <td>
                                        ${od.note}
                                    </td>
                                    <td>
                                        ${od.amount}
                                    </td>
                                    <td>
                                        ${od.payment}
                                    </td>
                                    <td>
                                        ${od.status}
                                    </td>
                                    <td>
                                        <button type="submit" onclick="doDetail(${od.id});" class="btn btn-outline-success text-up-dlt">Chi tiết</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                </div>
            </div>
        </div>

    </body>
</html>