<%-- 
    Document   : forgotPassword
    Created on : Feb 10, 2022, 10:50:26 PM
    Author     : ASUS
--%>

<!DOCTYPE html>
<html lang="en">
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
    <!-- header and menu -->
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
    <!-- form forget password -->
    <form action="" class="style-forget-password text-center">
        <p class="fs-3">Forget Password</p>
        <div class="form-group mb-5">
            <input type="text" placeholder="Email" class="form-control mb-2">
            <a href="">Try to Log in?</a>
        </div>
        <div class="form-group">
            <button class="btn btn-primary">Send code</button>
        </div>
    </form>
</body>
</html>