<%-- 
    Document   : viewprofile
    Created on : Feb 8, 2022, 8:29:33 PM
    Author     : BH1704
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href=".././css/styles.css" />
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
        <form style="align-items: center;" class="edit-profile">
            <div class="container">
                <div class="row">
                    <div class="col-5 text-center form-group mb-5 border-end">
                        <div class="mb-4">
                            <img src="https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg" alt="" width="300" height="300" class="rounded-circle" />
                        </div>
                        <!-- <button type="button" class="btn btn-outline-primary">Change Avatar</button> -->
                    </div>
                    <div class="col-6">
                        <table class="ms-auto mt-4">
                            <tr>
                                <td class="">
                                    <label for="username" class="label my-3 ">UserName: </label>
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
                                    <p class="m-0 ms-4">Dinh Van Binh</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="gender" class="label my-3">Gender: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">Male</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="email" class="label my-3">Email: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">binhdvse04856@fpt.edu.vn</p>
                                </td>
                            </tr>
                            <tr>
                                <td class="tdLabel">
                                    <label for="phone_number" class="label my-3">Phone Number: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">301203120030</p>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label for="dob" class="label my-3">Date Of Birth: </label>
                                </td>
                                <td>
                                    <p class="m-0 ms-4">01/01/2020</p>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="form-group text-center">
                <a href="./editprofile.jsp"><button type="button" class="btn btn-outline-primary">Edit Profile</button></a>       
            </div>
        </form>
    </body>
</html>
