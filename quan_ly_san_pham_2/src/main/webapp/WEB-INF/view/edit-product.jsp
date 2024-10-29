<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
</head>
<body>
<h2>Edit Product</h2>
<form action="products" method="post">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="${product.id}">
    Name: <input type="text" name="name" value="${product.name}" required><br>
    Manufacturer: <input type="text" name="manufacturer" value="${product.manufacturer}" required><br>
    Price: <input type="number" name="price" value="${product.price}" step="0.01" required><br>
    Description: <textarea name="description">${product.description}</textarea><br>
    Quantity: <input type="number" name="quantity" value="${product.quantity}" required><br>
    <input type="submit" value="Update Product">
</form>
<a href="products?action=list">Back to Product List</a>
</body>
</html>