<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>List Customer</title>
</head>
<body>
<h1>List Customer</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên</th>
        <th>Ngày sinh</th>
        <th>Địa chỉ</th>
        <th>Ảnh</th>
    </tr>
    <c:forEach var="customer" items="${customers}" varStatus="status">
        <tr>
            <td>${status.index + 1}</td>
            <td>${customer.name}</td>
            <td>${customer.birthDate}</td>
            <td>${customer.address}</td>
            <td>
                <img src="#">
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>