
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
        </script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <script src="${url}/js/homepage.js" type="text/javascript" defer></script>
        <title>Electronic Device Order Page</title>
    </head>
    <script>
                    function modifyState(n) {
                        window.history.replaceState("data",
                                "Page " + n, "http://localhost:8080/SWP490_ElectronicDeviceSale/ViewOrderHistory?show=" + n);
                        return false;
                    }
    </script>

    <script>
        function cancelOrder(orderDetailId) {
            var confirmDelete = confirm("Do you want to cancel order?");
            if (confirmDelete) {
                window.location.href = "OrderCancelController?orderDetailId=" + orderDetailId;
            }
        }

        function buyAgain(orderDetailId) {
            window.location.href = "BuyAgainController?orderDetailId=" + orderDetailId;
        }
    </script>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->
    <body>
        <main id="content">
            <div class="line-nav nav">
                <a class="nav-link ${indexStatus == "1" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=1" onclick="modifyState(1)">Chờ xác nhận</a>
                <a class="nav-link ${indexStatus == "2" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=2" onclick="modifyState(2)">Chờ lấy hàng</a>
                <a class="nav-link ${indexStatus == "3" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=3" onclick="modifyState(3)">Đã giao</a>
                <a class="nav-link ${indexStatus == "4" ? "active": ""}" href="${pageContext.request.contextPath}/ViewOrderHistory?show=4" onclick="modifyState(4)">Đã huỷ</a>
            </div>

            <div class="product-list">

                <!--Start Block Order-->
                <div class="block-order">
                    <c:forEach items="${params}" var="entry">
                        <div class="box-order-container">
                            <div class="header-buy-return d-flex justify-content-between">
                                <div class="header-buy-return-left d-flex justify-content-between align-items-center">
                                    <div class="me-5">
                                        <p class="product-name-text">
                                            <b>Hoà Lạc</b>
                                        </p>
                                    </div>
                                    <div class="me-3">
                                        <button class="btn-chat">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-right-text-fill text-white" viewBox="0 0 16 16">
                                            <path d="M16 2a2 2 0 0 0-2-2H2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h9.586a1 1 0 0 1 .707.293l2.853 2.853a.5.5 0 0 0 .854-.353V2zM3.5 3h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1 0-1zm0 2.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1 0-1z"/>
                                            </svg>
                                            <span class="text-white text-chat">Chat</span>
                                        </button>
                                    </div>
                                    <div class="btn-view-shop">
                                        <a href="${pageContext.request.contextPath}/HomePageController" class="link-view-shop">
                                            <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-btn-shop"><path d="m15 4.8c-.1-1-.8-2-1.6-2.9-.4-.3-.7-.5-1-.8-.1-.1-.7-.5-.7-.5h-8.5s-1.4 1.4-1.6 1.6c-.4.4-.8 1-1.1 1.4-.1.4-.4.8-.4 1.1-.3 1.4 0 2.3.6 3.3l.3.3v3.5c0 1.5 1.1 2.6 2.6 2.6h8c1.5 0 2.5-1.1 2.5-2.6v-3.7c.1-.1.1-.3.3-.3.4-.8.7-1.7.6-3zm-3 7c0 .4-.1.5-.4.5h-8c-.3 0-.5-.1-.5-.5v-3.1c.3 0 .5-.1.8-.4.1 0 .3-.1.3-.1.4.4 1 .7 1.5.7.7 0 1.2-.1 1.6-.5.5.3 1.1.4 1.6.4.7 0 1.2-.3 1.8-.7.1.1.3.3.5.4.3.1.5.3.8.3zm.5-5.2c0 .1-.4.7-.3.5l-.1.1c-.1 0-.3 0-.4-.1s-.3-.3-.5-.5l-.5-1.1-.5 1.1c-.4.4-.8.7-1.4.7-.5 0-.7 0-1-.5l-.6-1.1-.5 1.1c-.3.5-.6.6-1.1.6-.3 0-.6-.2-.9-.8l-.5-1-.7 1c-.1.3-.3.4-.4.6-.1 0-.3.1-.3.1s-.4-.4-.4-.5c-.4-.5-.5-.9-.4-1.5 0-.1.1-.4.3-.5.3-.5.4-.8.8-1.2.7-.8.8-1 1-1h7s .3.1.8.7c.5.5 1.1 1.2 1.1 1.8-.1.7-.2 1.2-.5 1.5z"></path></svg>
                                            Xem Shop</a>
                                    </div>


                                </div>
                                <div class="header-buy-return-right d-flex justify-content-between align-items-center">
                                    <c:if test="${sessionScope.indexStatus == 1}">
                                        <p class="text-redmix text-uppercase">${requestScope.statusText}</p>
                                    </c:if>
                                    <c:if test="${sessionScope.indexStatus == 2}">
                                        <p class="text-delivery me-1">
                                            <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-free-shipping-line"><g><line fill="none" stroke-linejoin="round" stroke-miterlimit="10" x1="8.6" x2="4.2" y1="9.8" y2="9.8"></line><circle cx="3" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><circle cx="10" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><line fill="none" stroke-miterlimit="10" x1="10.5" x2="14.4" y1="7.3" y2="7.3"></line><polyline fill="none" points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1" stroke-linejoin="round" stroke-miterlimit="10"></polyline><polyline fill="none" points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2" stroke-linejoin="round" stroke-miterlimit="10"></polyline></g></svg></span>
                                            ${requestScope.statusText}
                                        </p>
                                        <span class="mx-2">|</span>
                                        <p class="text-redmix text-uppercase">ĐANG GIAO</p>
                                    </c:if>
                                    <c:if test="${sessionScope.indexStatus == 3}">
                                        <p class="text-delivery me-1">
                                            <svg enable-background="new 0 0 15 15" viewBox="0 0 15 15" x="0" y="0" class="shopee-svg-icon icon-free-shipping-line"><g><line fill="none" stroke-linejoin="round" stroke-miterlimit="10" x1="8.6" x2="4.2" y1="9.8" y2="9.8"></line><circle cx="3" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><circle cx="10" cy="11.2" fill="none" r="2" stroke-miterlimit="10"></circle><line fill="none" stroke-miterlimit="10" x1="10.5" x2="14.4" y1="7.3" y2="7.3"></line><polyline fill="none" points="1.5 9.8 .5 9.8 .5 1.8 10 1.8 10 9.1" stroke-linejoin="round" stroke-miterlimit="10"></polyline><polyline fill="none" points="9.9 3.8 14 3.8 14.5 10.2 11.9 10.2" stroke-linejoin="round" stroke-miterlimit="10"></polyline></g></svg></span>
                                            Giao hàng thành công
                                        </p>
                                        <span class="mx-2">|</span>
                                        <p class="text-redmix text-uppercase">${requestScope.statusText}</p>
                                    </c:if>
                                    <c:if test="${sessionScope.indexStatus == 4}">
                                        <p class="text-redmix text-uppercase">${requestScope.statusText}</p>
                                    </c:if>
                                </div>
                            </div>
                            <div class="seperate"></div>
                            <table class="table">
                                <tbody>
                                    <c:set var = "sumPrice" value = "${0}"/>
                                    <c:set var = "count" value = "${0}"/>
                                    <c:forEach items="${entry.value}" var="item">
                                        <c:set var = "count" value = "${count + 1}"/>
                                        <c:set var = "orderDetailId" value = "${item.orderDetailId}"/>
                                        <c:set var = "deliveryDate" value = "${item.deliveryDate}"/>
                                        <tr>
                                            <td>
                                                <div class="row">
                                                    <div class="col-1">
                                                        <img src="${item.product.image}" alt="" width="80" height="80">
                                                    </div>
                                                    <div class="col-9 my-auto">
                                                        <div class="product-single-name">
                                                            <span> ${item.product.name} </span>
                                                        </div>
                                                        <div class="product-classify">
                                                            <div class="product-classify-detail">Phân loại hàng: ${item.product.ram}GB, Màu sắc: Đỏ</div>
                                                            <div class="product-quantity">x${item.qty}</div>
                                                        </div>
                                                    </div>
                                                    <div class="col-2 my-auto">
                                                        <span class="old-price">₫${item.product.price}</span>
                                                        <span class="price-present">₫<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.price}"/></span>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                        <c:set var = "sumPrice" value = "${sumPrice + item.price}"/>
                                    </c:forEach>
                                </tbody>
                            </table>
                            <div class="float-end toal-price-order">Tổng số tiền: <span class="text-total-money"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${sumPrice}"/> <u>đ</u></span></div>
                            <div class="repurchase-cancel">
                                <c:if test="${sessionScope.indexStatus == 1}">
                                    <div class="order-delivery-status"><span>Chờ xác nhận</span></div>
                                </c:if>
                                <c:if test="${sessionScope.indexStatus == 2}">
                                    <div class="order-delivery-status"><span>Nhận sản phẩm trước <u>${requestScope.dateDelivery}</u></span></div>
                                            </c:if>
                                            <c:if test="${sessionScope.indexStatus == 3}">
                                    <div class="order-delivery-status"><span>Đã thanh toán</span></div>
                                </c:if>
                                <c:if test="${sessionScope.indexStatus == 4}">
                                    <div class="order-delivery-status"><span>Bạn đã huỷ <u>${deliveryDate}</u></span></div>
                                            </c:if>
                                <div class="order-delivery-btn">
                                    <div class="repurchase-btn">
                                        <c:if test="${sessionScope.indexStatus == 1 || sessionScope.indexStatus == 2}">
                                            <button class="stardust-button stardust-button--primary btn-cancel-repurchase cannot-cancel" onclick="buyAgain(${orderDetailId});">Mua lại</button>
                                        </c:if>
                                        <c:if test="${sessionScope.indexStatus == 3 || sessionScope.indexStatus == 4}">
                                            <button type="submit" class="stardust-button stardust-button--primary btn-cancel-repurchase" onclick="buyAgain(${orderDetailId});">Mua lại</button>
                                        </c:if>
                                    </div>
                                    <div class="cancel-btn">
                                        <c:if test="${sessionScope.indexStatus == 1}">
                                            <button type="submit" class="stardust-button stardust-button--secondary btn-cancel-repurchase" onclick="cancelOrder(${orderDetailId});">Huỷ đơn hàng</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <c:set var = "cart" scope="session" value = "${requestScope.cart}"/>
                <!--End Block Order-->
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
        </main>
        <!--Back to top-->
        <a id="button"></a>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                                                $(".cannot-cancel").prop("onclick", null).off("click");
    </script>
</html>
