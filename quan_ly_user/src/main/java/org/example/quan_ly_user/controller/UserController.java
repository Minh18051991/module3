package org.example.quan_ly_user.controller;

import org.example.quan_ly_user.dto.UsersDTO;
import org.example.quan_ly_user.model.User;
import org.example.quan_ly_user.model.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserController", urlPatterns = "/users")
public class UserController extends HttpServlet {
    private UserDAO userDAO;

    public void init() {
        userDAO = new UserDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    insertUser(request, response);
                    break;
                case "edit":
                    updateUser(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;

            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteUser(request, response);
                    break;
                case "sortByName":
                    selectAllUsersSortedByName(request, response);
                    break;
                case "showWithPassword":
                    selectAllUsersWithPassword(request, response);
                    break;
                default:
                    listUsers(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<User> listUsers = userDAO.selectAllUsers();
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("views/user/list.jsp").forward(request, response);

    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/user/create.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        User existingUser = userDAO.selectUser(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/user/edit.jsp");
        request.setAttribute("user", existingUser);
        dispatcher.forward(request, response);

    }

    private void insertUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");

        System.out.println("Received: Name=" + name + ", Email=" + email + ", Country=" + country);

        List<Integer> permission = new ArrayList<>();
        if (request.getParameter("add") != null) {
            permission.add(1);
        }
        if (request.getParameter("edit") != null) {
            permission.add(2);
        }
        if (request.getParameter("delete") != null) {
            permission.add(3);
        }
        if (request.getParameter("view") != null) {
            permission.add(4);
        }

        User newUser = new User(name, email, country);
        try {
            userDAO.addUserTransaction(newUser, permission);
            request.setAttribute("message", "User added successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("message", "Error adding user.");
        }

        listUsers(request, response);
    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User updatedUser = new User(id, name, email, country);
        userDAO.updateUser(updatedUser);
        request.setAttribute("message", "User updated successfully");
        try {
            listUsers(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        }



    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        userDAO.deleteUser(id);
        List<User> listUsers = userDAO.selectAllUsers();
        request.setAttribute("listUsers", listUsers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/user/list.jsp");
        request.setAttribute("message", "User deleted successfully");
        dispatcher.forward(request, response);
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String country = request.getParameter("search_country");
        List<User> listUsers = userDAO.searchUser(country);
        request.setAttribute("listUsers", listUsers);
        request.setAttribute("message", "Search results for country: " + country);
        request.getRequestDispatcher("views/user/search.jsp").forward(request, response);
    }

    private void selectAllUsersSortedByName(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<User> listUsers = userDAO.selectAllUsersSortedByName();
        request.setAttribute("listUsers", listUsers);
        request.getRequestDispatcher("views/user/list.jsp").forward(request, response);

    }

    private void selectAllUsersWithPassword(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<UsersDTO> showWithPassword = userDAO.selectAllUsersWithPassword();
        request.setAttribute("showWithPassword", showWithPassword);
        request.getRequestDispatcher("views/user/list_password.jsp").forward(request, response);
    }
}

