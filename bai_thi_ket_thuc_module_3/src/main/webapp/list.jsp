<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <title>Room Rentals</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .container {
      margin-top: 20px;
    }
  </style>

</head>
<body>
<div class="container">
  <h1>Room Rentals</h1>
  <a href="roomRentals?action=create" class="btn btn-primary">Create New</a>
  <table class="table table-bordered table-striped mt-3">
    <thead>
    <tr>
      <th>Room ID</th>
      <th>Tenant Name</th>
      <th>Phone Number</th>
      <th>Start Date</th>
      <th>Payment Method</th>
      <th>Notes</th>
      <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="roomRental" items="${roomRentals}">
      <tr>
        <td>${roomRental.roomId}</td>
        <td>${roomRental.tenantName}</td>
        <td>${roomRental.phoneNumber}</td>
        <td>${roomRental.startDate}</td>
        <td>${roomRental.paymentMethodId}</td>
        <td>${roomRental.notes}</td>
        <td>
          <a href="roomRentals?action=edit&roomId=${roomRental.roomId}" class="btn btn-warning btn-sm">Edit</a>
          <a href="javascript:void(0);" onclick="confirmDelete(${roomRental.roomId})" class="btn btn-danger btn-sm">Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
  function confirmDelete(roomId) {
    if (confirm("Ban muốn xóa  phòng trọ  nay?")) {
      window.location.href = "roomRentals?action=delete&roomId=" + roomId;
    }
  }
</script>
</body>
</html>