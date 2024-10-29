package org.example.quan_ly_san_pham_2.repository;

import org.example.quan_ly_san_pham_2.model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class ProductRepository implements IProductRepository {
    private final List<Product> products = new ArrayList<>();
    private int currentId = 1;

    public ProductRepository() {

        products.add(new Product(currentId++, "Product A", "Manufacturer A", 100.0, "Description A", 10));
        products.add(new Product(currentId++, "Product B", "Manufacturer B", 150.0, "Description B", 5));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products); // Trả về một bản sao của danh sách
    }

    @Override
    public void save(Product product) {
        product.setId(currentId++); // Gán ID cho sản phẩm
        products.add(product);
    }

    @Override
    public void update(Product product) {
        Optional<Product> existingProductOpt = products.stream()
                .filter(p -> p.getId() == product.getId())
                .findFirst();

        if (existingProductOpt.isPresent()) {
            Product existingProduct = existingProductOpt.get();
            existingProduct.setName(product.getName());
            existingProduct.setManufacturer(product.getManufacturer());
            existingProduct.setPrice(product.getPrice());
            existingProduct.setDescription(product.getDescription());
            existingProduct.setQuantity(product.getQuantity());
        } else {
            throw new IllegalArgumentException("Product not found for ID: " + product.getId());
        }
    }

    @Override
    public void delete(int productId) {
        products.removeIf(product -> product.getId() == productId);
    }

    @Override
    public Product findById(int productId) {
        return products.stream()
                .filter(product -> product.getId() == productId)
                .findFirst()
                .orElse(null); // Trả về null nếu không tìm thấy
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> result = new ArrayList<>();
        for (Product product : products) {
            if (product.getName().toLowerCase().contains(name.toLowerCase())) {
                result.add(product);
            }
        }
        return result;
    }
}