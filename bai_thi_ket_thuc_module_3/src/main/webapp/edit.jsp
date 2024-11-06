<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Room Rental</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Edit Room Rental</h1>
    <form action="roomRentals?action=edit" method="post">
        <input type="hidden" name="roomId" value="${roomRental.roomId}">
        <div class="form-group">
            <label for="tenantName">Tenant Name:</label>
            <input type="text" class="form-control" id="tenantName" name="tenantName" value="${roomRental.tenantName}" required>
        </div>
        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" value="${roomRental.phoneNumber}" required>
        </div>
        <div class="form-group">
            <label for="startDate">Start Date (dd-mm-yyyy):</label>
            <input type="text" class="form-control" id="startDate" name="startDate" value="${roomRental.startDate}" required>
        </div>
        <div class="form-group">
            <label for="paymentMethod">Payment Method:</label>
            <select class="form-control" id="paymentMethod" name="paymentMethod" required>
                <option value="monthly" ${roomRental.paymentMethodId == 1 ? 'selected' : ''}>Monthly</option>
                <option value="quarterly" ${roomRental.paymentMethodId == 2 ? 'selected' : ''}>Quarterly</option>
                <option value="yearly" ${roomRental.paymentMethodId == 3 ? 'selected' : ''}>Yearly</option>
            </select>
        </div>
        <div class="form-group">
            <label for="notes">Notes:</label>
            <textarea class="form-control" id="notes" name="notes" maxlength="200">${roomRental.notes}</textarea>
        </div>
        <button type="submit" class="btn btn-success">Update</button>
        <button type="button" class="btn btn-secondary" onclick="window.location.href='roomRentals'">Cancel</button>
    </form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>