<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Máy Tính Đơn Giản</title>
</head>
<body>
<div class="container mt-5">
    <h1 class="text-center">Máy Tính Đơn Giản</h1>
    <form action="calculator" method="post">
        <div class="form-group">
            <label for="num1">Toán hạng 1:</label>
            <input type="text" class="form-control" id="num1" name="num1" required />
        </div>
        <div class="form-group">
            <label for="operator">Toán tử:</label>
            <select class="form-control" id="operator" name="operator" required>
                <option value="+">Cộng</option>
                <option value="-">Trừ</option>
                <option value="*">Nhân</option>
                <option value="/">Chia</option>
            </select>
        </div>
        <div class="form-group">
            <label for="num2">Toán hạng 2:</label>
            <input type="text" class="form-control" id="num2" name="num2" required />
        </div>
        <button type="submit" class="btn btn-primary btn-block">Tính toán</button>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>