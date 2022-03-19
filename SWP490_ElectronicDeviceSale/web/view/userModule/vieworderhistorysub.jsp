
<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
DATE         Version       AUTHOR          DESCRIPTION
2022-01-07     1.0         CuongTV         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

    </head>

    <script>
        function modifyState(n) {
            window.history.replaceState("data",
                    "Page " + n, "http://localhost:8080/SWP490_ElectronicDeviceSale/ViewOrderHistory?show=" + n);
            return false;
        }
    </script>
    <body>
        <div class="line-nav nav">
            <a class="nav-link ${indexStatus == "1" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=1" onclick="modifyState(1)">Chờ xác nhận</a>
            <a class="nav-link ${indexStatus == "2" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=2" onclick="modifyState(2)">Chờ lấy hàng</a>
            <a class="nav-link ${indexStatus == "3" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=3" onclick="modifyState(3)">Đã giao</a>
            <a class="nav-link ${indexStatus == "4" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=4" onclick="modifyState(4)">Đã huỷ</a>
        </div>
        <div class="product-list">
            <div class="product-order">
                <c:forEach items="${params}" var="entry">
                    <div class="product-order-container">
                        <c:set var = "sumPrice" value = "${0}"/>
                        <c:forEach items="${entry.value}" var="item">
                            <div class="row product-single">
                                <div class="col-2">
                                    <img src="${item.product.image}" alt="" width="80" height="80">
                                </div>
                                <div class="col-7">
                                    <p>${item.product.name} ${item.product.ram}gb</p>
                                    <p>x${item.qty}</p>
                                </div>
                                <div class="col-3">
                                    <p><b>Đơn giá: </b> ${item.product.price} VNĐ</p>
                                    <p><b>Tổng số tiền: </b> <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}"/> VNĐ</p>
                                </div>
                            </div>
                            <hr>
                            <c:set var = "sumPrice" value = "${sumPrice + item.price}"/>
                        </c:forEach>
                        <div class="status-and-price">
                            <div class="order-status">
                                <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-free-shipping-line"><g><line fill="none" stroke-linejoin="round" stroke-miterlimit="10" x1="8.6" x2="4.2" y1="9.8" y2="9.8"></line><circle cx="3" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><circle cx="10" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><line fill="none" stroke-miterlimit="10" x1="10.5" x2="14.4" y1="7.3" y2="7.3"></line><polyline fill="none" points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1" stroke-linejoin="round" stroke-miterlimit="10"></polyline><polyline fill="none" points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2" stroke-linejoin="round" stroke-miterlimit="10"></polyline></g></svg>
                                ${requestScope.statusText}
                            </div>
                            <div class="order-sumprice">Tổng số tiền: <fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sumPrice}"/> VNĐ</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <c:if test="${requestScope.emptyText != null}">
                <div class="order-empty-container">
                    <div class="order-empty">
                        <div class="order-empty-icon"></div>
                        <div class="order-empty-text">${requestScope.emptyText}</div>
                    </div>
                </div>
            </c:if>
        </div>
        <div id="paggerbottom" class="pagger"></div>
    </body>
    <script>
        var navHeader = document.querySelector(".line-nav.nav");
        var navLinks = navHeader.getElementsByClassName("nav-link");
        for (var i = 0; i < navLinks.length; i++) {
            navLinks[i].addEventListener("click", function () {
                var current = document.getElementsByClassName("active");
                current[0].className = current[0].className.replace(" active", "");
                this.className += " active";
            });
        }
    </script>
</html>
