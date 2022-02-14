<%-- 
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
  DATE          Version       AUTHOR          DESCRIPTION
2022-02-13       1.0         TruongVNN        First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/assets" var="url"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/changepass.css" type="text/css"/>
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
    <title>Document</title>
</head>
<body>
    <!-- header and menu -->
    <jsp:include page = "./header/header-menu.jsp" />
    <!-- header and menu -->   
    <!-- form forget password -->
    <form action="changePassword" class="style-forget-password text-center" method="Post">
        <p class="fs-3">Change Password</p>
        <div class="form-group mb-3">
            <input type="text" name="currentPassword" placeholder="Current Password" required class="form-control mb-2">
        </div>
        <div class="form-group mb-3">
            <input type="text" name="newPassword" placeholder="New Password" required  class="form-control mb-2">
        </div>
        <div class="form-group mb-3">
            <input type="text" name="confirmPassword" placeholder="Confirm new Password" required class="form-control mb-2">
        </div>
        <div class="form-group mb-5">
            <a href="">Forgot Password?</a>
        </div>
        <div class="form-group">
            <button class="btn btn-primary">Save</button>
            <!-- error message -->
            <p style="color:red; display:block">
                    ${errorMsg}
            </p>
            <!-- error message-->
            <!-- success message -->
            <p style="color:blue; display:block">
                    ${successMsg}
            </p>
            <!-- success message -->
        </div>
    </form>
    <!-- form forget password -->
</body>
</html>
