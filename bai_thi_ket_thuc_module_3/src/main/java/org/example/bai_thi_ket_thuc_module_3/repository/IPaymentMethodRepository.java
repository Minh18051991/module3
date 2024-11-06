package org.example.bai_thi_ket_thuc_module_3.repository;

import org.example.bai_thi_ket_thuc_module_3.model.PaymentMethod;

import java.util.List;

public interface IPaymentMethodRepository {
    PaymentMethod findById(int id);
    List<PaymentMethod> findAll();
    void save(PaymentMethod paymentMethod);
    void update(int id, PaymentMethod paymentMethod);
    void remove(int id);
}
