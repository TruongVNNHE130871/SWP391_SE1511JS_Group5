<%-- 
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
  DATE          Version       AUTHOR          DESCRIPTION
2022-02-10       1.0         VinhNT         First Implement
--%>

<!DOCTYPE html>
<html lang="en">
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <c:url value = "/assets" var="url"/>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/forgetpassword.css" type="text/css"/>
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
        <!-- form forget password -->
        <form method="Post" class="style-forget-password text-center">
            <p class="fs-3">Forget Password</p>
            <div class="form-group mb-5">
                <input type="text" placeholder="Email" class="form-control mb-2" name="email" required>            
                <a href="">Try to Log in?</a>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Send code</button>
                <!-- success message -->
                <p style="color:blue; display:block">
                    ${successMsg}
                </p>
                <!-- error message -->
                <p style="color:red; display:block">
                    ${errorMsg}                               
                </p>
            </div>
        </form>
    </body>
</html>