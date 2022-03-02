<%-- 
    Document   : productList
    Created on : Feb 27, 2022, 10:42:23 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "assets" var="url"/>
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
        </script>
        <title>Document</title>
    </head>
    <header>
        <div class="infor d-flex justify-content-around">
            <div class="text-admin mt-2">ADMIN</div>
            <div class="image-admin">
                <img src="https://duytan.thinkingschool.vn/wp-content/uploads/avatars/1/5c2ecfd10c228-bpfull.png" alt="" width="80" height="80" class="rounded-circle">
            </div>
        </div>
    </header>
    <body>
        <div class="container mt-5">
            <button class="btn btn-outline-primary mb-4">New Product</button>
            <div class="list-product">
                <p>List Product: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Name</th>
                            <th scope="col">Image</th>
                            <th scope="col">Category</th>
                            <th scope="col">Price</th>
                            <th scope="col">Status</th>
                            <th scope="col">Discount</th>
                            <th scope="col">Created</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.products}" var="p">
                        <input type="hidden" value="${p.id}" name="productID"/>
                        <tr>
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
                                <button type="submit" class="btn btn-outline-success">Update</button>
                                <button type="submit" onclick="doDelete(${p.id});" class="btn btn-outline-danger">Delete</button>
                            </td>
                        </tr>           
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="assets/js/pager.js" type="text/javascript"></script>
    <script>
            generatePagger('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2);
    </script>
</html>
