<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kết Quả Chuyển Đổi</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1 {
            color: #4CAF50;
        }
        .result {
            margin-top: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<h1>KẾT QUẢ CHUYỂN ĐỔI</h1>

<div class="result">
    <h2>Rate: <%= request.getAttribute("rate") != null ? String.format("%.2f", request.getAttribute("rate")) : "N/A" %></h2>
    <h3>VND: <%= request.getAttribute("vnd") != null ? String.format("%.2f", request.getAttribute("vnd")) : "N/A" %></h3>
    <h3>USD: <%= request.getAttribute("usd") != null ? String.format("%.2f", request.getAttribute("usd")) : "N/A" %></h3>
</div>

<a href="convert.jsp">Quay lại trang chuyển đổi</a>

<% if (request.getAttribute("errorMessage") != null) { %>
<div style="color: red;">
    <%= request.getAttribute("errorMessage") %>
</div>
<% } %>
</body>
</html>