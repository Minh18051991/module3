package org.example.bai_tap_them.service;

import org.example.bai_tap_them.model.ProductCategory;

import java.util.List;

public interface IProductCategoryService {
    void addProductCategory(ProductCategory productCategory);
    void updateProductCategory(int id, ProductCategory updatedProductCategory);
    void deleteProductCategory(int id);
    List<ProductCategory> getAllProductCategories();
    ProductCategory getProductCategoryById(int id);
}