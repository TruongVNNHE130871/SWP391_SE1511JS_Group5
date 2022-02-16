<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
  DATE          Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<link href="assets/css/stylemenu.css" rel="stylesheet" type="text/css"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body>
        <!--  Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <!--  /Header and Menu-->
        <!--  Banner-->
        <article id="content"> 
            <section class="banner">
                <img src="${url}/images/banner1.png"  alt="" width="100%">
            </section>
        </article>
        <!--  /Banner-->
        <!--  Content home page-->
        <article>
            <section>
                <h3>Hot Product</h3>
                <div class="grid-container-hot-product">
                    <c:forEach items="${requestScope.products}" var="p">
                        <div class="grid-item"><a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}">${p.image}</a></div>
                        </c:forEach>
                </div>
            </section>
        </article>
        <!--  /Content home page-->
        <!--  Footer-->
        <jsp:include page = "./footer/footer.jsp" />
        <!--  /Footer-->
    </body>
</html>
