package org.example.bai_tap_them.service;

import org.example.bai_tap_them.model.Product;

import java.util.List;

public interface IProductService {
    void addProduct(Product product);
    void updateProduct(int id, Product updatedProduct);
    void deleteProduct(int id);
    List<Product> getAllProducts();
    Product getProductById(int id);
    List<Product> searchProductsByTime(java.sql.Date startDate, java.sql.Date endDate);
    List<Product> searchProductsByCategory(String categoryName);
}

