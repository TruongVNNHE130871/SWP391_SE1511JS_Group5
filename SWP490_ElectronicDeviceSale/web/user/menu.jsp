<%-- 
    Document   : menu
    Created on : Feb 8, 2022, 9:01:55 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="stylemenu.css" />
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
        <div class="container-fluid bg-danger">
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
            <div class="row text-center bg-secondary text-white mt-1">
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
                <div class="col-2 mt-1"><p>Dien Thoai</p></div>
            </div>
        </div>
    </body>
</html>
