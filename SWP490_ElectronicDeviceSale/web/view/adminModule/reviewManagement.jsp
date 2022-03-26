<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${url}/css/reviewManagement.css" rel="stylesheet" type="text/css"/>
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
        <script>
            function doDelete(id) {
                var confirmDelete = confirm("Xác nhận xóa đánh giá!");
                if (confirmDelete) {
                    window.location.href = "DeleteReviewController?reviewID=" + id;
                    window.alert("Xóa thành công");
                }

            }

        </script>
        <title>Document</title>
    </head>
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="list-product">
                    <div class="row">
                        <h1 class="col">Danh sách đánh giá sản phẩm </h1>
                        <div class="col-5 my-3 d-flex form-search m-0 me-5">
                            <input type="text" size="35" name="keyword" value=""placeholder="Tìm theo tên sản phẩm">
                            <button type="submit" class="btn-search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </button>
                        </div>
                    </div>

                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th scope="col">Mã đánh giá</th>
                                <th scope="col">Tên sản phẩm</th>
                                <th scope="col">Hình ảnh</th>
                                <th scope="col">Tên khách hàng</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Nội dung đánh giá</th>
                                <th scope="col">Số sao</th>
                                <th scope="col">Ngày tạo</th>
                                <th>
                                    <select name="" id="">
                                        <option value="">Số Sao Tăng Dần</option>
                                        <option value="">Số Sao Giảm Dần</option>
                                    </select>
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.reviews}" var="reviews">
                            <input type="hidden" value="${reviews.id}" name="reviewID"/>
                            <tr class="align-middle text-product">
                                <td >
                                    ${reviews.id}
                                </td>
                                <td>
                                    ${reviews.product.name}
                                </td>
                                <td>
                                    <img src="${reviews.product.image}" alt="" width="60" height="60">
                                </td>
                                <td>
                                    ${reviews.name}
                                </td>
                                <td>
                                    ${reviews.phone}
                                </td>
                                <td>
                                    ${reviews.content}
                                </td>
                                <td>
                                    ${reviews.vote}
                                </td>
                                <td>
                                    ${reviews.created}
                                </td>
                                <td>
                                    <button type="submit" onclick="doDelete(${reviews.id});" class="btn btn-outline-danger text-up-dlt">Xóa</button>
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
