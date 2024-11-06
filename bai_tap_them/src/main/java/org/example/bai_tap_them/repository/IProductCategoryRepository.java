package org.example.bai_tap_them.repository;

import org.example.bai_tap_them.model.Product;
import org.example.bai_tap_them.model.ProductCategory;

import java.sql.Date;
import java.util.List;

public interface IProductCategoryRepository {
    void addProductCategory(ProductCategory productCategory);
    void updateProductCategory(int id, ProductCategory updatedProductCategory);
    void deleteProductCategory(int id);
    List<ProductCategory> getAllProductCategories();
    ProductCategory getProductCategoryById(int id);

}
