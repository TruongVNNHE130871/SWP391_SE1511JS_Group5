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
        <form action="ProductInsertController" method="POST" class="was-validated">
            <div class="admin-add-new">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-8">

                            <div class="mb-3 row">
                                <label for="inputName" class="col-sm-2 col-form-label">Tên SP: </label>
                                <div class="col-sm-10">
                                    <input type="text" name="productName" class="form-control" minlength="3" maxlength="50" pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*$" required>
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label for="inputImage" class="col-sm-2 col-form-label">Hình ảnh: </label>
                                <div class="col-sm-10">
                                    <input type="text" value="" required name="productImage" class="form-control">
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputName" class="col-sm-2 col-form-label">Danh mục: </label>
                                <div class="col-sm-10">
                                    <select name="cid">
                                        <option value="-1">Chọn danh mục</option>
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
                                <p>Mô tả: </p>
                                <div class="mb-3"> 
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="7" name="productDescription" minlength="3" maxlength="255" pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*[.,?]?[a-zA-Z0-9\s.]$" required></textarea>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPrice" class="col-sm-2 col-form-label">Giá: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productPrice" class="form-control" id="" placeholder="" minlength="5" maxlength="10" pattern="^(?![\s.]+$)[0-9\s.]*$" required>
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">VNĐ</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputDiscount" class="col-sm-2 col-form-label">Giảm giá: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productDiscount" class="form-control" id="" placeholder="" minlength="1" maxlength="4" pattern="^(?![\s.]+$)[0-9\s.]*[.]?[0-9\s.]$" required>
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">%</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputSize" class="col-sm-2 col-form-label">Kích thước: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productSize" class="form-control" id="" placeholder="" minlength="1" maxlength="4" pattern="^(?![\s.]+$)[0-9\s.]*[.]?[0-9\s.]$" required>
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">mm</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputWeight" class="col-sm-2 col-form-label">Trọng lượng: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productWeight" class="form-control" id="" placeholder="" minlength="1" maxlength="5" pattern="^(?![\s.]+$)[0-9\s.]*[.]?[0-9\s.]$" required>
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">gram</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputRam" class="col-sm-2 col-form-label">Ram: </label>
                                <div class="col-sm-4">
                                    <input type="text" required name="productRam" class="form-control" id="" placeholder="" minlength="0" maxlength="3" pattern="^(?![\s.]+$)[0-9\s.]*$" required>
                                </div>
                                <div class="col-auto">
                                    <label class="col-sm-2 col-form-label">GB</label>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputOrginal" class="col-sm-2 col-form-label">Xuất sứ: </label>
                                <div class="col-sm-4">
                                    <input type="text" name="productOrginal" class="form-control" id="" placeholder="" minlength="3" maxlength="20" pattern="^(?![\s.]+$)[a-zA-Z\s.]*$" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputYear" class="col-sm-2 col-form-label">Năm phát hành: </label>
                                <div class="col-sm-4">
                                    <input type="text" name="productYear" class="form-control" id="" placeholder="" pattern="(?:19|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))" required>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-outline-success">Thêm</button>
                    </div>
                </div>
            </div>
        </form>
    </body>
    <footer>
    </footer>

</html>