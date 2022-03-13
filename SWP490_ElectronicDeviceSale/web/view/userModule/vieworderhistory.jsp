<%-- 
    Document   : vieworderhistory
    Created on : Mar 7, 2022, 7:00:39 PM
    Author     : admin
--%>

<%@page import="model.Order"%>
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
        <title>Lịch sử đặt hàng</title>
    </head>
    <!--Start header-menu-->
    <jsp:include page = "./header/header-menu.jsp" />
    <!--End header-menu-->
    <body>
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
            <div>
                <table class="table">
                    <tr class="tr">
                        <th class="th">
                            Mã đơn hàng
                        </th>
                        <th class="th">
                            Ngày đặt hàng
                        </th>
                        <th class="th">
                            Ngày giao hàng
                        </th>
                    </tr>
                    <c:forEach items="${requestScope.orders}" var="order">
                        <tr class="tr">
                            <td class="td">
                                ${order.id}
                            </td>
                            <td class="td">
                                ${order.created}
                            </td>
                            <td class="td">
                                ${order.deliveryDate}
                            </td>
                            <td class="td">
                                Xem chi tiết
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div id="paggerbottom" class="pagger"></div>
        </main>
    </body>
    <!-- custom js file link  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/pagger.js" type="text/javascript"></script>
    <script>
                            generatePagger('paggerbottom', ${requestScope.pageindex}, ${requestScope.totalpage}, 2);
    </script>
</html>
