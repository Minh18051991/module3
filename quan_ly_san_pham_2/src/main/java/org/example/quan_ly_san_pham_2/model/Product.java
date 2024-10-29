package org.example.quan_ly_san_pham_2.model;

public class Product {
    private int id;
    private String name;
    private String manufacturer;
    private double price;
    private String description;
    private int quantity;

    // Constructor với tất cả các thuộc tính
    public Product(int id, String name, String manufacturer, double price, String description, int quantity) {
        this.id = id;
        this.name = name;
        this.manufacturer = manufacturer;
        this.price = price;
        this.description = description;
        this.quantity = quantity;
    }

    // Constructor mặc định
    public Product() {}

    // Getter và Setter cho các thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        if (price >= 0) { // Kiểm tra giá không âm
            this.price = price;
        } else {
            throw new IllegalArgumentException("Price cannot be negative.");
        }
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        if (quantity >= 0) { // Kiểm tra số lượng không âm
            this.quantity = quantity;
        } else {
            throw new IllegalArgumentException("Quantity cannot be negative.");
        }
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", manufacturer='" + manufacturer + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", quantity=" + quantity +
                '}';
    }
}