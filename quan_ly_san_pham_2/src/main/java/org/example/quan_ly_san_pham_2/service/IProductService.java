package org.example.quan_ly_san_pham_2.service;

import org.example.quan_ly_san_pham_2.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAllProducts();
    void addProduct(Product product) throws IllegalArgumentException;
    void updateProduct(Product product) throws IllegalArgumentException;
    void deleteProduct(int productId) throws IllegalArgumentException;
    Product getProductById(int productId) throws IllegalArgumentException;
    List<Product> searchProductsByName(String name);
}