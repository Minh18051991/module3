package org.example.quan_ly_user.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    private String url = "jdbc:mysql://localhost:3306/demo_user";
    private String user = "root";
    private String password = "codegym";
    private static final String INSERT_USER_SQL = "INSERT INTO users (name, email, country) VALUES (?,?,?)";
    private static final String SELECT_ALL_USERS_SQL = "SELECT * FROM users";
    private static final String SELECT_USER_BY_ID_SQL = "SELECT * FROM users WHERE id =?";
    private static final String UPDATE_USER_SQL = "UPDATE users SET name=?, email=?, country=? WHERE id=?";
    private static final String DELETE_USER_SQL = "DELETE FROM users WHERE id=?";
    private static final String SELECT_USER_BY_COUNTRY_SQL = "SELECT * FROM users WHERE country =?";

    public UserDAO() {
    }

    public void insertUser(User user) throws SQLException {
        System.out.println(INSERT_USER_SQL);
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            System.out.println(preparedStatement);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID_SQL)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                user = new User(id, name, email, country);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try {
            Connection connection = BaseRepository.getConnectDB();

            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS_SQL);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted = false;
        try {
            Connection connection = BaseRepository.getConnectDB();

            PreparedStatement preparedStatement = connection.prepareStatement(DELETE_USER_SQL);
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = BaseRepository.getConnectDB();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_SQL)){
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.setInt(4, user.getId());
            rowUpdated = preparedStatement.executeUpdate() > 0;
        } catch(SQLException e){
            printSQLException(e);
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                System.err.println("Vendor Error Code: " + ((SQLException) e).getErrorCode());
                Throwable t = e.getCause();
                while (t != null) {
                    System.err.println("Cause: " + t.getMessage());
                    t = t.getCause();
                }
            }
        }
    }
    public List<User> searchUser(String country) {
        List<User> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_COUNTRY_SQL)) {
            preparedStatement.setString(1, country);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                User user = new User(id, name, email, country);
                users.add(user); // Add to the list
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }
    public List<User> selectAllUsersSortedByName() throws SQLException {
        List<User> users = new ArrayList<>();
        String SQL_SELECT_ALL_USERS_SORTED = "SELECT * FROM users ORDER BY name"; // Sắp xếp theo tên

        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SQL_SELECT_ALL_USERS_SORTED);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String country = rs.getString("country");
                User user = new User(id, name, email, country);
                users.add(user);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }
}
