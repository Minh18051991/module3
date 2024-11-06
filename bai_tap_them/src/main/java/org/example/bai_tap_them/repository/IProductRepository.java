package org.example.bai_tap_them.repository;

import org.example.bai_tap_them.model.Product;

import java.sql.Date;
import java.util.List;

public interface IProductRepository {
    void addProduct(Product product);

    void updateProduct(int id, Product updatedProduct);

    void deleteProduct(int id);

    List<Product> getAllProducts();

    Product getProductById(int id);

    List<Product> searchProductsByTime( Date startDate,  Date endDate);

    List<Product> searchProductsByCategory(String categoryName);
}