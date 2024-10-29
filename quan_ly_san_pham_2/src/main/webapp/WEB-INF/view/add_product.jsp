<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h2>Add New Product</h2>
<form action="products" method="post">
    <input type="hidden" name="action" value="add">
    Name: <input type="text" name="name" required><br>
    Manufacturer: <input type="text" name="manufacturer" required><br>
    Price: <input type="number" name="price" step="0.01" required><br>
    Description: <textarea name="description"></textarea><br>
    Quantity: <input type="number" name="quantity" required><br>
    <input type="submit" value="Add Product">
</form>
<a href="products?action=list">Back to Product List</a>
</body>
</html>