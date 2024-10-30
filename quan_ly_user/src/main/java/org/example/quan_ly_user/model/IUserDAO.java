package org.example.quan_ly_user.model;

import org.example.quan_ly_user.dto.UsersDTO;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    void insertUser(User user) throws SQLException; // Thêm người dùng
    User selectUser(int id) throws SQLException; // Lấy người dùng theo ID
    List<User> selectAllUsers() throws SQLException; // Lấy tất cả người dùng
    boolean updateUser(User user) throws SQLException; // Cập nhật người dùng
    boolean deleteUser(int id) throws SQLException; // Xóa người dùng
    List<User> searchUser(String country) throws SQLException; // Tìm kiếm người dùng theo quốc gia
    List<User> selectAllUsersSortedByName() throws SQLException; // Lấy tất cả người dùng sắp xếp theo tên
    List<UsersDTO> selectAllUsersWithPassword() throws SQLException;
    void addUserTransaction(User user, List<Integer> permission) throws SQLException;

}