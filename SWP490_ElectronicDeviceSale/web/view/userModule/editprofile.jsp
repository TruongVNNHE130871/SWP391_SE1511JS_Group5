<%-- 
    Document   : editprofile
    Created on : Feb 8, 2022, 8:31:07 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
        <link href="../../assets/css/stylesprofile.css" rel="stylesheet" type="text/css"/>
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
        <form style="align-items: center;" action="EditProfileController" method="POST" class="profile border rounded p-4" id="content">
            <div class="container mb-3">
                <div class="row py-4">
                    <div class="col-6">
                        <input type="hidden" name="idUser" value="${requestScope.user.id}"/>
                        <table class="ms-auto mt-4">
                            <tr>
                                <td class="">
                                    <label for="username" class="label my-3">UserName: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">${sessionScope.user.userName}</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="register_name" class="label my-3">Full Name: </label>
                                </td>
                                <td class="form-valid">
                                    <input
                                        type="text"
                                        name="fullname"
                                        value="${requestScope.user.name}"
                                        placeholder="${requestScope.user.name}"
                                        size="35"
                                        class="ms-4"
                                        minlength="1"
                                        maxlength="30"
                                        pattern="^[a-zA-Z0-9]+"                          
                                        required
                                        />
                                    <span></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="gender" class="label my-3">Gender: </label>
                                </td>
                                <td>
                                    <input type="radio" ${requestScope.user.gender ? "checked = \"checked\"" : ""} name="gender" value="male" class="ms-4 form-check-input"/> 
                                    <label for="male">Male</label>
                                    <input type="radio" name="gender" ${!requestScope.user.gender ? "checked = \"checked\"" : ""} value="female" class="form-check-input"/>
                                    <label for="female">Female</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email" class="label my-3">Email: </label>
                                </td>
                                <td class="form-valid">
                                    <input
                                        type="email"
                                        name="email"
                                        placeholder="${requestScope.user.email}"
                                        size="35"
                                        class="ms-4"
                                        value="${requestScope.user.email}"
                                        minlength="4"
                                        maxlength="40" 
                                        title="The domain portion of the email address is invalid (the portion after the @)." 
                                        pattern="^([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x22([^\x0d\x22\x5c\x80-\xff]|\x5c[\x00-\x7f])*\x22))*\x40([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d)(\x2e([^\x00-\x20\x22\x28\x29\x2c\x2e\x3a-\x3c\x3e\x40\x5b-\x5d\x7f-\xff]+|\x5b([^\x0d\x5b-\x5d\x80-\xff]|\x5c[\x00-\x7f])*\x5d))*(\.\w{2,})+$"
                                        required
                                        />
                                    <span></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="phone_number" class="label my-3">Phone Number: </label>
                                </td>
                                <td class="form-valid">
                                    <input
                                        type="text"
                                        name="phone"
                                        value="${requestScope.user.phone}"
                                        placeholder="${requestScope.user.phone}"
                                        size="35"
                                        class="ms-4"
                                        pattern="[0-9]{10}"
                                        required
                                        />
                                    <span></span>
                                </td>
                            </tr>
                            <!-- <tr>
                              <td>
                                <label for="dob" class="label my-3">Date Of Birth: </label>
                              </td>
                              <td>
                                <input type="text" name="dob" placeholder="01/01/2000" size="35" class="ms-4"/>
                              </td>
                            </tr> -->
                        </table>
                    </div>
                    <div class="col-1 border-end"></div>
                    <div class="col-5 text-center form-group">
                        <div class="mb-4">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="200" height="200" class="rounded-circle  mb-4" />
                        </div>
                        <button type="button" class="btn btn-outline-secondary">Change Avatar</button>
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <input type="submit" class="btn btn-secondary" value="Save"/>  
            </div>
        </form>
    </body>
<!--    footer-->
    <jsp:include page = "./footer/footer.jsp" />
</html>