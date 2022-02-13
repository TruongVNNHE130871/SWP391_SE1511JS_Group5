<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         CuongTV         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="assets/css/stylemenu.css" rel="stylesheet" type="text/css"/>
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
        <!-- Search Product -->
        <form action="SearchController" method="POST">
            <!-- Header and Menu-->
            <jsp:include page = "./header/header-menu.jsp" />
            <main id="content">
                <article>
                    <section class="banner">
                        <img src="https://cdn.tgdd.vn/Products/Images/42/236780/Slider/iphone-13mini-1020x570.jpg" alt="">
                    </section>
                </article>
                <!--List all product found-->
                <article>
                    <section>
                        <h3>Found ${requestScope.found} result contain keyword "${requestScope.keyword}"</h3>
                        <div class="grid-container-hot-product">
                            <c:forEach items="${requestScope.products}" var="p">
                                <div class="grid-item"><a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}">${p.name}</a></div>
                                </c:forEach>
                        </div>
                    </section>
                </article>
                <!--List all product found ends-->
            </main>
        </form>
    </body>
</html>
