<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
   DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         VinhNT         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News List</title>
        <link href="${url}/css/news.css" rel="stylesheet" type="text/css"/>
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
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->
    <body>
        <section>
            <!-- Start banner -->
            <div class="image-parent">
                <img src="${url}/images/new.png" alt="" height="350px" width="100%" class="">
                <div class="title-image">
                    <p class="text-cart text-white text-center">Tin tức</p>
                    <p>
                        <a href="${pageContext.request.contextPath}/HomePageController">Trang Chủ /</a>
                        <a style="color:#fff"> Tin tức công nghệ</a>
                    </p>
                </div>
            </div>
            <!--End banner  -->
        </section>

        <section>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="row">
                                    <c:forEach items="${newsList}" var="newsList">
                                        <div class="col-md-4 col-sm-4">
                                            <article>                        
                                                <h4>
                                                    <a class=" titleNews text-decoration-none" href="${pageContext.request.contextPath}/NewsDetailController?id=${newsList.id}">${newsList.title}</a>
                                                </h4>
                                                <figure>
                                                    <a href="${pageContext.request.contextPath}/NewsDetailController?id=${newsList.id}"><img src="${newsList.image}" alt="farm products" height="180px" width="300px"></a>
                                                </figure>
                                                <p class="desc-boardnews">${newsList.content}</p>
                                                <div>
                                                    ${newsList.author} - ${newsList.created}
                                                </div>
                                                <br>
                                            </article>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>



    </body>
    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
</html>
