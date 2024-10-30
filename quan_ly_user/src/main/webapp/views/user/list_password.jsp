<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 10/30/2024
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

        <h2>User List with Password</h2>
        <table border="1" cellpadding="5">
            <tr>
                <th>name</th>
                <th>Email</th>
                <th>Password</th>
            </tr>
            <c:forEach items="${showWithPassword}" var="user">
                <tr>
                    <td>${user.name}</td>
                    <td>${user.email}</td>
                    <td>${user.password}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>
