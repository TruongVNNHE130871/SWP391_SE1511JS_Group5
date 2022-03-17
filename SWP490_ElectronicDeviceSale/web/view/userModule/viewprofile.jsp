<%-- 
    Document   : viewprofile
    Created on : Feb 8, 2022, 8:29:33 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${url}/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
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
    </head>
    <body>
        <!-- Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <!-- Form View Profile-->
        <form style="align-items: center;" class="profile border rounded p-4" id="content">
            <div class="container mb-3">
                <div class="row py-4">
                    <div class="col-5">
                        <table class="ms-auto mt-4">
                            <tr>
                                <td class="">
                                    <label for="username" class="label my-3 ">UserName: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">${sessionScope.user.userName}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="register_name" class="label my-3">Full Name: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">${sessionScope.user.name}</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="gender" class="label my-3">Gender: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">
                                        ${sessionScope.user.gender ? "Male" : "Female"}
                                    </p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email" class="label my-3">Email: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">${sessionScope.user.email}</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="phone_number" class="label my-3">Phone Number: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">${sessionScope.user.phone}</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="col-2 border-end"></div>
                    <div class="col-5 text-center form-group">
                        <div class="mb-4">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="200" height="200" class="rounded-circle mt-4"/>
                        </div>
                        <!-- <button type="button" class="btn btn-outline-primary">Change Avatar</button> -->

                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <a href="${pageContext.request.contextPath}/EditProfileController"><button type="button" class="btn btn-outline-secondary">Edit Profile</button></a>       
            </div>
        </form>
    </body>
    <!--footer-->
    <jsp:include page = "./footer/footer.jsp" />
</html>
