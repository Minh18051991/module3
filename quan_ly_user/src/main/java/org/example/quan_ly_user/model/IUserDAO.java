package org.example.quan_ly_user.model;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {
    public void insertUser(User user) throws SQLException;
    public User selectUser(int id);
    public List<User> selectAllUsers() throws SQLException;
    public boolean updateUser(User user) throws SQLException;
    public boolean deleteUser(int id) throws SQLException;
    public List<User> searchUser(String country) throws SQLException;
    public List<User> selectAllUsersSortedByName() throws SQLException;
}
