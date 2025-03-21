package com.codegym.rental.model;

import java.util.Date;

public class Room {
    private Integer id;
    private String tenantName;
    private String phone;
    private Date startDate;
    private Integer paymentMethod;
    private String note;

    public Room() {}

    public Room(String tenantName, String phone, Date startDate, Integer paymentMethod, String note) {
        this.tenantName = tenantName;
        this.phone = phone;
        this.startDate = startDate;
        this.paymentMethod = paymentMethod;
        this.note = note;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Integer getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(Integer paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}