<%-- 
<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
DATE         Version       AUTHOR          DESCRIPTION
2022-01-07        1.0         HungVT         First Implement
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
        <link href="${url}/css/signup.css" rel="stylesheet" type="text/css"/>
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
    <!--Start logo header left-->
    <header>
        <div class="img-header bg-light">
            <a href="${pageContext.request.contextPath}/HomePageController">
                <img src="${url}/images/logo-header.png" alt="" width="150" height="100" 
                     class="ms-5"></a><span class="title-logo fs-2 mx-2">Đăng ký</span>
        </div>
    </header>
    <!--End logo header left-->
    <body>
        <div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="img-logo-left">
                        <img src="${url}/images/logo-header.png" alt="" width="400" height="300">
                        <p class="title-logo-body">Nền tảng thương mại điện tử <br> phổ biến nhất trên thế giới </p>
                    </div>
                </div>
            <!-- Start signup form -->
            <div class="col-6">
                <form action="SignUp" method="post" style="align-items: center;" class="edit-signup">
                    <div class="form-signup">
                        <p class="title-signup text-center my-4">Đăng ký</p>
                        <div class="form-group">            
                            <input type="text" class="form-control mb-3" placeholder="Họ tên*" name="name" minlength="3" maxlength="20" pattern="^(?![\s.]+$)[a-zA-Z\s.]*$" tittle="Họ tên chỉ bao gồm ký tự" required>          
                        </div>
                        <div class="form-group mb-3">
                            <input type="radio" name="gender" value="male" checked>
                            <label for="male">
                                Nam
                            </label>
                            <input type="radio" name="gender">
                            <label for="female">
                                Nữ
                            </label>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control mb-3" placeholder="Email*" name="email" pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*$" tittle="Email nhập theo dạng: abc123@gmail.com" required>
                        </div>
                        <div class="form-group mb-3">
                            <input type="text" class="form-control" placeholder="Số điện thoại*" name="phonenumber" minlength="10" maxlength="10" pattern="^[0-9]{10}$" title="Số điện thoại bao gồm 10 chữ số" required>
                        </div>
                        <div class="form-group mb-3">
                            <input type="text"  class="form-control" placeholder="Tên đăng nhập*" name="username" minlength="3" maxlength="20" pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*$" required>
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" class="form-control" placeholder="Mật khẩu*" name="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" title="Mật khẩu bao gồm it nhất 1 ký tự Hoa, 1 ký tự số, 1 ký tự thường" required>
                        </div>
                        <div class="form-group mb-3">
                            <input type="password" class="form-control" placeholder="Xác thực mật khẩu" name="confirm">
                        </div>
                        <!-- Error message -->
                        <p style="color:red; display:block">${errorMsg}
                            <!-- /Error message -->
                        </p>
                        <div class="form-group text-center mb-3">
                            <button type="submit" class="btn btn-outline-success">Đăng ký</button>
                        </div>
                    </div>
                    <p class="text-singup text-center">Bạn đã có tài khoản? <a href="${pageContext.request.contextPath}/LoginController">Đăng nhập</a></p>
            </div>
        </div>
    </form>
</div>
<!-- End signup form -->
</div>
</div>
</div>



</body>
</html>
