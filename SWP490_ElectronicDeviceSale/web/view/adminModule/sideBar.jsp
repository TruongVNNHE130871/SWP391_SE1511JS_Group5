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
                        <a class="nav_logo">
                            <i class='bx bx-layer nav_logo-icon'></i>
                            <span class="nav_logo-name">ADMIN</span></a>

                        <div class="nav_list">
                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/AdminHomePageController" class="nav_link active">
                                <i class='bx bx-grid-alt nav_icon'></i>
                                <span class="nav_name">Trang Ch???</span></a> 
                            <!--End link -->

                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/UserListController?keyword=" class="nav_link">
                                <i class='bx bx-user nav_icon'></i>
                                <span class="nav_name">Danh s??ch ng?????i d??ng</span></a>
                            <!--End link -->

                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/ProductListController?keyword=" class="nav_link">
                                <i class='bx bxl-product-hunt'></i>
                                <span class="nav_name">Danh s??ch s???n ph???m</span></a>
                            <!--End link -->

                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/ViewAllOrderController?keyword=" class="nav_link">
                                <i class='bx bx-cart nav_icon'></i>
                                <span class="nav_name">Danh s??ch mua h??ng</span></a>
                            <!--End link -->

                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/ReviewManagementController?keyword=" class="nav_link">
                                <i class='bx bx-message-square-detail nav_icon'></i>
                                <span class="nav_name">Qu???n l?? ????nh gi??</span></a>
                            <!--End link -->

                            <!--Start link -->
                            <a href="${pageContext.request.contextPath}/NewsManagementController?keyword=" class="nav_link">
                                <i class='bx bx-news'></i>
                                <span class="nav_name">Qu???n tin t???c</span> </a> 
                            <!--End link -->
                        </div>
                    </div>
                </nav>
            </div>
        </header>
                                <div class="height-15">

                                </div> 
    </body>
</html>
