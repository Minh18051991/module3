package org.example.product_management.service;

import org.example.product_management.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProducts();
    void addProduct(Product product) throws IllegalArgumentException;
    void updateProduct(Product product) throws IllegalArgumentException;
    void deleteProduct(int productId) throws IllegalArgumentException;
    Product getProductById(int productId) throws IllegalArgumentException;
    List<Product> searchProductsByName(String name);
}