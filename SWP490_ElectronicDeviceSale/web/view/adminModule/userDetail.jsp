<%-- 
    Document   : userDetail
    Created on : Mar 8, 2022, 7:40:36 PM
    Author     : BH1704
--%>

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
        <title>JSP Page</title>
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
                            <img src="" alt="" width="300" height="300">
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
                        <table class="table">
                            <tr>
                                <td>
                                    <div class="user-detail-product mt-5">
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="" alt="" width="60" height="60">
                                            </div>
                                            <div class="col-10">
                                                <p>Product Name 1</p>
                                                <p>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                    </svg>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                    </svg>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="./" alt="" width="100" height="100">
                                                <p>03/03/2022</p>
                                            </div>
                                            <div class="col-10">
                                                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore quas quia
                                                    facere, animi perferendis laboriosam quidem. Fugiat veritatis non dolore,
                                                    officia nisi sapiente, eaque blanditiis maiores architecto qui nihil
                                                    aperiam?</p>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="user-detail-product mt-5">
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="" alt="" width="60" height="60">
                                            </div>
                                            <div class="col-10">
                                                <p>Product Name 1</p>
                                                <p>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                    </svg>
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                         fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
                                                    <path
                                                        d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z" />
                                                    </svg>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-2">
                                                <img src="./" alt="" width="100" height="100">
                                                <p>03/03/2022</p>
                                            </div>
                                            <div class="col-10">
                                                <p>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Labore quas quia
                                                    facere, animi perferendis laboriosam quidem. Fugiat veritatis non dolore,
                                                    officia nisi sapiente, eaque blanditiis maiores architecto qui nihil
                                                    aperiam?</p>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div class="ban-user text-center my-5">
                        <button class="btn btn-danger" href="${pageContext.request.contextPath}/BanUnbanController?idUser=${user.id}">
                        <c:if test = "${user.status == true}">Cấm người dùng</c:if>
                        <c:if test = "${user.status == false}">Bỏ cấm</c:if>
                    </button>

                </div>
            </div>

        </div>

    </body>

</html>
