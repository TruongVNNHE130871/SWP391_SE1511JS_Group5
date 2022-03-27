<%-- 
    Document   : userDetail
    Created on : Mar 8, 2022, 7:40:36 PM
    Author     : BH1704
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script>
            function doBanUnban(id) {
                var confirmAction = confirm("Bạn có muốn thực hiện thao tác này?");
                if (confirmAction) {
                    window.location.href = "BanUnbanController?idBanUnbanUser=" + id;
                }
                var confirmSuccessfull = confirm("Thao tác thành công");
            }
        </script>
        <title>Chi tiết người dùng</title>
    </head>
    <!--side bar-->
    <jsp:include page = "./sideBar.jsp" />
    <body>
        <!--Container Main start-->
        <div class="height-100">
            <div class="container-fluid box-view-list">
                <div class="user-detail-profile">
                    <p class="fw-bold fs-3">Chi Tiết Người Dùng</p>
                    <div class="row">
                        <div class="col-5">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="300" height="300">
                        </div>
                        <div class="col-7">
                            <table width="100%" class="fs-5 lh-lg align-middle">
                                <tr>
                                    <th>Tài khoản: </th>
                                    <td>${user.userName}</td>
                                </tr>
                                <tr>
                                    <th>Họ Tên:  </th>
                                    <td>${user.name}</td>
                                </tr>
                                <tr>
                                    <th>Giới tính:  </th>
                                    <td>
                                          <c:if test = "${user.gender == true}">Nam</c:if>
                                        <c:if test = "${user.gender == false}">Nữ</c:if>   
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Địa chỉ email: </th>
                                        <td>${user.email}</td>
                                </tr>
                                <tr>
                                    <th>Số điện thoại: </th>
                                    <td>${user.phone}</td>
                                </tr>
                                <tr>
                                    <th>Trạng thái: </th>
                                    <td>
                                        <c:if test = "${user.status == true}">Hoạt động</c:if>
                                        <c:if test = "${user.status == false}">Bị cấm</c:if>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>


                    </div>
                    <div class="ban-user text-center my-5">
                        <button type = "submit" onclick="doBanUnban(${user.id});" class="btn btn-outline-success text-up-dlt">
                        <c:if test = "${user.status == true}">Cấm người dùng</c:if>
                        <c:if test = "${user.status == false}">Bỏ cấm</c:if>
                    </button>

                </div>
            </div>

        </div>

    </body>

</html>
