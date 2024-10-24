<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Currency convert</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
<h1>Currency Convercy</h1>
<form action="/convert" method="post">
    <label>rate :</label> <br/>
    <input type="text" name="rate" placeholder="RATE" value="22000"/> <br/>
    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" value="1000"/> <br/>
    <input type="submit" id="submit" value="Convert"/>
    <input type="reset" value="Reset"/>
</form>
</body>
</html>