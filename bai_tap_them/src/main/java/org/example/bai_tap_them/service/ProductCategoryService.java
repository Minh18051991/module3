
package org.example.bai_tap_them.service;

import org.example.bai_tap_them.model.ProductCategory;
import org.example.bai_tap_them.repository.IProductCategoryRepository;
import org.example.bai_tap_them.repository.ProductCategoryRepository;

import java.util.List;

public class ProductCategoryService implements IProductCategoryService {
    private final IProductCategoryRepository productCategoryRepository = new ProductCategoryRepository();


    @Override
    public void addProductCategory(ProductCategory productCategory) {
        productCategoryRepository.addProductCategory(productCategory);
    }

    @Override
    public void updateProductCategory(int id, ProductCategory updatedProductCategory) {
        productCategoryRepository.updateProductCategory(id, updatedProductCategory);
    }

    @Override
    public void deleteProductCategory(int id) {
        productCategoryRepository.deleteProductCategory(id);
    }

    @Override
    public List<ProductCategory> getAllProductCategories() {
        return productCategoryRepository.getAllProductCategories();
    }

    @Override
    public ProductCategory getProductCategoryById(int id) {
        return productCategoryRepository.getProductCategoryById(id);
    }
}