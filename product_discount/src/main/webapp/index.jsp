<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Product Discount Calculator</title>
</head>
<body>
<h1>Product Discount Calculator</h1>
<form action="discount" method="post">
    <label for="description">Product Description:</label><br>
    <input type="text" id="description" name="description" required><br><br>

    <label for="listPrice">List Price:</label><br>
    <input type="number" id="listPrice" name="listPrice" required step="0.01"><br><br>

    <label for="discountPercent">Discount Percent:</label><br>
    <input type="number" id="discountPercent" name="discountPercent" required step="0.01" min="0" max="100"><br><br>

    <input type="submit" value="Calculate Discount">
</form>
</body>
</html>