<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-02-28        1.0         BinhDV         First Implement
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
        <link href="assets/css/addNewProduct.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="${url}/js/menu.js" type="text/javascript"></script>
        <title>Admin - Update Product Page</title>
    </head>
    <!--side bar admin-->
    <jsp:include page = "./sideBar.jsp" />
    <!--update product admin-->
    <body>
        <form action="ProductUpdateController" method="POST" class="was-validated">
            <div class="container admin-add-new border-0">
                <div class="row mb-5">
                    <div class="col-8">
                        <input type="hidden" value="${requestScope.product.id}" name="productID"/>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">T??n SP: </label>
                            <div class="col-sm-10">
                                <input 
                                    class="form-control is-invalid" 
                                    id="validationTextarea"
                                    value="${requestScope.product.name}" 
                                    name="productName"
                                    minlength="3" 
                                    maxlength="30" 
                                    pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*$"
                                    required>
                            </div>
                        </div>

                        <div class="mb-3 row">
                            <label for="inputImage" class="col-sm-2 col-form-label">H??nh ???nh: </label>
                            <div class="col-sm-10">
                                <input type="text" value="${requestScope.product.image}" required name="productImage" class="form-control">
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputName" class="col-sm-2 col-form-label">Danh m???c: </label>
                            <div class="col-sm-10">
                                <select name="cid">
                                    <option value="-1">Ch???n danh m???c</option>
                                    <c:forEach items="${requestScope.categories}" var="c">
                                        <option 
                                            <c:if test="${c.id eq requestScope.product.c.id}">
                                                selected="selected"
                                            </c:if>
                                            value="${c.id}"> ${c.name} </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="description">
                            <p>M?? t???: </p>
                            <div class="mb-3"> 
                                <textarea 
                                    class="form-control is-invalid" 
                                    id="exampleFormControlTextarea1" 
                                    rows="7" 
                                    name="productDescription" 
                                    minlength="2" 
                                    maxlength="500" 
                                    pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*[.,?]?[a-zA-Z0-9\s.]$" 
                                    required>${requestScope.product.description}</textarea>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputPrice" class="col-sm-2 col-form-label">Gi??:  </label>
                            <div class="col-sm-4">
                                <input 
                                    type="text" 
                                    value="${requestScope.productPrice}" 
                                    name="productPrice" 
                                    class="form-control is-invalid" 
                                    id="" 
                                    placeholder="" 
                                    minlength="5" 
                                    maxlength="10" 
                                    pattern="^(?![\s.]+$)[0-9\s.]*$" 
                                    required>
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">VN??</label>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputDiscount" class="col-sm-2 col-form-label">Gi???m gi??: </label>
                            <div class="col-sm-4">
                                <input 
                                    type="text" 
                                    value="${requestScope.product.discount}" 
                                    name="productDiscount" 
                                    class="form-control is-invalid" 
                                    id="" 
                                    placeholder="" 
                                    minlength="1" 
                                    maxlength="4"
                                    pattern="^(?![\s.]+$)[0-9\s.]*[.]?[0-9\s.]$" 
                                    required>
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">%</label>
                            </div>
                        </div>


                        <div class="mb-3 row">
                            <label for="inputRam" class="col-sm-2 col-form-label">Ram: </label>
                            <div class="col-sm-4">
                                <input 
                                    type="text" 
                                    value="${requestScope.product.ram}" 
                                    required 
                                    name="productRam" 
                                    class="form-control is-invalid" 
                                    id="" 
                                    placeholder="" 
                                    minlength="1"
                                    maxlength="4"
                                    pattern="^(?![\s.]+$)[0-9\s.]*$" 
                                    required>
                            </div>
                            <div class="col-auto">
                                <label class="col-sm-2 col-form-label">GB</label>
                            </div>
                        </div>


                    </div>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-outline-success">L??u</button>
                </div>
            </div>
        </form>
    </body>
    <footer>
    </footer>

</html>