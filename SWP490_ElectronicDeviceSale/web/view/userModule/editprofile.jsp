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
        <!--<link rel="stylesheet" href="../userModule/assets/css/styles.css" />-->
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
        <form style="align-items: center;" class="edit-profile">
            <div class="container">
                <div class="row">
                    <div class="col-5 text-center form-group mb-5 border-end">
                        <div class="mb-4">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="300" height="300" class="rounded-circle" />
                        </div>
                        <button type="button" class="btn btn-outline-primary">Change Avatar</button>
                    </div>
                    <div class="col-6">
                        <table class="ms-auto mt-4">
                            <tr>
                                <td class="">
                                    <label for="username" class="label my-3">UserName: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">dinhvanbinh97</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="register_name" class="label my-3">Full Name: </label>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        name="fullname"
                                        value=""
                                        placeholder="Dinh Van Binh"
                                        size="35"
                                        class="ms-4"                   
                                        />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="gender" class="label my-3">Gender: </label>
                                </td>
                                <td>
                                    <input type="radio" name="gender" value="male" class="ms-4 form-check-input"/>
                                    <label for="male">Male</label>
                                    <input type="radio" name="gender" value="female" class="form-check-input"/>
                                    <label for="female">Female</label>
                                    <input type="radio" name="gender" value="other" class="form-check-input"/>
                                    <label for="other_gender">Others</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email" class="label my-3">Email: </label>
                                </td>
                                <td>
                                    <input
                                        type="email"
                                        name="email"
                                        placeholder="binhdvse04856@gmail.com"
                                        size="35"
                                        class="ms-4"
                                        />
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="phone_number" class="label my-3">Phone Number: </label>
                                </td>
                                <td>
                                    <input
                                        type="text"
                                        name="phone"
                                        value=""
                                        placeholder="0320310320"
                                        size="35"
                                        class="ms-4"
                                        />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="dob" class="label my-3">Date Of Birth: </label>
                                </td>
                                <td>
                                    <input type="text" name="dob" placeholder="01/01/2000" size="35" class="ms-4"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <button type="button" class="btn btn-outline-primary">Save</button>       
            </div>
        </form>
    </body>
</html>
