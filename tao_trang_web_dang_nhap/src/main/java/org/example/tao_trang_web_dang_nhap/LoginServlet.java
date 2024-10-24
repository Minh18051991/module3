package org.example.tao_trang_web_dang_nhap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet (name = "LoginServlet"  , urlPatterns = "/login"  )
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login1.jsp").forward(request, response)  ;
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        if ("admin@gmail.com".equals(email) &&  "admin".equals(password)) {
            writer.println("<h1> Welcome " + email + " to Website!</h1> ");
        }else {
            writer.println("<h1>Invalid email or password!</h1>");
        }
        writer.println("</html>");
    }
}
