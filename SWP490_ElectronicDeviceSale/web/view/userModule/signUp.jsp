<%-- 
    Document   : register
    Created on : Feb 9, 2022, 7:12:38 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../../assets/css/signup.css" rel="stylesheet" type="text/css"/>
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
        <div class="container-fluid bg-danger " id="header">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-2">
                    <img src="https://inbienquangcao.vn/wp-content/uploads/2020/12/Nhu%CC%9B%CC%83ng-tho%CC%82ng-%C4%91ie%CC%A3%CC%82p-sa%CC%82u-sa%CC%86%CC%81c-phi%CC%81a-sau-logo-FPT.png" alt="" width="150" height="60">
                </div>
                <div class="col-5 mt-3 ">
                    <input type="text" size="40">
                    <button>A</button>
                </div>
                <!-- <div class="col-1"></div> -->
                <div class="col-2 mt-3 text-white">IconUser Text</div>
                <div class="col-1 mt-2">
                    <button class="btn btn-primary text-white">
                        logout
                    </button>
                </div>
                <div class="col-1 mt-3 text-white">IconCart</div>
            </div>
            <div class="row text-center bg-dark text-white mt-1">
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>
                <div class="col-2"><a class="category-link">Dien Thoai</a></div>

            </div>
        </div>
        <div class="container mt-5 style-form">
            <div class="row">
                <div class="col-6 p-0">
                    <img src="https://emerging-europe.com/wp-content/uploads/2018/11/bigstock-abstract-technology-background-250119211.jpg" alt="" width="550px" height="500px" class="background-form">
                    <div class="title-background">
                        <p>Hello, Friend</p>
                        <!-- <p>Please sign up in here</p> -->
                    </div>
                </div>
                <div class="col-6 my-auto"></div>
                <form method="POST" action="SignUp">
                    <div class="form-group mb-3">            
                        <input type="text" class="form-control" placeholder="FullName">          
                    </div>
                    <div class="form-group mb-3">
                        <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                        <label class="form-check-label" for="flexRadioDefault1">
                            Male
                        </label><input class="form-check-input ms-2" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
                        <label class="form-check-label" for="flexRadioDefault2">
                            Female
                        </label>
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" placeholder="Email">
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" placeholder="Phone Number">
                    </div>
                    <div class="form-group mb-3">
                        <input type="text"  class="form-control" placeholder="User Name">
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" placeholder="Password">
                    </div>
                    <div class="form-group mb-3">
                        <input type="text" class="form-control" placeholder="Confirm Password">
                    </div>
                    <div class="form-group text-center">
                        <button class="btn btn-primary">SingUp</button>
                    </div>
                    <p style="color:red; display:block">
                        ${errorMsg}
                    </p>
                    <div>
                        <button type="submit" value="Signup">Sign up</button>       
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
