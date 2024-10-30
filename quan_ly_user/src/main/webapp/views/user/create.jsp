<%@ page import="org.example.quan_ly_user.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/29/2024
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="users?action=users">Add New User</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption><h2>Add New User</h2></caption>
            <tr>
                <th>Username</th>
                <td>
                    <input type="text" name="name" required>
                </td>
                <th>Email</th>
                <td>
                    <input type="email" name="email" required>
                </td>
                <th>Country</th>
                <td>
                    <input type="text" name="country" required>
                </td>
            </tr>
            <tr>
                <th>Permisson:</th>
                <td>
                    <input type="checkbox" name="add" size="15"/> Add |
                    <input type="checkbox" name="edit" size="15"/> Edit |
                    <input type="checkbox" name="delete" size="15"/> Delete
                    <input type="checkbox" name="view" size="15"/> View
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit"  value="Add User">
                </td>
            </tr>
        </table>
    </form>
</div>
<div align="center"> <button onclick="window.location.href='users?action=users'">Back to List</button></div>
</body>
</html>

