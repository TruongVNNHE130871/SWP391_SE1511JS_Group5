<%--
Copyright(C) 2021, Class SE1511-JS of FPT University
EDS.Shop
Electronic Device Sale Shop
Record of change:
DATE         Version       AUTHOR          DESCRIPTION
2022-02-08     1.0         BinhDV         First Implement
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="${url}/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
        <link href="assets/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
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
        <!-- Form edit profile-->
        <form style="align-items: center;"action="EditProfileController" method="POST" class="profile was-validated" id="content">
            <div class="container">
                <div class="row">
                    <div class="col-5 text-center form-group">
                        <div class="" style="margin-top: 160px">
                            <p class="text-white my-4 fs-5 fw-bold">Xin Chào, ${sessionScope.user.userName}</p>
                      
                            <input type="submit" class="btn btn-danger" value="Lưu thông tin"/> 
                        </div>  
                    </div>
                    <div class="col-7 my-4">
                        <input type="hidden" name="idUser" value="${requestScope.user.id}"/>
                        <table class="table" style="width: 90%; margin: auto;">
                            <thead>
                                <tr>
                                    <th scope="col" class="">Chỉnh sửa thông tin</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="py-3">Tài khoản: </td>
                                    <td></td>
                                    <td class="py-3">${sessionScope.user.userName}</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Họ Tên:</td>
                                    <td></td>
                                    <td class="py-3">
                                        <input 
                                            type="text"
                                            name="fullname"
                                            class="form-control is-invalid" 
                                            id="validationTextarea"
                                            value="${requestScope.user.name}"
                                            placeholder="${requestScope.user.name}"
                                            minlength="1"
                                            maxlength="50"
                                            pattern="^(?![\s.]+$)[a-zA-Z0-9\s.]*$"  
                                            required />
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Giới tính: </td>
                                    <td></td>
                                    <td class="py-3 d-flex">
                                        <div class="form-check me-4">
                                            <input type="radio" class="form-check-input" id="validationFormCheck2" ${requestScope.user.gender ? "checked = \"checked\"" : ""} name="gender" value="male" required>
                                            <label class="form-check-label" for="validationFormCheck2">Male</label>
                                        </div>
                                        <div class="form-check">
                                            <input type="radio" class="form-check-input" id="validationFormCheck3" name="gender" ${!requestScope.user.gender ? "checked = \"checked\"" : ""} value="female" required>
                                            <label class="form-check-label" for="validationFormCheck3">Female</label>
                                        </div>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Email: </td>
                                    <td></td>
                                    <td class="py-3">
                                        <input 
                                            type="email"
                                            name="email"
                                            class="form-control is-invalid" 
                                            id="validationTextarea"
                                            placeholder="${requestScope.user.email}"
                                            value="${requestScope.user.email}"
                                            minlength="4"
                                            maxlength="50" 
                                            title="The domain portion of the email address is invalid (the portion after the @)." 
                                            pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$"
                                            required>
                                    </td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td class="py-3">Số điện thoại: </td>
                                    <td></td>
                                    <td class="py-3">
                                        <input 
                                            type="text"
                                            name="phone"
                                            class="form-control is-invalid" 
                                            id="validationTextarea"
                                            value="${requestScope.user.phone}"
                                            placeholder="${requestScope.user.phone}"
                                            minlength="8"
                                            maxlength="10"
                                            pattern="^(?![\s.]+$)[0-9\s.]*$"
                                            required>
                                    </td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </form>
    </body>
    <!--    footer-->
    <jsp:include page = "./footer/footer.jsp" />
</html>