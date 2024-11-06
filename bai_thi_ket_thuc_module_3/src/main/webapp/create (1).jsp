<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Room Rental</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        function checkForm() {
            let tenantName = document.getElementById("tenantName").value;
            let phoneNumber = document.getElementById("phoneNumber").value;
            let startDate = document.getElementById("startDate").value;
            let paymentMethod = document.getElementById("paymentMethod").value;
            let notes = document.getElementById("notes").value;

            let nameRegex = /^[a-zA-Z\s]{5,50}$/;
            let phoneRegex = /^\d{10}$/;
            let dateRegex = /^\d{2}-\d{2}-\d{4}$/;

            let isValidName = false;
            let isValidPhone = false;
            let isValidDate = false;
            let isValidPayment = false;
            let isValidNotes = false;

            if (tenantName == "") {
                document.getElementById("errorName").innerText = "Yêu cầu nhập tên";
            } else if (!nameRegex.test(tenantName)) {
                document.getElementById("errorName").innerText = "Tên chưa đúng";
            } else {
                isValidName = true;
                document.getElementById("errorName").innerText = "";
            }

            if (phoneNumber == "") {
                document.getElementById("errorPhone").innerText = "Yêu cầu nhập SĐT";
            } else if (!phoneRegex.test(phoneNumber)) {
                document.getElementById("errorPhone").innerText = "SĐT chưa đúng";
            } else {
                isValidPhone = true;
                document.getElementById("errorPhone").innerText = "";
            }

            if (startDate == "") {
                document.getElementById("errorDate").innerText = "Yêu cầu nhập ngày bắt đầu";
            } else if (!dateRegex.test(startDate)) {
                document.getElementById("errorDate").innerText = "Ngày chưa đúng";
            } else {
                const dateParts = startDate.split("-");
                const dateObject = new Date(dateParts[2], dateParts[1] - 1, dateParts[0]);
                if (dateObject < new Date()) {
                    document.getElementById("errorDate").innerText = "Ngày bắt đầu không thể là quá khứ";
                } else {
                    isValidDate = true;
                    document.getElementById("errorDate").innerText = "";
                }
            }

            if (paymentMethod == "") {
                document.getElementById("errorPayment").innerText = "Yêu cầu chọn phương thức thanh toán";
            } else {
                isValidPayment = true;
                document.getElementById("errorPayment").innerText = "";
            }

            if (notes.length > 200) {
                document.getElementById("errorNotes").innerText = "Ghi chú không được vượt quá 200 ký tự";
            } else {
                isValidNotes = true;
                document.getElementById("errorNotes").innerText = "";
            }

            let isValid = isValidName && isValidPhone && isValidDate && isValidPayment && isValidNotes;

            if (isValid) {
                document.getElementById("btn-save").disabled = false;
            } else {
                document.getElementById("btn-save").disabled = true;
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Create Room Rental</h1>
    <form name="createForm" action="roomRentals?action=create" method="post" oninput="checkForm()">
        <div class="form-group">
            <label for="tenantName">Tenant Name:</label>
            <input type="text" class="form-control" id="tenantName" name="tenantName" required>
            <small style="color: red" id="errorName"></small>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" required>
            <small style="color: red" id="errorPhone"></small>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date (dd-mm-yyyy):</label>
            <input type="text" class="form-control" id="startDate" name="startDate" required>
            <small style="color: red" id="errorDate"></small>
        </div>
        <div class="form-group">
            <label for="paymentMethod">Payment Method:</label>
            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                <option value="monthly">Monthly</option>
                <option value="quarterly">Quarterly</option>
                <option value="yearly">Yearly</option>
            </select>
            <small style="color: red" id="errorPayment"></small>
        </div>
        <div class="form-group">
            <label for="notes">Notes:</label>
            <textarea class="form-control" id="notes" name="notes" maxlength="200"></textarea>
            <small style="color: red" id="errorNotes"></small>
        </div>
        <button id="btn-save" class="btn btn-success" type="submit" disabled>Create</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='roomRentals'">Cancel</button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>