package org.example.quan_ly_user.model;

import org.example.quan_ly_user.dto.UsersDTO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {

    private static final String INSERT_USER_SQL = "{CALL AddUser(?, ?, ?, ?)}"; // Thêm OUT parameter
    private static final String SELECT_ALL_USERS_SQL = "SELECT * FROM users";
    private static final String SELECT_USER_BY_ID_SQL = "{CALL GetUserById(?)}";
    private static final String UPDATE_USER_SQL = "{CALL UpdateUser(?, ?, ?, ?)}";
    private static final String DELETE_USER_SQL = "{CALL DeleteUser(?)}";
    private static final String SELECT_USER_BY_COUNTRY_SQL = "SELECT * FROM users WHERE country = ?";
    private static final String SELECT_ALL_WITH_PASSWORD_SQL = "SELECT u.name, u.email, a.password FROM users u JOIN account a ON u.id = a.user_id;";

    public UserDAO() {
    }

    public void insertUser(User user) throws SQLException {
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(INSERT_USER_SQL)) {


            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.registerOutParameter(4, java.sql.Types.INTEGER); // Thêm dòng này nếu có OUT parameter


            callableStatement.executeUpdate();

            // Lấy userId từ OUT parameter
            int userId = callableStatement.getInt(4);
            System.out.println("User ID of newly added user: " + userId); // Có thể in ra userId nếu cần
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public User selectUser(int id) {
        User user = null;
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(SELECT_USER_BY_ID_SQL)) {
            callableStatement.setInt(1, id);
            ResultSet rs = callableStatement.executeQuery();

            if (rs.next()) {
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
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS_SQL);
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

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted = false;
        // Xóa quyền liên quan trước
        String deletePermissionsSQL = "DELETE FROM user_permission WHERE user_id = ?";
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(deletePermissionsSQL)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        }

        // Sau đó xóa người dùng
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(DELETE_USER_SQL)) {
            callableStatement.setInt(1, id);
            rowDeleted = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated = false;
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_USER_SQL)) {
            callableStatement.setInt(1, user.getId());
            callableStatement.setString(2, user.getName());
            callableStatement.setString(3, user.getEmail());
            callableStatement.setString(4, user.getCountry());
            rowUpdated = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
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
                users.add(user);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public List<UsersDTO> selectAllUsersWithPassword() throws SQLException {
        List<UsersDTO> users = new ArrayList<>();
        try (Connection connection = BaseRepository.getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_WITH_PASSWORD_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String password = rs.getString("password");
                UsersDTO user = new UsersDTO(name, email, password);
                users.add(user);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    @Override
    public void addUserTransaction(User user, List<Integer> permission) throws SQLException {
        Connection connection = null;
        CallableStatement callableStatement = null;
        PreparedStatement permissionAssignStatement = null;
        ResultSet rs = null;

        try {
            connection = BaseRepository.getConnectDB();
            connection.setAutoCommit(false);

            // Gọi stored procedure và đăng ký OUT parameter
            callableStatement = connection.prepareCall("{CALL AddUser(?, ?, ?, ?)}");
            callableStatement.setString(1, user.getName());
            callableStatement.setString(2, user.getEmail());
            callableStatement.setString(3, user.getCountry());
            callableStatement.registerOutParameter(4, java.sql.Types.INTEGER); // Đăng ký OUT parameter

            callableStatement.executeUpdate();

            // Lấy userId từ OUT parameter
            int userId = callableStatement.getInt(4);

            // Gán quyền
            if (permission != null && !permission.isEmpty()) {
                String sqlPivot = "INSERT INTO user_permission (user_id, permission_id) VALUES (?, ?)";
                permissionAssignStatement = connection.prepareStatement(sqlPivot);
                for (Integer permissionId : permission) {
                    permissionAssignStatement.setInt(1, userId);
                    permissionAssignStatement.setInt(2, permissionId);
                    permissionAssignStatement.executeUpdate();
                }
            }

            connection.commit(); // Cam kết transaction
        } catch (SQLException e) {
            if (connection != null) connection.rollback(); // Hoàn tác nếu có lỗi
            printSQLException(e);
        } finally {
            // Đóng kết nối và các tài nguyên
            try {
                if (rs != null) rs.close();
                if (callableStatement != null) callableStatement.close();
                if (permissionAssignStatement != null) permissionAssignStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                printSQLException(ex);
            }
        }
    }
    public List<User> selectAllUsersSortedByName() throws SQLException {
        List<User> users = new ArrayList<>();
        String SQL_SELECT_ALL_USERS_SORTED = "{CALL GetAllUsersSortedByName()}"; // Gọi stored procedure

        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(SQL_SELECT_ALL_USERS_SORTED);
             ResultSet rs = callableStatement.executeQuery()) {

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