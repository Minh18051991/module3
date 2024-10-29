<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>User Management - Search</title>
</head>
<body>
<center>
  <h1>User Management System</h1>
  <h2>
  </h2>
</center>

<div align="center">
  <h2>Search Users by Country</h2>
  <form action="/users" method="post">
    <input type="hidden" name="action" value="search">
    <label for="search_country">Country:</label>
    <input type="text" id="search_country" name="search_country" required>
    <input type="submit" value="Search">
  </form>

  <c:if test="${not empty requestScope.message}">
    <div style="color: green;">${requestScope.message}</div>
  </c:if>

  <table border="1" cellpadding="5">
    <caption><h2>User List</h2></caption>
    <tr>
      <th>ID</th>
      <th>Username</th>
      <th>Email</th>
      <th>Country</th>
      <th>Action</th>
    </tr>
    <c:forEach items="${listUsers}" var="user">
      <tr>
        <td>${user.id}</td>
        <td>${user.name}</td>
        <td>${user.email}</td>
        <td>${user.country}</td>
        <td>
          <a href="/users?action=edit&id=${user.id}">Edit</a> |
          <a href="/users?action=delete&id=${user.id}" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
        </td>
      </tr>
    </c:forEach>
  </table>


  <c:if test="${empty listUsers}">
    <tr>
      <td colspan="5">No users found for the specified country.</td>
    </tr>
  </c:if>
</div>

</body>
</html>