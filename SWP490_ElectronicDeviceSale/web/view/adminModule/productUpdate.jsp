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
        <title>Admin - Update Product Page</title>
    </head>
    <header>
        <div class="title-add-new">
            <p class="text-header text-center">
                Update Product
            </p>
        </div>
    </header>

    <body>
        <div class="admin-add-new">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-4 text-center">
                        <img src="${requestScope.product.image}" alt=""
                             width="300" height="400"> <br/>
                        <button class="btn btn-outline-primary mt-3">Change Picture</button>
                    </div>
                    <div class="col-8">

                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">Name: </label>
                            <div class="col-sm-10">
                                <input type="text" value="${requestScope.product.name}" name="productName" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">Category: </label>
                            <div class="col-sm-10">
                                <select name="cid">
                                    <option value="-1">Choose Category</option>
                                    <c:forEach items="${requestScope.categories}" var="c">
                                        <option 
                                            <c:if test="${c.id eq requestScope.product.c.id}">
                                                selected="selected"
                                            </c:if>
                                            value="${crequestScope.product.c.id}"> ${requestScope.product.c.name} </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="description">
                            <p>Description:</p>
                            <div class="mb-3">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="7" name="productDescription">${requestScope.product.description}</textarea>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail2" class="col-sm-2 col-form-label">Price: </label>
                            <div class="col-sm-4">
                                <input type="text" value="${requestScope.product.price}" value="productPrice" class="form-control" id="" placeholder="">
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">VNĐ</label>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="staticEmail2" class="col-sm-2 col-form-label">Discount: </label>
                            <div class="col-sm-4">
                                <input type="text" value="${requestScope.product.discount}" name="productDiscount" class="form-control" id="" placeholder="">
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">%</label>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-outline-success">Save</button>
                </div>
            </div>
        </div>
    </body>
    <footer>
    </footer>

</html>