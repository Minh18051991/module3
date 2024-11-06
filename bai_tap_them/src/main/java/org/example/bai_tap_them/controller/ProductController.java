package org.example.bai_tap_them.controller;

import org.example.bai_tap_them.model.Product;
import org.example.bai_tap_them.model.ProductCategory;
import org.example.bai_tap_them.service.IProductCategoryService;
import org.example.bai_tap_them.service.IProductService;
import org.example.bai_tap_them.service.ProductCategoryService;
import org.example.bai_tap_them.service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/products")
public class ProductController extends HttpServlet {
    private final IProductService productService = new ProductService();
    private final IProductCategoryService productCategoryService = new ProductCategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "new":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "searchByTime":
                searchProductsByTime(request, response);
                break;
            case "searchByCategory":
                searchProductsByCategory(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "insert";
        }

        switch (action) {
            case "insert":
                insertProduct(request, response);
                break;
            case "update":
                updateProduct(request, response);
                break;
            default:
                response.sendRedirect("products");
                break;
        }
    }

    private void listProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> listProduct = productService.getAllProducts();
        List<ProductCategory> categories = productCategoryService.getAllProductCategories();
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("product-form.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product existingProduct = productService.getProductById(id);
        request.setAttribute("product", existingProduct);
        request.getRequestDispatcher("product-form.jsp").forward(request, response);
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String unitMeasure = request.getParameter("unitMeasure");
        double price = Double.parseDouble(request.getParameter("price"));
        ProductCategory category = new ProductCategory();
        category.setCategoryName(request.getParameter("categoryName"));
        Date harvestDay = Date.valueOf(request.getParameter("harvestDay"));

        Product newProduct = new Product(productId, productName, unitMeasure, price, category, harvestDay);
        productService.addProduct(newProduct);
        response.sendRedirect("products");
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String unitMeasure = request.getParameter("unitMeasure");
        double price = Double.parseDouble(request.getParameter("price"));
        ProductCategory category = new ProductCategory();
        category.setCategoryName(request.getParameter("categoryName"));
        Date harvestDay = Date.valueOf(request.getParameter("harvestDay"));

        Product updatedProduct = new Product(id, productId, productName, unitMeasure, price, category, harvestDay);
        productService.updateProduct(id, updatedProduct);
        response.sendRedirect("products");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productService.deleteProduct(id);
        response.sendRedirect("products");
    }

    private void searchProductsByTime(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Date startDate = Date.valueOf(request.getParameter("startDate"));
        Date endDate = Date.valueOf(request.getParameter("endDate"));
        List<Product> products = productService.searchProductsByTime(startDate, endDate);
        request.setAttribute("listProduct", products);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }

    private void searchProductsByCategory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        List<Product> products = productService.searchProductsByCategory(categoryName);
        request.setAttribute("listProduct", products);
        request.getRequestDispatcher("product-list.jsp").forward(request, response);
    }
}