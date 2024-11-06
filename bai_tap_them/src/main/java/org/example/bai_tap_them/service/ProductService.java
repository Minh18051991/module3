package org.example.bai_tap_them.service;

import org.example.bai_tap_them.model.Product;
import org.example.bai_tap_them.repository.IProductRepository;
import org.example.bai_tap_them.repository.ProductRepository;

import java.sql.Date;
import java.util.List;

public class ProductService implements IProductService {
    private final IProductRepository productRepository = new ProductRepository();



    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public void updateProduct(int id, Product updatedProduct) {
        productRepository.updateProduct(id, updatedProduct);
    }

    @Override
    public void deleteProduct(int id) {
        productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.getAllProducts();
    }

    @Override
    public Product getProductById(int id) {
        return productRepository.getProductById(id);
    }

    @Override
    public List<Product> searchProductsByTime(Date startDate, Date endDate) {
        return productRepository.searchProductsByTime(startDate, endDate);
    }

    @Override
    public List<Product> searchProductsByCategory(String categoryName) {
        return productRepository.searchProductsByCategory(categoryName);
    }
}