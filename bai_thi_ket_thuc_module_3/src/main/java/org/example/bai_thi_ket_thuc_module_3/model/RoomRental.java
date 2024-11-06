package org.example.bai_thi_ket_thuc_module_3.model;

import java.util.Date;

public class RoomRental {
    private int roomId;
    private String tenantName;
    private String phoneNumber;
    private Date startDate;
    private int paymentMethodId;
    private String notes;

    public RoomRental() {}

    public RoomRental(int roomId, String tenantName, String phoneNumber, Date startDate, int paymentMethodId, String notes) {
        this.roomId = roomId;
        this.tenantName = tenantName;
        this.phoneNumber = phoneNumber;
        this.startDate = startDate;
        this.paymentMethodId = paymentMethodId;
        this.notes = notes;
    }

    public RoomRental(String tenantName, String phoneNumber, java.sql.Date startDate, int paymentMethodId, String notes) {
        this.tenantName = tenantName;
        this.phoneNumber = phoneNumber;
        this.startDate = startDate;
        this.paymentMethodId = paymentMethodId;
        this.notes = notes;
    }

    public int getRoomId() {
        return roomId;
    }

    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public int getPaymentMethodId() {
        return paymentMethodId;
    }

    public void setPaymentMethodId(int paymentMethodId) {
        this.paymentMethodId = paymentMethodId;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}