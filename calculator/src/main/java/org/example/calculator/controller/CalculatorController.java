package org.example.calculator.controller;

import org.example.calculator.model.Calculator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CalculatorController", urlPatterns = "/calculator")
public class CalculatorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String num1Str = request.getParameter("num1");
        String num2Str = request.getParameter("num2");
        String operator = request.getParameter("operator");

        double result = 0;
        boolean hasError = false;

        try {
            double num1 = Double.parseDouble(num1Str);
            double num2 = Double.parseDouble(num2Str);
            Calculator calculator = new Calculator();

            result = calculator.calculate(num1, num2, operator);
        } catch (NumberFormatException e) {
            hasError = true;
            request.setAttribute("error", "Vui lòng nhập số hợp lệ.");
        } catch (Exception e) {
            hasError = true;
            request.setAttribute("error", e.getMessage());
        }


        if (!hasError) {
            request.setAttribute("result", result);
        } else {
            request.setAttribute("result", null);
        }

        request.getRequestDispatcher("/WEB-INF/view/result.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/view/index.jsp").forward(request, response);
    }
}