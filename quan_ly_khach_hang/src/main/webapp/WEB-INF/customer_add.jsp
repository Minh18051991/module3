<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/29/2024
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Create New Customer</title>
</head>
<body>
<h2>Create New Customer</h2>
<form action="create" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br><br>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>
    <input type="submit" value="Create">
</form>


</body>
</html>
