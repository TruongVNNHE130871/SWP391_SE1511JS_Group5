<%-- 
    Document   : register
    Created on : Feb 9, 2022, 7:12:38 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form style="align-items: center;">
            <table>
                <div class="container">
                    <h1>REGISTER</h1>
                    <tr>
                        <td>
                            <label>Fullname:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="gender">Gender:</label>
                            <input type="radio" name="gender" value="male"/>
                            <label for="male">Male</label>
                            <input type="radio" name="gender" value="female"/>
                            <label for="female">Female</label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Email:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Phone number:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Username:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Confirm password:</label>
                            <input type="text" placeholder="">
                        </td>
                    </tr>
                </div>
            </table>
            <div>
                <button type="button">Sign up</button>       
            </div>
        </form>
    </body>
</html>
