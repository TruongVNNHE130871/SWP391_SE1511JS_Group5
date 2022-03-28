<<<<<<< Updated upstream
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add news</title>
        <link href="${url}/css/newsForm.css" rel="stylesheet" type="text/css"/>
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
        <style>
            .form-new{
                margin-left: 30px !important;
            }
        </style>
    </head>

    <jsp:include page = "./sideBar.jsp" />
    <body>
        <form action="AddNewsController" method="POST" class="was-validated">
            <div class="admin-add-new">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-8 mx-auto form-new" >
                            <h1 class="mb-3 text-center">Thêm mới bài viết</h1>
                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Tiều đề: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control"
                                           name="title" 
                                           placeholder="Nhập tiêu đề bài viết *"
                                           minlength="3"
                                           maxlength="255" 
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Hình ảnh: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control"
                                           name="image" 
                                           minlength="5"
                                           maxlength="255" 
                                           placeholder="Đường dẫn hình ảnh *"
                                           required >
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Nội dung: </label>
                                <div class="col-sm-10"> 
                                    <textarea class="form-control" type="text" id="exampleFormControlTextarea1" rows="7"
                                              name="content" 
                                              placeholder="Nhập nội dung bài viết *"
                                              minlength="3" 
                                              maxlength="4000" 
                                              required></textarea>
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Tác giả: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control" 
                                           name="author" 
                                           placeholder="Nhập tên tác giả *" 
                                           minlength="3"
                                           maxlength="50" 
                                           required>
                                </div>
                            </div>   
                            <div class="mt-3 text-center">
                                <button type="submit" class="btn btn-outline-success">Thêm bài viết</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
<script>
=======
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add news</title>
        <link href="${url}/css/newsForm.css" rel="stylesheet" type="text/css"/>
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
        <style>
            .form-new{
                margin-left: 30px !important;
            }
        </style>
    </head>

    <jsp:include page = "./sideBar.jsp" />
    <body>
        <form action="AddNewsController" method="POST" class="was-validated">
            <div class="admin-add-new">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-8 mx-auto form-new" >
                            <h1 class="mb-3 text-center">Thêm mới bài viết</h1>
                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Tiều đề: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control"
                                           name="title" 
                                           placeholder="Nhập tiêu đề bài viết *"
                                           minlength="3"
                                           maxlength="255" 
                                           required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Hình ảnh: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control"
                                           name="image" 
                                           minlength="5"
                                           maxlength="255" 
                                           placeholder="Đường dẫn hình ảnh *"
                                           required >
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Nội dung: </label>
                                <div class="col-sm-10"> 
                                    <textarea class="form-control" type="text" id="exampleFormControlTextarea1" rows="7"
                                              name="content" 
                                              placeholder="Nhập nội dung bài viết *"
                                              minlength="3" 
                                              maxlength="4000" 
                                              required></textarea>
                                </div>
                            </div>

                            <div class="mb-3 row">
                                <label  class="col-sm-2 col-form-label">Tác giả: </label>
                                <div class="col-sm-10">
                                    <input type="text"class="form-control" 
                                           name="author" 
                                           placeholder="Nhập tên tác giả *" 
                                           minlength="3"
                                           maxlength="50" 
                                           required>
                                </div>
                            </div>   
                            <div class="mt-3 text-center">
                                <button type="submit" class="btn btn-outline-success">Thêm bài viết</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
<script>
>>>>>>> Stashed changes
</script>