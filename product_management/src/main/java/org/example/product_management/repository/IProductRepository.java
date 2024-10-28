package org.example.product_management.repository;

import org.example.product_management.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    void update(Product product);
    Product findById(int id);
    List<Product> findByName(String name);

}
