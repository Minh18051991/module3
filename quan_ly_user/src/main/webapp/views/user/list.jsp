<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% if (request.getAttribute("message") != null) { %>
<div>${message}</div>
<% } %>
<html>
<head>
    <title>User Management</title>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this user?");
        }

        function openModal() {
            document.getElementById('searchModal').style.display = 'block';
        }

        function closeModal() {
            document.getElementById('searchModal').style.display = 'none';
        }
    </script>
    <style>
        /* Modal Styles */
        #searchModal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }
        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px;
            width: 300px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>
<body>
<center>
    <h1>User Management System</h1>
    <h2>
        <a href='/users?action=create'>Create New User</a>
        <a href="#" onclick="openModal()">Search by Country</a>
        <a href="/users?action=sortByName">Sort by Name</a>
    </h2>
</center>

<!-- Modal -->
<div id="searchModal">
    <div class="modal-content">
        <h2>Search Users by Country</h2>
        <form id="searchForm" action="/users" method="post">
            <input type="hidden" name="action" value="search">
            <label for="search_country">Country:</label>
            <input type="text" id="search_country" name="search_country" required>
            <input type="submit" value="Search">
            <button type="button" onclick="closeModal()">Close</button>
        </form>
    </div>
</div>

<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>User List</h2></caption>
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Email</th>
            <th>Country</th>
            <th>Action</th>
        </tr>
        <c:forEach items="${listUsers}" var="user">
            <tr>
                <td>${user.id}</td>
                <td>${user.name}</td>
                <td>${user.email}</td>
                <td>${user.country}</td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a> |
                    <a href="/users?action=delete&id=${user.id}" onclick="return confirmDelete()">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>