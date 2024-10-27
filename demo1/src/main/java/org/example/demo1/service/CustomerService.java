package org.example.demo1.service;

import org.example.demo1.model.Customer;
import org.example.demo1.repository.CustomerRepository;
import org.example.demo1.repository.ICustomerRepository;

import java.util.List;

public class CustomerService implements ICustomerService  {
    private ICustomerRepository customerRepository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return customerRepository.findAll();
    }

}
