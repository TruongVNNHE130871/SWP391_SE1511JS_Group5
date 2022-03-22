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
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <link href="${url}/css/styleAdvance.css" rel="stylesheet" type="text/css"/>
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
        <script src="${url}/js/homepage.js" type="text/javascript" defer></script>
        <!-- custom js file link  -->
        <script src="${url}/js/pager.js" type="text/javascript"></script>
        <script>
            function modifyState(url) {
                window.history.replaceState("data",
                        "", url);
                return false;
            }
        </script>
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
                                <img src="${url}/images/banner2.jpg" alt="" style="width:100%;"/>
                            </div>                 
                            <div class="mySlides fade">        
                                <img src="${url}/images/banner1.jpg" alt="" style="width:100%;"/>
                            </div>           
                            <div class="mySlides fade">

                                <img src="${url}/images/banner.jpg" alt="" style="width:100%;"/>
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
                    <h3 class="status-text-found">Tìm thấy <strong>${requestScope.found}</strong> kết quả với từ khoá <strong>"${sessionScope.keyword}"</strong></h3>
                    <div class="product-filter">
                        <span class="product-filter__label">Sắp xếp theo</span>
                        <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex}&filterindex=1#menu" class="product-filter__btn ${filterindex == 1 ? "btn--primary" : ""}">Phổ Biến</a>
                        <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex}&filterindex=2#menu" class="product-filter__btn ${filterindex == 2 ? "btn--primary" : ""}">Mới Nhất</a>
                        <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex}&filterindex=3#menu" class="product-filter__btn ${filterindex == 3 ? "btn--primary" : ""}">Cũ nhất</a>

                        <div class="select-input">
                            <c:if test="${filterindex == 1 || filterindex == 2 || filterindex == 3}">
                                <span class="select-input__label">Giá</span>
                            </c:if>
                            <c:if test="${filterindex == 4}">
                                <span class="select-input__label select-input__label--active">Giá: Thấp đến Cao</span>
                            </c:if>
                            <c:if test="${filterindex == 5}">
                                <span class="select-input__label select-input__label--active">Giá: Cao đến Thấp</span>
                            </c:if>
                            <i class="select-input__icon fas fa-angle-down"></i>
                            <ul class="select-input__list">
                                <li class="select-input__item">
                                    <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex}&filterindex=4#menu" class="select-input__item-link">Giá: Thấp đến Cao</a>
                                </li>
                                <li class="select-input__item">
                                    <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex}&filterindex=5#menu" class="select-input__item-link">Giá: Cao đến Thấp</a>
                                </li>
                            </ul>
                        </div>

                        <div class="product-filter__page">
                            <span class="product-filter__page-num">
                                <span class="product-filter__page-current">${requestScope.pageindex}</span>/${requestScope.totalpage}
                            </span>
                            <div class="product-filter__page-control">
                                <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex - 1}&filterindex=${sessionScope.filterindex}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                                    <i class="product-filter__page-icon fas fa-angle-left"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/SearchController?keyword=${sessionScope.keyword}&page=${requestScope.pageindex + 1}&filterindex=${sessionScope.filterindex}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                                    <i class="product-filter__page-icon fas fa-angle-right"></i>
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="product-box-container">
                        <div class="grid-container-hot-product">
                            <c:forEach items="${requestScope.products}" var="p">
                                <div class="grid-item text-center py-2">
                                    <div class="img-product">
                                        <a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}"><img src="${p.image}" alt="" width="200px" height="200px"></a>
                                    </div>
                                    <p class="title-phone">${p.name}</p>
                                    <div class="money">
                                        <p class="money-phone">${p.price} VNĐ</p>
                                        <span class="text-decoration-line-through title-sale">${p.price} VNĐ</span>
                                    </div>
                                    <a class="btn-add-cart text-decoration-none" href="${pageContext.request.contextPath}/AddToCart?idProduct=${p.id}">Thêm Vào Giỏ</a>
                                    <a class="btn-buy-product text-decoration-none" href="${pageContext.request.contextPath}/ByNowController?idProduct=${p.id}">Mua ngay</a>

                                </div>
                            </c:forEach>
                        </div> 
                    </div>
                    <div id="paggerbottom" class="pagger"></div>
                </section>
            </article>
            <!--List all product found ends-->
        </main>
    </body>
    <script>
        generatePagerSearchController('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 3, '${sessionScope.keyword}', ${sessionScope.filterindex});
    </script>
    <script>
        var header = document.querySelector(".product-filter");
        var btns = header.getElementsByClassName("product-filter__btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("btn--primary");
                current[0].className = current[0].className.replace(" btn--primary", "");
                this.className += " btn--primary";
            });
        }
    </script>

</html>
