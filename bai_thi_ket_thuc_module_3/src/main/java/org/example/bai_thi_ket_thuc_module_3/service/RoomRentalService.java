package org.example.bai_thi_ket_thuc_module_3.service;

import org.example.bai_thi_ket_thuc_module_3.model.RoomRental;
import org.example.bai_thi_ket_thuc_module_3.repository.IRoomRentalRepository;
import org.example.bai_thi_ket_thuc_module_3.repository.RoomRentalRepository;

import java.util.List;

public class RoomRentalService implements IRoomRentalService {
    private final IRoomRentalRepository roomRentalRepository = new RoomRentalRepository();

    @Override
    public RoomRental findById(int roomId) {
        return roomRentalRepository.findById(roomId);
    }

    @Override
    public List<RoomRental> findAll() {
        return roomRentalRepository.findAll();
    }

    @Override
    public void save(RoomRental roomRental) {
        roomRentalRepository.save(roomRental);
    }

    @Override
    public void update(int roomId, RoomRental roomRental) {
        roomRentalRepository.update(roomId, roomRental);
    }

    @Override
    public void remove(int roomId) {
        roomRentalRepository.remove(roomId);
    }

    @Override
    public List<RoomRental> search(String keyword) {
        return roomRentalRepository.search(keyword);
    }
}