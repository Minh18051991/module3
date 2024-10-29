<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Search Results</title>
</head>
<body>
<h2>Search Results</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Manufacturer</th>
        <th>Price</th>
        <th>Description</th>
        <th>Quantity</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.manufacturer}</td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.quantity}</td>
            <td>
                <a href="products?action=edit&id=${product.id}">Edit</a>
                <a href="products?action=delete&id=${product.id}">Delete</a>
                <a href="products?action=detail&id=${product.id}">View</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="products?action=list">Back to Product List</a>
</body>
</html>