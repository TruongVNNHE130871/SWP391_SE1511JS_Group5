<%-- 
    Document   : advancesearch
    Created on : Feb 19, 2022, 4:39:38 PM
    Author     : CuongTV
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<c:url value = "assets" var="url"/>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="${url}/css/styleAdvance.css" rel="stylesheet" type="text/css"/>
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <!-- font awesome cdn link  -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
            />
        <title>Advance Search Page</title>
    </head>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->
    <body>
        <div class="container advanced-search">

            <form action="AdvanceSearchController">
                <div class="row">
                    <div class="col-3">
                        <div class="product-portfolio mb-3">
                            <div class="row">
                                <p class="mt-3 mx-3 fw-bold">Tất cả danh mục</p>

                                <div class="col-auto">
                                    <ul>
                                        <li>
                                            <input type="checkbox" value="-1" name="categoryId" ${requestScope.categoryId eq -1 ? "checked = \"checked\"" : ""}/>
                                            <span class="">Tất cả</span>
                                        </li>
                                        <c:forEach items="${requestScope.categories}" var="c">
                                            <li>
                                                <input type="checkbox" name="categoryId" value="${c.id}" ${requestScope.categoryId eq c.id ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                                <span class="">${c.name}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <p class="mt-3 mx-3 fw-bold">Hãng sản xuất</p>

                                <div class="col-auto">
                                    <ul>
                                        <li>
                                            <input type="checkbox" value="-1" name="manufacturerId " ${requestScope.manufacturerId eq -1 ? "checked = \"checked\"" : ""}>
                                            <span class="">Tất cả</span>
                                        </li>
                                        <c:forEach items="${requestScope.manufacturers}" var="m">
                                            <li>
                                                <input type="checkbox" name="manufacturerId" value="${m.id}" ${requestScope.manufacturerId eq m.id ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                                <span class="">${m.name}</span>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>
                            </div>
                            <div class="row">
                                <p class="mt-3 mx-3 fw-bold">Mức Giá</p>

                                <div class="col-auto">

                                    <ul>
                                        <li>
                                            <input type="checkbox" value="-1" name="searchPrice" ${requestScope.searchByPrice eq -1 ? "checked = \"checked\"" : ""}/>
                                            <span class="">Tất cả</span>
                                        </li>
                                        <li>
                                            <input type="checkbox" value="1" name="searchPrice" ${requestScope.searchByPrice eq 1 ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                            <span class="">Dưới 2 triệu</span>
                                        </li>
                                        <li>
                                            <input type="checkbox" value="2" name="searchPrice" ${requestScope.searchByPrice eq 2 ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                            <span class="">Từ 2-4 triệu</span>
                                        </li>
                                        <li>
                                            <input type="checkbox" value="3" name="searchPrice" ${requestScope.searchByPrice eq 3 ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                            <span class="">Từ 4-7 triệu</span>
                                        </li>
                                        <li>
                                            <input type="checkbox" value="4" name="searchPrice" ${requestScope.searchByPrice eq 4 ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                            <span class="">Từ 7-13 triệu</span>
                                        </li>
                                        <li>
                                            <input type="checkbox" value="5" name="searchPrice" ${requestScope.searchByPrice eq 5 ? "checked = \"checked\"" : ""} onchange="this.form.submit()"/>
                                            <span class="">Từ 13 triệu</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-9">
                        <div class="product-filter">
                            <span class="product-filter__label">Sắp xếp theo</span>
                            <a href="${pageContext.request.contextPath}/AdvanceSearchController?categoryId=${requestScope.categoryId}&manufacturerId=${requestScope.manufacturerId}&searchPrice=${requestScope.searchByPrice}&page=${requestScope.pageindex}&filterindex=1#menu" class="product-filter__btn ${filterindex == 1 ? "btn--primary" : ""}">Phổ Biến</a>
                            <a href="${pageContext.request.contextPath}/AdvanceSearchController?categoryId=${requestScope.categoryId}&manufacturerId=${requestScope.manufacturerId}&searchPrice=${requestScope.searchByPrice}&page=${requestScope.pageindex}&filterindex=2#menu" class="product-filter__btn ${filterindex == 2 ? "btn--primary" : ""}">Mới Nhất</a>
                            <a href="${pageContext.request.contextPath}/AdvanceSearchController?categoryId=${requestScope.categoryId}&manufacturerId=${requestScope.manufacturerId}&searchPrice=${requestScope.searchByPrice}&page=${requestScope.pageindex}&filterindex=3#menu" class="product-filter__btn ${filterindex == 3 ? "btn--primary" : ""}">Cũ nhất</a>

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
                                        <a href="${pageContext.request.contextPath}/AdvanceSearchController?categoryId=${requestScope.categoryId}&manufacturerId=${requestScope.manufacturerId}&searchPrice=${requestScope.searchByPrice}&page=${requestScope.pageindex}&filterindex=4#menu" class="select-input__item-link">Giá: Thấp đến Cao</a>
                                    </li>
                                    <li class="select-input__item">
                                        <a href="${pageContext.request.contextPath}/AdvanceSearchController?categoryId=${requestScope.categoryId}&manufacturerId=${requestScope.manufacturerId}&searchPrice=${requestScope.searchByPrice}&page=${requestScope.pageindex}&filterindex=5#menu" class="select-input__item-link">Giá: Cao đến Thấp</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="product-filter__page">
                                <span class="product-filter__page-num">
                                    <span class="product-filter__page-current">${requestScope.pageindex}</span>/${requestScope.totalpage}
                                </span>
                                <div class="product-filter__page-control">
                                    <a href="${pageContext.request.contextPath}/AdvanceSearchController?page=${requestScope.pageindex - 1}&filterindex=${sessionScope.filterindex}#menu" class="product-filter__page-btn ${requestScope.pageindex == 1 ? "product-filter__page-btn--disabled" : ""}">
                                        <i class="product-filter__page-icon fas fa-angle-left"></i>
                                    </a>
                                    <a href="${pageContext.request.contextPath}/AdvanceSearchController?page=${requestScope.pageindex + 1}&filterindex=${sessionScope.filterindex}#menu" class="product-filter__page-btn ${requestScope.pageindex == requestScope.totalpage ? "product-filter__page-btn--disabled" : ""}">
                                        <i class="product-filter__page-icon fas fa-angle-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="product-searched">
                            <div class="grid-container-product">
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
                                        <a class="btn-buy-product text-decoration-none" href="${pageContext.request.contextPath}/AddToCart?idProduct=${p.id}">Mua Ngay</a>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div id="paggerbottom" class="pagger"></div>
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        generatePagerAdvanceSearchController('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2, ${sessionScope.filterindex}, ${requestScope.categoryId}, ${requestScope.manufacturerId}, ${requestScope.searchByPrice});
    </script>
<!--    <script>
        var header = document.querySelector(".product-filter");
        var btns = header.getElementsByClassName("product-filter__btn");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("btn--primary");
                current[0].className = current[0].className.replace(" btn--primary", "");
                this.className += " btn--primary";
            });
        }
    </script>-->
</html>
