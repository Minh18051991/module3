package org.example.bai_tap_them.repository;

import org.example.bai_tap_them.model.Product;
import org.example.bai_tap_them.model.ProductCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Date;

public class ProductRepository extends BaseRepository implements IProductRepository {
    private static final String INSERT_PRODUCT_SQL = "INSERT INTO product (id, product_id, product_name, unit_measure, price, harvest_day) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String UPDATE_PRODUCT_SQL = "UPDATE product SET product_id = ?, product_name = ?, unit_measure = ?, price = ?, harvest_day = ? WHERE id = ?";
    private static final String DELETE_PRODUCT_SQL = "DELETE FROM product WHERE id = ?";
    private static final String SELECT_ALL_PRODUCTS_SQL = "SELECT p.*, pc.category_name FROM product p JOIN product_category pc ON p.product_category_id = pc.id";
    private static final String SELECT_PRODUCT_BY_ID_SQL = "SELECT p.*, pc.category_name FROM product p JOIN product_category pc ON p.product_category_id = pc.id WHERE p.id = ?";
    private static final String SEARCH_PRODUCTS_BY_TIME_SQL = "SELECT p.*, pc.category_name FROM product p JOIN product_category pc ON p.product_category_id = pc.id WHERE p.harvest_day BETWEEN ? AND ?";
    private static final String SEARCH_PRODUCTS_BY_CATEGORY_SQL = "SELECT p.*, pc.category_name FROM product p JOIN product_category pc ON p.product_category_id = pc.id WHERE pc.category_name = ?";

    @Override
    public void addProduct(Product product) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            statement.setInt(1, product.getId());
            statement.setString(2, product.getProductId());
            statement.setString(3, product.getProductName());
            statement.setString(4, product.getUnitMeasure());
            statement.setDouble(5, product.getPrice());
            statement.setDate(6, product.getHarvestDay());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateProduct(int id, Product updatedProduct) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_SQL)) {
            statement.setString(1, updatedProduct.getProductId());
            statement.setString(2, updatedProduct.getProductName());
            statement.setString(3, updatedProduct.getUnitMeasure());
            statement.setDouble(4, updatedProduct.getPrice());
            statement.setDate(5, updatedProduct.getHarvestDay());
            statement.setInt(6, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteProduct(int id) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_SQL)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PRODUCTS_SQL);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                Product product = new Product();
                product.setId(resultSet.getInt("id"));
                product.setProductId(resultSet.getString("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setUnitMeasure(resultSet.getString("unit_measure"));
                product.setPrice(resultSet.getDouble("price"));
                ProductCategory category = new ProductCategory();
                category.setCategoryName(resultSet.getString("category_name"));
                product.setProductCategory(category);
                product.setHarvestDay(resultSet.getDate("harvest_day"));
                products.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public Product getProductById(int id) {
        Product product = null;
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_BY_ID_SQL)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setProductId(resultSet.getString("product_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setUnitMeasure(resultSet.getString("unit_measure"));
                    product.setPrice(resultSet.getDouble("price"));
                    ProductCategory category = new ProductCategory();
                    category.setCategoryName(resultSet.getString("category_name"));
                    product.setProductCategory(category);
                    product.setHarvestDay(resultSet.getDate("harvest_day"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public List<Product> searchProductsByTime( Date startDate,  Date endDate) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SEARCH_PRODUCTS_BY_TIME_SQL)) {
            statement.setDate(1, startDate);
            statement.setDate(2, endDate);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setProductId(resultSet.getString("product_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setUnitMeasure(resultSet.getString("unit_measure"));
                    product.setPrice(resultSet.getDouble("price"));
                    ProductCategory category = new ProductCategory();
                    category.setCategoryName(resultSet.getString("category_name"));
                    product.setProductCategory(category);
                    product.setHarvestDay(resultSet.getDate("harvest_day"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    @Override
    public List<Product> searchProductsByCategory(String categoryName) {
        List<Product> products = new ArrayList<>();
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SEARCH_PRODUCTS_BY_CATEGORY_SQL)) {
            statement.setString(1, categoryName);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    Product product = new Product();
                    product.setId(resultSet.getInt("id"));
                    product.setProductId(resultSet.getString("product_id"));
                    product.setProductName(resultSet.getString("product_name"));
                    product.setUnitMeasure(resultSet.getString("unit_measure"));
                    product.setPrice(resultSet.getDouble("price"));
                    ProductCategory category = new ProductCategory();
                    category.setCategoryName(resultSet.getString("category_name"));
                    product.setProductCategory(category);
                    product.setHarvestDay(resultSet.getDate("harvest_day"));
                    products.add(product);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}