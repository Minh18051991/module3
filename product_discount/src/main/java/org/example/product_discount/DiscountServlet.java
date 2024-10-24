package org.example.product_discount;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/discount")
public class DiscountServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nhận dữ liệu từ form
        String description = request.getParameter("description");
        double listPrice = Double.parseDouble(request.getParameter("listPrice"));
        double discountPercent = Double.parseDouble(request.getParameter("discountPercent"));

        // Tính toán chiết khấu
        double discountAmount = listPrice * discountPercent * 0.01;
        double discountPrice = listPrice - discountAmount;

        // Thiết lập kiểu trả về
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Hiển thị kết quả
        out.println("<html>");
        out.println("<head><title>Discount Result</title></head>");
        out.println("<body>");
        out.println("<h1>Discount Calculation Result</h1>");
        out.println("<p>Product Description: " + description + "</p>");
        out.println("<p>List Price: $" + String.format("%.2f", listPrice) + "</p>");
        out.println("<p>Discount Percent: " + discountPercent + "%</p>");
        out.println("<p>Discount Amount: $" + String.format("%.2f", discountAmount) + "</p>");
        out.println("<p>Discount Price: $" + String.format("%.2f", discountPrice) + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}