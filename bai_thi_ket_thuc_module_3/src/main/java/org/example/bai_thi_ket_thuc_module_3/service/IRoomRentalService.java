package org.example.bai_thi_ket_thuc_module_3.service;

import org.example.bai_thi_ket_thuc_module_3.model.RoomRental;

import java.util.List;

public interface IRoomRentalService {
    RoomRental findById(int roomId);
    List<RoomRental> findAll();
    void save(RoomRental roomRental);
    void update(int roomId, RoomRental roomRental);
    void remove(int roomId);
    List<RoomRental> search(String keyword);
}