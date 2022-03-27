<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
DATE         Version       AUTHOR          DESCRIPTION
2022-02-08     1.0         BinhDV         First Implement
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${url}/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
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
    </head>
    <body>
        <!-- Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <!-- Form View Profile-->
        <form style="align-items: center;" class="profile" id="content">
            <div class="container">
                <div class="row">
                    <div class="col-5 text-center form-group">
                        <div class="">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="150"
                                 height="150" class="rounded-circle mt-5" />
                            <p class="text-white my-4 fs-5 fw-bold">Xin Chào, ${sessionScope.user.userName}</p>
                        </div>
                        <div class="text-center my-5">
                            <a href="${pageContext.request.contextPath}/EditProfileController"><button type="button" class="btn btn-danger">Sửa Thông Tin</button></a> 
                            <a href="${pageContext.request.contextPath}/changePassword"><button type="button" class="btn btn-danger">Đổi Mật Khẩu</button></a>       
                        </div>
                    </div>
                    <div class="col-7 my-4">
                        <table class="table" style="width: 90%; margin: auto;">
                            <thead>
                                <tr>
                                    <th scope="col" class="fs-4">Thông tin cá nhân</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="py-3">Tài khoản: </td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.userName}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Họ Tên:</td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.name}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Giới tính: </td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.gender ? "Male" : "Female"}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Email: </td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.email}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Số điện thoại: </td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.phone}</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </form>
    </body>
    <!--footer-->
    <jsp:include page = "./footer/footer.jsp" />
</html>
