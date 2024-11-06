package org.example.bai_tap_them.repository;

import org.example.bai_tap_them.model.ProductCategory;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductCategoryRepository extends BaseRepository implements IProductCategoryRepository {
    private static final String INSERT_PRODUCT_CATEGORY = "INSERT INTO product_category (category_name) VALUES (?)";
    private static final String SELECT_ALL_PRODUCT_CATEGORY = "SELECT * FROM product_category";
    private static final String SELECT_PRODUCT_CATEGORY_BY_ID = "SELECT * FROM product_category WHERE id = ?";
    private static final String UPDATE_PRODUCT_CATEGORY = "UPDATE product_category SET category_name = ? WHERE id = ?";
    private static final String DELETE_PRODUCT_CATEGORY = "DELETE FROM product_category WHERE id = ?";

    public void addProductCategory(String categoryName) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(INSERT_PRODUCT_CATEGORY)) {
            statement.setString(1, categoryName);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<ProductCategory> getAllProductCategories() {
        List<ProductCategory> categories = new ArrayList<>();
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_PRODUCT_CATEGORY);
             ResultSet resultSet = statement.executeQuery()) {
            while (resultSet.next()) {
                ProductCategory category = new ProductCategory();
                category.setId(resultSet.getInt("id"));
                category.setCategoryName(resultSet.getString("category_name"));
                categories.add(category);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public ProductCategory getProductCategoryById(int id) {
        ProductCategory category = null;
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(SELECT_PRODUCT_CATEGORY_BY_ID)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    category = new ProductCategory();
                    category.setId(resultSet.getInt("id"));
                    category.setCategoryName(resultSet.getString("category_name"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return category;
    }

    public void updateProductCategory(int id, String categoryName) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(UPDATE_PRODUCT_CATEGORY)) {
            statement.setString(1, categoryName);
            statement.setInt(2, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void addProductCategory(ProductCategory productCategory) {

    }

    @Override
    public void updateProductCategory(int id, ProductCategory updatedProductCategory) {

    }

    public void deleteProductCategory(int id) {
        try (Connection connection = getConnectDB();
             PreparedStatement statement = connection.prepareStatement(DELETE_PRODUCT_CATEGORY)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}