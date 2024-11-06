package org.example.bai_tap_them.model;

import java.sql.Date;

public class Product {
    private int id;
    private String productId;
    private String productName;
    private String unitMeasure;
    private double price;
    private ProductCategory productCategory;
    private Date harvestDay;

    public Product(int id, String productId, String productName, String unitMeasure, double price, ProductCategory productCategory, Date harvestDay) {
        this.id = id;
        this.productId = productId;
        this.productName = productName;
        this.unitMeasure = unitMeasure;
        this.price = price;
        this.productCategory = productCategory;
        this.harvestDay = harvestDay;
    }
    public Product() {
    }

    public Product(String productId, String productName, String unitMeasure, double price, ProductCategory category, Date harvestDay) {
        this.productId = productId;
        this.productName = productName;
        this.unitMeasure = unitMeasure;
        this.price = price;
        this.productCategory = category;
        this.harvestDay = harvestDay;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getUnitMeasure() {
        return unitMeasure;
    }

    public void setUnitMeasure(String unitMeasure) {
        this.unitMeasure = unitMeasure;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }

    public Date getHarvestDay() {
        return harvestDay;
    }

    public void setHarvestDay(Date harvestDay) {
        this.harvestDay = harvestDay;
    }

    // Getters and setters
}