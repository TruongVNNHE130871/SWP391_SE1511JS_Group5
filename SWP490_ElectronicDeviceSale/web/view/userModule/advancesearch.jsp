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
                        <div class="choose-item-search">
                            <div class="d-flex justify-content-around">
                                <div class="my-auto">
                                    <p class="m-0">Sắp Xếp Theo</p>
                                </div>
                                <div class="my-auto"><button class="format-btn">Bán chạy nhất</button></div>
                                <div class="my-auto"><input type="submit" value="Giá thấp" class="format-btn"/></div>
                                <div class="my-auto"><input type="submit" value="Giá cao" class="format-btn"/></div>
                                <div class="my-auto dropdown">

                                    <a class="format-btn-price dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                       data-bs-toggle="dropdown" aria-expanded="false">
                                        Giá
                                    </a>

                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                                        <li><a class="dropdown-item" href="#">Action</a></li>
                                        <li><a class="dropdown-item" href="#">Another action</a></li>
                                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                                    </ul>

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
                    </div>
                </div>
            </form>
        </div>
    </body>
    <script>
        /* When the user clicks on the button,
         toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }

        // Close the dropdown menu if the user clicks outside of it
        window.onclick = function (event) {
            if (!event.target.matches('.dropbtn')) {
                var dropdowns = document.getElementsByClassName("dropdown-content");
                var i;
                for (i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');
                    }
                }
            }
        }
    </script>
</html>
