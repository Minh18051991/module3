package org.example.bai_tap_them.model;

public class ProductCategory {
    private int id;
    private String categoryName;
    public ProductCategory(int id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }
    public ProductCategory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }
}
