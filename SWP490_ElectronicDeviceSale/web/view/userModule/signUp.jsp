<%-- 
    Document   : register
    Created on : Feb 9, 2022, 7:12:38 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="assets/css/signup.css" rel="stylesheet" type="text/css"/>
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
        <title>Sign Up</title>
    </head>
    <body>
        <!-- Header and Menu-->
        <jsp:include page = "./header/header-menu.jsp" />
        <div class="container mt-5 style-form">
            <div class="row">
                <div class="col-6 p-0">
                    <img src="https://emerging-europe.com/wp-content/uploads/2018/11/bigstock-abstract-technology-background-250119211.jpg" alt="" width="550px" height="500px" class="background-form">
                    <div class="title-background">
                        <p>Hello, Friend</p>
                        <!-- <p>Please sign up in here</p> -->
                    </div>
                </div>
                <div class="col-6 my-auto">
                    <form action="SignUp" method="post">
                        <div class="form-group mb-3">            
                            <input type="text"" class="form-control" placeholder="Full name" name="name">          
                        </div>
                        <div class="form-group mb-3">
                            <input class="form-check-input" type="radio" id="flexRadioDefault1" name="gender" checked>
                            <label class="form-check-label" for="flexRadioDefault1">
                                Male
                            </label><input class="form-check-input ms-2" type="radio" id="flexRadioDefault2" name="gender">
                            <label class="form-check-label" for="flexRadioDefault2">
                                Female
                            </label>
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Email" name="email">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Phone Number" name="phonenumber">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text"  class="form-control" placeholder="User Name" name="username">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Password" name="password">
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Confirm Password" name="confirm">
                        </div>
                        <!-- Error message -->
                        <p style="color:red; display:block">${errorMsg}
                            <!-- /Error message -->
                        </p>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary">SingUp</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>


    </body>
</html>
