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
        <title>Sign Up</title>
    </head>
    <body>
        <form style="align-items: center;" method="POST" action="SignUp">
            <table>
                <div class="container">
                    <h1>Sign Up</h1>
                    <tr>
                        <td>
                            <label>Name:</label>
                            <input type="text" placeholder="Name" name="name">
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
                            <input type="text" placeholder="Email" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Phone number:</label>
                            <input type="text" placeholder="Phonenumber" name="phonenumber">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Username:</label>
                            <input type="text" placeholder="Username" name="username">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password:</label>
                            <input type="text" placeholder="Password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Confirm password:</label>
                            <input type="text" placeholder="Confirm" name="confirm">
                        </td>
                    </tr>
                </div>
            </table>
            <p style="color:red; display:block">
                ${errorMsg}
            </p>
            <div>
                <button type="submit" value="Signup">Sign up</button>       
            </div>
        </form>
    </body>
</html>
