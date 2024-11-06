package org.example.bai_thi_ket_thuc_module_3.repository;

import org.example.bai_thi_ket_thuc_module_3.model.PaymentMethod;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodRepository extends BaseRepository implements IPaymentMethodRepository {
    private final String INSERT_PAYMENT_METHOD = "INSERT INTO payment_methods(method_name) VALUES(?)";
    private final String SELECT_PAYMENT_METHOD_BY_ID = "SELECT * FROM payment_methods WHERE id = ?";
    private final String SELECT_ALL_PAYMENT_METHODS = "SELECT * FROM payment_methods";
    private final String UPDATE_PAYMENT_METHOD = "UPDATE payment_methods SET method_name = ? WHERE id = ?";
    private final String DELETE_PAYMENT_METHOD = "DELETE FROM payment_methods WHERE id = ?";

    @Override
    public void save(PaymentMethod paymentMethod) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PAYMENT_METHOD)) {
            preparedStatement.setString(1, paymentMethod.getMethodName());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, PaymentMethod paymentMethod) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PAYMENT_METHOD)) {
            preparedStatement.setString(1, paymentMethod.getMethodName());
            preparedStatement.setInt(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public PaymentMethod findById(int id) {
        PaymentMethod paymentMethod = null;
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PAYMENT_METHOD_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String methodName = resultSet.getString("method_name");
                    paymentMethod = new PaymentMethod(id, methodName);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentMethod;
    }

    @Override
    public List<PaymentMethod> findAll() {
        List<PaymentMethod> paymentMethods = new ArrayList<>();
        try (Connection connection = getConnectDB();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_PAYMENT_METHODS)) {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String methodName = resultSet.getString("method_name");
                paymentMethods.add(new PaymentMethod(id, methodName));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentMethods;
    }

    @Override
    public void remove(int id) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PAYMENT_METHOD)) {
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}