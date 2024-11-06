package org.example.bai_tap_them.controller;

import org.example.bai_tap_them.model.ProductCategory;
import org.example.bai_tap_them.service.IProductCategoryService;
import org.example.bai_tap_them.service.ProductCategoryService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/categories")
public class ProductCategoryController extends HttpServlet {
private final IProductCategoryService productCategoryService = new ProductCategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ProductCategory> categories = productCategoryService.getAllProductCategories();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("category-list.jsp").forward(request, response);
    }
}