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
        <title>Document</title>
    </head>
    <!--side bar admin-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <form action="ProductInsertController" method="POST">

            <div class="admin-add-new">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-8">

                            <div class="mb-3 row">
                                <label for="inputName" class="col-sm-2 col-form-label">Name: </label>
                                <div class="col-sm-10">
                                    <input type="text" required name="productName" class="form-control">
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label for="inputImage" class="col-sm-2 col-form-label">Link Image: </label>
                                <div class="col-sm-10">
                                    <input type="text" value="" required name="productImage" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputName" class="col-sm-2 col-form-label">Category: </label>
                                <div class="col-sm-10">
                                    <select name="cid">
                                        <option value="-1">Choose Category</option>
                                        <c:forEach items="${requestScope.categories}" var="c">
                                            <option 
                                                <c:if test="${c.id eq param.id}">
                                                    selected="selected"
                                                </c:if>
                                                value="${c.id}"> ${c.name} </option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="description">
                                <p>Description:</p>
                                <div class="mb-3"> 
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="7" name="productDescription"></textarea>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPrice" class="col-sm-2 col-form-label">Price: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productPrice" class="form-control" id="" placeholder="">
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">VNĐ</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputDiscount" class="col-sm-2 col-form-label">Discount: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productDiscount" class="form-control" id="" placeholder="">
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">%</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputSize" class="col-sm-2 col-form-label">Size: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productSize" class="form-control" id="" placeholder="">
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">mm</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputWeight" class="col-sm-2 col-form-label">Weight: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productWeight" class="form-control" id="" placeholder="">
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">gram</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputRam" class="col-sm-2 col-form-label">Ram: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productRam" class="form-control" id="" placeholder="">
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">GB</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputOrginal" class="col-sm-2 col-form-label">Orginal: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productOrginal" class="form-control" id="" placeholder="">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputYear" class="col-sm-2 col-form-label">Release Year: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productYear" class="form-control" id="" placeholder="">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-outline-success">Add</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
    <footer>
    </footer>

</html>