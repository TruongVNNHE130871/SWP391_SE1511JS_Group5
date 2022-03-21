<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement
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
        <link href="${url}/css/productList.css" rel="stylesheet" type="text/css"/>
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
                var confirmDelete = confirm("Do you want to delete?");
                if (confirmDelete) {
                    window.location.href = "ProductDeleteController?productID=" + id;
                }
            }

            function doUpdate(id) {
                var confirmDelete = confirm("Do you want to update?");
                if (confirmDelete) {
                    window.location.href = "ProductUpdateController?productID=" + id;
                }
            }

            function doAdd() {
                window.location.href = "ProductInsertController";
            }
        </script>
        <title>Document</title>
    </head>
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <div class="height-100">
        <div class="container-fluid box-view-list">
            <div class="list-product">
                <button class="btn btn-outline-primary mb-4" onclick="doAdd();">Thêm Sản Phẩm</button>
            <div class="list-product">
                <p>Danh sách sản phẩm: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">Mã Sản Phẩm</th>
                            <th scope="col">Tên Sản Phẩm</th>
                            <th scope="col">Ảnh</th>
                            <th scope="col">Danh Mục</th>
                            <th scope="col">Giá</th>
                            <th scope="col">Trạng Thái</th>
                            <th scope="col">Giảm Giá</th>
                            <th scope="col">Ngày Tạo</th>
                            <th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.products}" var="p">
                        <input type="hidden" value="${p.id}" name="productID"/>
                        <tr class="align-middle text-product">
                            <th scope="row">
                                ${p.id}
                            </th>
                            <td>
                                ${p.name}
                            </td>
                            <td>
                                <img src="${p.image}" alt="" width="60" height="60">
                            </td>
                            <td>
                                ${p.c.id}
                            </td>
                            <td>
                                ${p.price}
                            </td>
                            <td>${p.status ? "Available" : "Unavailable"}</td>
                            <td>${p.discount}</td>
                            <td>${p.created}</td>
                            <td>
                                <button type="submit" onclick="doUpdate(${p.id});" class="btn btn-outline-success text-up-dlt">Cập nhật</button>
                                <button type="submit" onclick="doDelete(${p.id});" class="btn btn-outline-danger text-up-dlt">Xóa</button>
                            </td>
                        </tr>           
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            </div>
        </div>

    </div>
    </body>
    <script src="assets/js/pager.js" type="text/javascript"></script>
    <script>
            generatePagger('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2);
    </script>
</html>
