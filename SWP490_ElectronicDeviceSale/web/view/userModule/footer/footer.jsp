<%-- 
    Document   : footer
    Created on : Feb 10, 2022, 4:11:36 AM
    Author     : soide
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer</title>
    </head>
    <body>
        <footer id="aa-footer">
            <!-- footer -->
            <div class="aa-footer-widget">
                <img src="${url}/images/logo.png" alt="logo img" width="80px"></a> 
                <ul class="aa-footer-nav">
                    <p style="color:#888; text-align: justify; width: 95%">Là đơn vị cung cấp các thiết bị điện tử.Chúng tôi luôn đặt tiêu chí về chất lượng và uy tín lên hàng đầu.</p>
                    <img src="${url}/images/dadangky.png" alt="logo img">
                </ul>
            </div>
        </footer>
    </body>
</html>
