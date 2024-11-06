<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2>Product List</h2>
    <form class="row g-3 mb-3" action="products" method="get">
        <input type="hidden" name="action" value="searchByCategory">
        <div class="col-auto">
            <label for="searchCategoryName" class="form-label">Search by Category</label>
            <select class="form-select" id="searchCategoryName" name="categoryName" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryName}">${category.categoryName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="col-auto align-self-end">
            <button type="submit" class="btn btn-primary mb-3">Search</button>
        </div>
    </form>
    <button type="button" class="btn btn-success mb-3" data-bs-toggle="modal" data-bs-target="#addProductModal">Add New Product</button>
    <form action="products?action=update" method="post" class="needs-validation" novalidate onsubmit="return validateForm(this);">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Product ID</th>
                <th>Name</th>
                <th>Unit Measure</th>
                <th>Price</th>
                <th>Category</th>
                <th>Harvest Day</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${listProduct}">
                <tr>
                    <td>${product.id}</td>
                    <td><input type="text" class="form-control" name="productId_${product.id}" value="${product.productId}" required></td>
                    <td><input type="text" class="form-control" name="productName_${product.id}" value="${product.productName}" required></td>
                    <td><input type="text" class="form-control" name="unitMeasure_${product.id}" value="${product.unitMeasure}" required></td>
                    <td><input type="number" class="form-control" name="price_${product.id}" value="${product.price}" required></td>
                    <td>
                        <select class="form-select" name="categoryName_${product.id}" required>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.categoryName}" ${category.categoryName == product.productCategory.categoryName ? 'selected' : ''}>${category.categoryName}</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td><input type="date" class="form-control" name="harvestDay_${product.id}" value="${product.harvestDay}" required></td>
                    <td>
                        <input type="hidden" name="id" value="${product.id}">
                        <button type="submit" class="btn btn-primary btn-sm">Edit</button>
                        <a href="products?action=delete&id=${product.id}" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this product?');">Delete</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </form>
</div>

<!-- Add Product Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="products?action=insert" method="post" class="needs-validation" novalidate onsubmit="return validateForm(this);">
                    <div class="mb-3">
                        <label for="productId" class="form-label">Product ID</label>
                        <input type="text" class="form-control" id="productId" name="productId" required>
                        <div class="invalid-feedback">
                            Please enter a valid product ID (e.g., PRD-XXX).
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="productName" class="form-label">Name</label>
                        <input type="text" class="form-control" id="productName" name="productName" required>
                        <div class="invalid-feedback">
                            Please enter a product name.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="unitMeasure" class="form-label">Unit Measure</label>
                        <input type="text" class="form-control" id="unitMeasure" name="unitMeasure" required>
                        <div class="invalid-feedback">
                            Please enter a unit measure.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="price" class="form-label">Price</label>
                        <input type="number" class="form-control" id="price" name="price" required>
                        <div class="invalid-feedback">
                            Please enter a price greater than 1000.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="modalCategoryName" class="form-label">Category</label>
                        <input type="text" class="form-control" id="modalCategoryName" name="categoryName" required>
                        <div class="invalid-feedback">
                            Please enter a category name.
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="harvestDay" class="form-label">Harvest Day</label>
                        <input type="date" class="form-control" id="harvestDay" name="harvestDay" required>
                        <div class="invalid-feedback">
                            Please enter a harvest day.
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    function validateForm(form) {
        let isValid = true;
        const productIdPattern = /^PRD-[A-Z0-9]{3}$/;
        const productId = form.querySelector('[name="productId"]').value;
        const price = form.querySelector('[name="price"]').value;

        if (!productIdPattern.test(productId)) {
            alert('Product ID must be in the format PRD-XXX where X is a digit or uppercase letter.');
            isValid = false;
        }

        if (price <= 1000) {
            alert('Price must be greater than 1000.');
            isValid = false;
        }

        return isValid;
    }
</script>
</body>
</html>