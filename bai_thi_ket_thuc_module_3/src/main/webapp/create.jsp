<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Create Room Rental</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="container">
    <h1>Create Room Rental</h1>
    <form name="createForm" action="roomRentals?action=create" method="post" onsubmit="return validateForm()">
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
            <label for="startDate">Start Date:</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
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
        <button type="submit" class="btn btn-success">Create</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='roomRentals'">Cancel</button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    function validateForm() {
        let tenantName = document.getElementById("tenantName").value;
        let phoneNumber = document.getElementById("phoneNumber").value;
        let startDate = document.getElementById("startDate").value;
        let paymentMethod = document.getElementById("paymentMethod").value;
        let notes = document.getElementById("notes").value;

        let nameRegex = /^[a-zA-Z\s]{5,50}$/;
        let phoneRegex = /^\d{10}$/;

        let isValidName = false;
        let isValidPhone = false;
        let isValidDate = false;
        let isValidPayment = false;
        let isValidNotes = false;

        if (tenantName === "") {
            document.getElementById("errorName").innerText = "Yêu cầu nhập tên";
        } else if (!nameRegex.test(tenantName)) {
            document.getElementById("errorName").innerText = "Tên chưa đúng";
        } else {
            isValidName = true;
            document.getElementById("errorName").innerText = "";
        }

        if (phoneNumber === "") {
            document.getElementById("errorPhone").innerText = "Yêu cầu nhập SĐT";
        } else if (!phoneRegex.test(phoneNumber)) {
            document.getElementById("errorPhone").innerText = "SĐT chưa đúng";
        } else {
            isValidPhone = true;
            document.getElementById("errorPhone").innerText = "";
        }

        if (startDate === "") {
            document.getElementById("errorDate").innerText = "Yêu cầu nhập ngày bắt đầu";
        } else {
            let dateObject = new Date(startDate);
            if (dateObject < new Date()) {
                document.getElementById("errorDate").innerText = "Ngày bắt đầu không thể là quá khứ";
            } else {
                isValidDate = true;
                document.getElementById("errorDate").innerText = "";
            }
        }

        if (paymentMethod === "") {
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

        return isValidName && isValidPhone && isValidDate && isValidPayment && isValidNotes;
    }
</script>
</body>
</html>