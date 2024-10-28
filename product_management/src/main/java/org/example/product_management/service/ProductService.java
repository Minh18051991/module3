package org.example.product_management.service;

import org.example.product_management.model.Product;
import org.example.product_management.repository.IProductRepository;
import org.example.product_management.repository.ProductRepository;


import java.util.List;

public class ProductService implements IProductService {
    private final IProductRepository productRepository;

    public ProductService() {
        this.productRepository = new ProductRepository();
    }

    @Override
    public List<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @Override
    public void addProduct(Product product) throws IllegalArgumentException {

        validateProduct(product);
        productRepository.save(product);
    }

    @Override
    public void updateProduct(Product product) throws IllegalArgumentException {

        if (productRepository.findById(product.getId()) == null) {
            throw new IllegalArgumentException("Product not found for ID: " + product.getId());
        }
        validateProduct(product);
        productRepository.update(product);
    }

    @Override
    public void deleteProduct(int productId) throws IllegalArgumentException {
        if (productRepository.findById(productId) == null) {
            throw new IllegalArgumentException("Product not found for ID: " + productId);
        }
        productRepository.delete(productId);
    }

    @Override
    public Product getProductById(int productId) throws IllegalArgumentException {
        Product product = productRepository.findById(productId);
        if (product == null) {
            throw new IllegalArgumentException("Product not found for ID: " + productId);
        }
        return product;
    }

    @Override
    public List<Product> searchProductsByName(String name) {
        return productRepository.findByName(name);
    }

    private void validateProduct(Product product) {
        if (product.getName() == null || product.getName().isEmpty()) {
            throw new IllegalArgumentException("Product name cannot be null or empty.");
        }
        if (product.getManufacturer() == null || product.getManufacturer().isEmpty()) {
            throw new IllegalArgumentException("Manufacturer cannot be null or empty.");
        }
        if (product.getPrice() < 0) {
            throw new IllegalArgumentException("Price cannot be negative.");
        }
        if (product.getQuantity() < 0) {
            throw new IllegalArgumentException("Quantity cannot be negative.");
        }
    }
}