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
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${url}/css/sideBarAdmin.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="${url}/js/sideBarAdmin.js" type="text/javascript"></script>
        <title>Admin Home</title>
    </head>
    <body id="body-pd">
        <header class="header" id="header">
            <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
            <div class="l-navbar" id="nav-bar">
                <nav class="nav">
                    <div>
                        <a href="#" class="nav_logo">
                            <i class='bx bx-layer nav_logo-icon'></i>
                            <span class="nav_logo-name">ADMIN</span>
                        </a>
                        <div class="nav_list">
                            <a <a href="${pageContext.request.contextPath}/AdminHomePageController" class="nav_link active">
                                    <i class='bx bx-grid-alt nav_icon'></i>
                                    <span class="nav_name">Trang Chủ</span>
                                </a> <a href="${pageContext.request.contextPath}/admin/userList" class="nav_link">
                                    <i class='bx bx-user nav_icon'></i>
                                    <span class="nav_name">Danh sách người dùng</span>
                                </a>
                                <a href="${pageContext.request.contextPath}/ProductListController" class="nav_link">
                                    <i class='bx bx-message-square-detail nav_icon'></i>
                                    <span class="nav_name">Danh sách sản phẩm</span>
                                </a> <a href="" class="nav_link">
                                    <i class='bx bx-cart nav_icon'></i>
                                    <span class="nav_name">Danh sách mua hàng</span>
                                </a>
                                <a href="#" class="nav_link">
                                    <i class='bx bx-bar-chart-alt-2 nav_icon'></i>
                                    <span class="nav_name">Trạng thái</span>
                                </a>
                        </div>
                    </div>
                </nav>
            </div>
        </header>


        <!--Container Main start-->
        <div class="height-15">

        </div>

    </body>
</html>
