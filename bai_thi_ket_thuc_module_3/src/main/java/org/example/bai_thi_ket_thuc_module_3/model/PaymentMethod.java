package org.example.bai_thi_ket_thuc_module_3.model;

public class PaymentMethod {
    private int id;
    private String methodName;

    public PaymentMethod() {}

    public PaymentMethod(int id, String methodName) {
        this.id = id;
        this.methodName = methodName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMethodName() {
        return methodName;
    }

    public void setMethodName(String methodName) {
        this.methodName = methodName;
    }
}