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
        <link href="../../assets/css/viewOrder.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <title>JSP Page</title>
<!--        <style>
            table tr:nth-child(1){
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

        </script>-->
    </head>
    <!--side bar-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="list-product">
                    <p class="fs-5 fw-bold">Danh sách đặt hàng: </p>

                    <table class="table text-center">
                        <thead>
                            <tr>
<!--                                <th scope="col">STT</th>-->
                                <th scope="col">Tên</th>
                                <th scope="col">Số Điện Thoại</th>
                                <th scope="col">Email</th>
                                <th scope="col">Địa Chỉ</th>
                                <th scope="col">Lưu Ý</th>
                                <th scope="col">Tổng Cộng</th>
                                <th scope="col">Hình Thức Thanh Toán</th>
                                <th scope="col">Trạng Thái</th>
                                <th scope="col">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control p-0" size="15">
                                    <button class="input-group-text px-2" id="inputGroup-sizing-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                          </svg>
                                    </button>
                                  </div>
                            </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.orderdetails}" var="od">
                                <tr>
                                    <!--<td scope="row"></td>-->
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