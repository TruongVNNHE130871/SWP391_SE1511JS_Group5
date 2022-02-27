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
<c:url value = "assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
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
        <script src="${url}/js/homepage.js" type="text/javascript" defer></script>
    </head>
    <body>
        <!-- Search Product -->
        <!-- Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <main id="content">
            <article>
                <!-- Start banner-->
                <article>
                    <section class="banner">
                        <div class="slideshow-container">
                            <div class="mySlides fade">                
                                <img src="${url}/images/banner2.jpg" alt="" style="width:100%"/>
                            </div>                 
                            <div class="mySlides fade">        
                                <img src="${url}/images/banner1.jpg" alt="" style="width:100%"/>
                            </div>           
                            <div class="mySlides fade">

                                <img src="${url}/images/banner.jpg" alt="" style="width:100%"/>
                            </div>
                        </div>
                        <br>                  
                        <div style="text-align:center">
                            <span class="dot" onclick="currentSlide(0)"></span> 
                            <span class="dot" onclick="currentSlide(1)"></span> 
                            <span class="dot" onclick="currentSlide(2)"></span> 
                        </div>          
                    </section>
                </article>
                <!-- End banner-->
            </article>
            <!--List all product found-->
            <article>
                <section>
                    <h3>Đã tìm thấy ${requestScope.found} sản phẩm chứa từ khoá "${requestScope.keyword}"</h3>
                    <div class="grid-container-hot-product">
                        <c:forEach items="${requestScope.products}" var="p"><div class="grid-item text-center py-2">
                                <div class="img-product">
                                    <a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}"><img src="${p.image}" alt="" width="200px" height="250px"></a>
                                </div>
                                <p class="title-phone">${p.name}</p>
                                <div class="money">
                                    <p class="money-phone">${p.price-(p.price*(p.discount/100))} VNĐ</p>
                                    <span class="text-decoration-line-through title-sale">${p.price} VNĐ</span>
                                </div>
                                <button class="btn-add-cart">Thêm Vào Giỏ</button>
                                <button class="btn-buy-product">Mua Ngay</button>
                            </div>
                        </c:forEach>
                    </div> 
                </section>
            </article>
            <!--List all product found ends-->
        </main>
    </body>
</html>
