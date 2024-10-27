package org.example.calculator.model;

public class Calculator {
    public double calculate(double num1, double num2, String operator) throws Exception
    {
        switch (operator) {
            case "+":
                return num1 + num2;
            case "-":
                return num1 - num2;
            case "*":
                return num1 * num2;
            case "/":
                if (num2 == 0)
                    throw new Exception("Chia cho 0 không hợp lệ. Vui lòng nhập lại số thứ hai.");
                return num1 / num2;
            default:
                throw new Exception("Kết quả không hợp lệ");
        }
    }
}
