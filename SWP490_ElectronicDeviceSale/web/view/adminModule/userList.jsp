

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
    <body>
        <div class="container mt-5">
            <div class="list-product">
                <!--                <form method="Post">
                                    <input type="input" placeholder="Tên tài khoản người dùng" class="form-control mb-4" name="search">
                                    <button type="submit" class="btn btn-outline-success">Tìm kiếm</button>
                                </form>-->
                <p class="fs-5 fw-bold">Danh sách người dùng: </p>
                <table class="table text-center">
                    <thead>
                        <tr>
                            <!--<th scope="col">Mã</th>-->
                            <th scope="col">Họ Tên</th>
                            <th scope="col">Tài khoản</th>
                            <th scope="col">Mật khẩu</th>
                            <th scope="col">Giới tính</th>
                            <th scope="col">Số điện thoại</th>
                            <th scope="col">Email</th>
                            <th scope="col">Trạng thái</th>
                            <th scope="col">
                                <div class="input-group input-group-sm">
                                    <input type="text" class="form-control p-0" size="10" placeholder="Tên tài khoản" name="searchUserName">
                                    <a class="input-group-text px-2" id="inputGroup-sizing-sm" href="${pageContext.request.contextPath}/UserSearchController?searchUserName=${user.name}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                        <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                        </svg>
                                    </a>
                                </div>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${users}" var= "user" end = "${users.size()}">
                            <tr>                           
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
