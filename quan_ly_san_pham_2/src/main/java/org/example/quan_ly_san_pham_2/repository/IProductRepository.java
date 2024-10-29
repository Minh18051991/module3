package org.example.quan_ly_san_pham_2.repository;

import org.example.quan_ly_san_pham_2.model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    void update(Product product);
    Product findById(int id);
    List<Product> findByName(String name);

}
