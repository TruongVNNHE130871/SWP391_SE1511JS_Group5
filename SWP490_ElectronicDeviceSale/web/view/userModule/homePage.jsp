<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
  DATE          Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement
--%>

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
                <h3>Category Product</h3>
                <div class="grid-container-category-product">
                    <div class="grid-item">1</div>
                    <div class="grid-item">2</div>
                    <div class="grid-item">3</div>  
                    <div class="grid-item">4</div>
                    <div class="grid-item">5</div>
                    <div class="grid-item">6</div>  
                    <div class="grid-item">7</div>
                    <div class="grid-item">8</div>
                    <div class="grid-item">9</div>
                    <div class="grid-item">7</div>
                    <div class="grid-item">8</div>
                    <div class="grid-item">9</div>              
                </div>
            </section>
        </article>
        <article>
            <section>
                <h3>Hot Product</h3>
                <div class="grid-container-hot-product">
                    <div class="grid-item">1</div>
                    <div class="grid-item">2</div>
                    <div class="grid-item">3</div>  
                    <div class="grid-item">4</div>
                    <div class="grid-item">5</div>
                    <div class="grid-item">6</div>  
                    <div class="grid-item">7</div>
                    <div class="grid-item">8</div>
                    <div class="grid-item">9</div>
                    <div class="grid-item">7</div>
                    <div class="grid-item">8</div>
                    <div class="grid-item">9</div>               
                </div>
            </section>
        </article>
        <!--  /Content home page-->
        <!--  Footer-->
        <jsp:include page = "./footer/footer.jsp" />
        <!--  /Footer-->
    </body>
</html>
