package org.example.demo1.repository;

import org.example.demo1.model.Customer;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
private static List<Customer> customers = new ArrayList<>();

    static {
        customers.add(new Customer(1, "John Doe", new Date(1990, Calendar.FEBRUARY, 1), "123 Main St"));
        customers.add(new Customer(2, "Jane Smith", new Date(1985, 12, 31), "456 Elm St"));
        customers.add(new Customer(3, "Michael Johnson", new Date(1995, Calendar.AUGUST, 20), "789 Oak St"));
        customers.add(new Customer(4, "Sarah Brown", new Date(1992, Calendar.JUNE, 15), "678 Pine St"));
    }
    @Override
    public List<Customer> findAll() {
        return customers;
    }
}
