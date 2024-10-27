<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Kết Quả Tính Toán</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Kết Quả Tính Toán</h1>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">
            <strong>Lỗi!</strong> ${error}
        </div>
    </c:if>

    <c:if test="${not empty result}">
        <div class="alert alert-success">
            <strong>Kết quả:</strong> ${result}
        </div>
    </c:if>

    <a href="/calculator" class="btn btn-secondary btn-block">Quay lại</a>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>