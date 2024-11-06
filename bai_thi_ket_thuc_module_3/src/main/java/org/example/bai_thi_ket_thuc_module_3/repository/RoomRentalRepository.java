package org.example.bai_thi_ket_thuc_module_3.repository;

import org.example.bai_thi_ket_thuc_module_3.model.RoomRental;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomRentalRepository extends BaseRepository implements IRoomRentalRepository {
    private final String INSERT_ROOM_RENTAL = "INSERT INTO room_rentals(tenant_name, phone_number, start_date, payment_method_id, notes) VALUES(?, ?, ?, ?, ?)";
    private final String SELECT_ROOM_RENTAL_BY_ID = "SELECT * FROM room_rentals WHERE room_id = ?";
    private final String SELECT_ALL_ROOM_RENTALS = "SELECT * FROM room_rentals";
    private final String UPDATE_ROOM_RENTAL = "UPDATE room_rentals SET tenant_name = ?, phone_number = ?, start_date = ?, payment_method_id = ?, notes = ? WHERE room_id = ?";
    private final String DELETE_ROOM_RENTAL = "DELETE FROM room_rentals WHERE room_id = ?";
    private final String SEARCH_ROOM_RENTALS = "SELECT * FROM room_rentals WHERE room_id LIKE ? OR tenant_name LIKE ? OR phone_number LIKE ?";

    @Override
    public void save(RoomRental roomRental) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ROOM_RENTAL)) {
            preparedStatement.setString(1, roomRental.getTenantName());
            preparedStatement.setString(2, roomRental.getPhoneNumber());
            preparedStatement.setDate(3, new java.sql.Date(roomRental.getStartDate().getTime()));
            preparedStatement.setInt(4, roomRental.getPaymentMethodId());
            preparedStatement.setString(5, roomRental.getNotes());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int roomId, RoomRental roomRental) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_ROOM_RENTAL)) {
            preparedStatement.setString(1, roomRental.getTenantName());
            preparedStatement.setString(2, roomRental.getPhoneNumber());
            preparedStatement.setDate(3, new java.sql.Date(roomRental.getStartDate().getTime()));
            preparedStatement.setInt(4, roomRental.getPaymentMethodId());
            preparedStatement.setString(5, roomRental.getNotes());
            preparedStatement.setInt(6, roomId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public RoomRental findById(int roomId) {
        RoomRental roomRental = null;
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ROOM_RENTAL_BY_ID)) {
            preparedStatement.setInt(1, roomId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String tenantName = resultSet.getString("tenant_name");
                    String phoneNumber = resultSet.getString("phone_number");
                    Date startDate = resultSet.getDate("start_date");
                    int paymentMethodId = resultSet.getInt("payment_method_id");
                    String notes = resultSet.getString("notes");
                    roomRental = new RoomRental(roomId, tenantName, phoneNumber, startDate, paymentMethodId, notes);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomRental;
    }

    @Override
    public List<RoomRental> findAll() {
        List<RoomRental> roomRentals = new ArrayList<>();
        try (Connection connection = getConnectDB();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(SELECT_ALL_ROOM_RENTALS)) {
            while (resultSet.next()) {
                int roomId = resultSet.getInt("room_id");
                String tenantName = resultSet.getString("tenant_name");
                String phoneNumber = resultSet.getString("phone_number");
                Date startDate = resultSet.getDate("start_date");
                int paymentMethodId = resultSet.getInt("payment_method_id");
                String notes = resultSet.getString("notes");
                roomRentals.add(new RoomRental(roomId, tenantName, phoneNumber, startDate, paymentMethodId, notes));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomRentals;
    }

    @Override
    public void remove(int roomId) {
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_ROOM_RENTAL)) {
            preparedStatement.setInt(1, roomId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<RoomRental> search(String keyword) {
        List<RoomRental> roomRentals = new ArrayList<>();
        try (Connection connection = getConnectDB();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ROOM_RENTALS)) {
            String searchKeyword = "%" + keyword + "%";
            preparedStatement.setString(1, searchKeyword);
            preparedStatement.setString(2, searchKeyword);
            preparedStatement.setString(3, searchKeyword);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                while (resultSet.next()) {
                    int roomId = resultSet.getInt("room_id");
                    String tenantName = resultSet.getString("tenant_name");
                    String phoneNumber = resultSet.getString("phone_number");
                    Date startDate = resultSet.getDate("start_date");
                    int paymentMethodId = resultSet.getInt("payment_method_id");
                    String notes = resultSet.getString("notes");
                    roomRentals.add(new RoomRental(roomId, tenantName, phoneNumber, startDate, paymentMethodId, notes));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomRentals;
    }
}