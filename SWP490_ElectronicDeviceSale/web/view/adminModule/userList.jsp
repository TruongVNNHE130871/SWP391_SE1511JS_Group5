

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<%
    ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${url}/css/stylelistuser.css">
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
        <title>Document</title>
    </head>
    <!--Start side bar-menu-->
    <jsp:include page = "./sideBar.jsp" />
    <!--End side bar -menu-->
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
            <div class="list-product">
                <form method="Post">
                    <input type="input" placeholder="Tên tài khoản người dùng" class="form-control mb-4" name="search">
                    <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
                </form>
                <p>Danh sách người dùng: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <th scope="col">Mã</th>
                            <th scope="col">Họ Tên</th>
                            <th scope="col">Tài khoản</th>
                            <th scope="col">Mật khẩu</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Email</th>
                            <th scope="col">Trạng thái</th>
                            <<th scope="col"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${users}" var= "user" end = "${users.size()}">
                            <tr>
                                <td>
                                    ${user.id}
                                </td>
                                <td>
                                    ${user.name}
                                </td>
                                <td>
                                    ${user.userName}
                                </td>
                                <td>
                                    ${user.passWord}
                                </td>
                                <td>
                                    <c:if test = "${user.gender == true}">Nam</c:if>
                                    <c:if test = "${user.gender == false}">Nữ</c:if>                         
                                    </td>
                                    <td>
                                    ${user.phone}
                                </td>
                                <td>
                                    ${user.email}
                                </td>
                                <td>
                                    <c:if test = "${user.status == true}">Hoạt động</c:if>
                                    <c:if test = "${user.status == false}">Bị cấm</c:if>  
                                    </td>
                                    <td>
                                        <a class="btn btn-outline-danger" href="${pageContext.request.contextPath}/ViewUserDetailController?idUser=${user.id}">Xem chi tiết</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <nav aria-label="...">
                    <ul class="pagination pagination-lg">
                        <c:forEach begin="1" end="${maxPage}" var="pageIndex">
                            <li class="page-item"><a class="page-link" href="search?pageIndex=${pageIndex}">${pageIndex}</a></li>
                            </c:forEach>
                    </ul>
                </nav>
            </div>
        </div>
    </body>
</html>
