<%-- 
    Document   : UserList
    Created on : Feb 27, 2022, 2:27:14 PM
    Author     : ASUS
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<%
    ArrayList<User> users = (ArrayList<User>) session.getAttribute("users");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
    </head>
    <body>
        <div>
            <table>
                <tr>
                    <th>
                        ID
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Username
                    </th>
                    <th>
                        PassWord
                    </th>
                    <th>
                        Gender
                    </th>
                    <th>
                        Phone
                    </th>
                    <th>
                        Email
                    </th>
                    <th>
                        Status
                    </th>                    
                <c:forEach items = "${users}" var= "user" end = "${users.size()}">
                <tr>
                    <td>
                        ${user.id}
                    </td>
                    <td>
                        ${user.name}
                    </td>
                    <td>
                        ${user.userName}
                    </td>
                    <td>
                        ${user.passWord}
                    </td>
                    <td>
                        <c:if test = "${user.gender == true}">Male</c:if>
                        <c:if test = "${user.gender == false}">Female</c:if>                         
                    </td>
                    <td>
                        ${user.phone}
                    </td>
                    <td>
                        ${user.email}
                    </td>
                    <td>
                        <c:if test = "${user.status == true}">Active</c:if>
                        <c:if test = "${user.status == false}">Banned</c:if>  
                    </td>                  
                </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
