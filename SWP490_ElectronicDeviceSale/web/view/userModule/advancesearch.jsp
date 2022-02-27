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
        <link href="${url}/css/stylemenu.css" rel="stylesheet" type="text/css"/>
        <link href="${url}/css/styleAdvance.css" rel="stylesheet" type="text/css"/>
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
        <title>Advance Search Page</title>
    </head>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->
    <body>
        <div class="container advanced-search">
            <div class="row">
                <div class="col-2">
                    <div class="product-portfolio">
                        <p class="text-center mt-3">Tất Cả Danh Mục</p><hr>
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/AdvanceSearchController?idCategory=-1">Sản phẩm</a></li>
                                <c:forEach items="${requestScope.categories}" var="c">
                                <li><a href="${pageContext.request.contextPath}/AdvanceSearchController?idCategory=${c.id}">${c.name}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                </div>
                <div class="col-10">
                    <div class="choose-item-search">
                        <div class="d-flex justify-content-around">
                            <div class="my-auto"><p class="m-0">Sắp Xếp Theo</p></div>
                            <div class="my-auto"><button class="format-btn">Phổ Biến</button></div>
                            <div class="my-auto"><button class="format-btn">Mới Nhất</button></div>
                            <div class="my-auto"><button class="format-btn">Bán Chạy</button></div>                 

                            <div class="dropdown">
                                <button onclick="myFunction()" class="dropbtn dropdown-toggle">Giá</button>
                                <div id="myDropdown" class="dropdown-content">
                                    <a href="#">Link 1</a>
                                    <a href="#">Link 2</a>
                                    <a href="#">Link 3</a>
                                </div>
                            </div> 


                            <div class="my-auto">
                                <span>1/14</span>
                                <button class="btn-pagination-left"><</button>
                                <button class="btn-pagination-right">></button>
                            </div>
                        </div>
                    </div>                  

                    <div class="product-searched">
                        <div class="grid-container-hot-product">
                            <c:forEach items="${requestScope.products}" var="p">
                                <div class="grid-item text-center py-2">
                                    <div class="img-product">
                                        <a href="${pageContext.request.contextPath}/ProductDetailController?idProduct=${p.id}"><img src="${p.image}" alt="" width="200px" height="200px"></a>
                                    </div>
                                    <p class="title-phone">${p.name}</p>
                                    <div class="money">
                                        <p class="money-phone">${p.price} VNĐ</p>
                                        <span class="text-decoration-line-through title-sale">34,990,000 VNĐ</span>
                                    </div>
                                    <button class="btn-add-cart">Thêm Vào Giỏ</button>
                                    <button class="btn-buy-product">Mua Ngay</button>
                                </div>
                            </c:forEach>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
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
    </body>
</html>
