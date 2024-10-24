package org.example.chuyen_doi_tien_te;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "chuyenDoiTienTe", value = "/convert")
public class ChuyenDoiTienTe extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("convert.jsp").forward(request, response);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        try {
            double rate = Double.parseDouble(request.getParameter("rate"));
            double usd = Double.parseDouble(request.getParameter("usd"));
            double vnd = usd * rate;

            request.setAttribute("vnd", vnd);
            request.setAttribute("rate", rate);
            request.setAttribute("usd", usd);
            request.getRequestDispatcher("result.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            // Gửi thông báo lỗi về trang convert.jsp nếu có vấn đề với đầu vào
            request.setAttribute("errorMessage", "Vui lòng nhập số hợp lệ cho tỷ lệ và USD.");
            request.getRequestDispatcher("convert.jsp").forward(request, response);
        }
    }
}