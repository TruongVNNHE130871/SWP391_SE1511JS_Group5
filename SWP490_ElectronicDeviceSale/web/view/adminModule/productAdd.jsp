<%-- 
    Document   : productAdd
    Created on : Feb 28, 2022, 11:50:38 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "assets" var="url"/>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <link href="${url}/css/addNewProduct.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <script src="${url}/js/menu.js" type="text/javascript"></script>
        <title>Document</title>
    </head>
    <header>
        <div class="title-add-new">
            <p class="text-header text-center">
                Add New Product
            </p>
        </div>
    </header>

    <body>
        <div class="admin-add-new">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-8">

                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">Name: </label>
                            <div class="col-sm-10">
                                <input type="text" name="productName" class="form-control">
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="inputImage" class="col-sm-2 col-form-label">Link Image: </label>
                            <div class="col-sm-10">
                                <input type="text" value="" name="productImage" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">Category: </label>
                            <div class="col-sm-10">
                                <div class="dropdown">
                                    <button onclick="myFunction()" class="dropbtn dropdown-toggle">Choose Category</button>
                                    <div id="myDropdown" class="dropdown-content">
                                        <c:forEach items="${requestScope.categories}" var="c">
                                            <a href=""><input type="hidden" value="${c.id}" name="cid"/>${c.name}</a>
                                            </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="description">
                            <p>Description:</p>
                            <div class="mb-3"> 
                                 <input style="width:860px;height:200px;font-size:14pt;" type="text" name="productDescription" value="${requestScope.product.description}"/>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail2" class="col-sm-2 col-form-label">Price: </label>
                            <div class="col-sm-4">
                                <input type="text" name="productPrice" class="form-control" id="" placeholder="">
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">VNĐ</label>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail2" class="col-sm-2 col-form-label">Discount: </label>
                            <div class="col-sm-4">
                                <input type="text" name="productDiscount" class="form-control" id="" placeholder="">
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">%</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-outline-success">Add</button>
                </div>
            </div>
        </div>
    </body>
    <footer>
    </footer>

</html>