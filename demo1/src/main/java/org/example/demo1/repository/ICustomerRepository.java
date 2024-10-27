package org.example.demo1.repository;

import org.example.demo1.model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();
}
