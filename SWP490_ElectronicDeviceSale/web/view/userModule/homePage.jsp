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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
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
        <title>Home Page</title>
    </head>
    <form action="SearchController">
        <!--Start header-menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <!--End header-menu-->
    </form>
    <body>
        <!-- Start content -->
        <main id="content">
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
            <!-- Start category product-->
            <article class="mt-3">
                <section>
                    <div class="grid-container-category-product">
                        <div class="grid-item-category text-center py-2">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/dienthoai1.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Phone</p>                       
                        </div>  
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/laptop.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Laptop</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/ipad.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">                          
                                </a>
                            </div>
                            <p class="title-phone">Ipad</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/dienthoai1.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Phone</p>                       
                        </div>  
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/laptop.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Laptop</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/ipad.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">                          
                                </a>
                            </div>
                            <p class="title-phone">Ipad</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/dienthoai1.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Phone</p>                       
                        </div>  
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/laptop.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Laptop</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/ipad.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">                          
                                </a>
                            </div>
                            <p class="title-phone">Ipad</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/dienthoai1.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Phone</p>                       
                        </div>  
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/laptop.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">
                                </a>
                            </div>
                            <p class="title-phone">Laptop</p>                       
                        </div>
                        <div class="grid-item-category text-center py-2 ">
                            <div class="img-category">
                                <a href="#">
                                    <img src="${url}/images/ipad.png" alt="" width="100px" height="100px" class="rounded-circle bg-light">                          
                                </a>
                            </div>
                            <p class="title-phone">Ipad</p>                       
                        </div>
                    </div>
                </section>
            </article>
            <!-- End category product-->
            <!-- Start list new product-->
            <article class="mt-3">
                <section>
                    <h4 class="hot-product">Sản phẩm mới</h3>
                        <div class="grid-container-hot-product">
                            <c:forEach items="${requestScope.products}" var="p"><div class="grid-item text-center py-2">
                                    <div class="img-product">
                                        <a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}"><img src="${p.image}" alt="" width="200px" height="200px"></a>
                                    </div>
                                    <p class="title-phone">${p.name}</p>
                                    <div class="money">
                                        <p class="money-phone">${p.price} VNĐ</p>
                                        <span class="text-decoration-line-through title-sale">34,990,000 VNĐ</span>
                                    </div>
                                    <a class="btn-add-cart" href="${pageContext.request.contextPath}/AddToCart?idProduct=${p.id}">Thêm Vào Giỏ</a>
                                    <a class="btn-buy-product" href="${pageContext.request.contextPath}/AddToCart?idProduct=${p.id}">Mua Ngay</a>
                                </div>
                            </c:forEach>
                        </div> 
                        <div id="paggerbottom" class="pagger"></div>
                </section>
            </article>
            <!-- Start list new product-->
        </main>
        <!-- End content -->
        <img src="" alt=""/>
        <!-- Create button back to top -->
        <a id="button"></a>
    </body>
    <!-- custom js file link  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/pager.js" type="text/javascript"></script>
    <script>
                            generatePagger('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2);
    </script>
    <!--Start footer-->
    <jsp:include page = "./footer/footer.jsp" />
    <!--End footer-->
</html>
