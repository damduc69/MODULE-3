package com.codegym.rental.dao;


import com.codegym.rental.connection.JdbcConnection;
import com.codegym.rental.model.Room;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RoomDAO {
    private List<Room> rooms;

    public List<Room> findRooms() {
        rooms = new ArrayList<>();
        try {
            Connection connection = JdbcConnection.getConnection();
            String sql = "SELECT * FROM rentalroom";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Room room = new Room();
                room.setId(resultSet.getInt("id"));
                room.setTenantName(resultSet.getString("tenant_name"));
                room.setPhone(resultSet.getString("phone_number"));
                room.setStartDate(resultSet.getDate("start_date"));
                room.setPaymentMethod(resultSet.getInt("payment_method_id"));
                room.setNote(resultSet.getString("notes"));
                rooms.add(room);
            }
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public void insert(Room room) {
        try {
                Connection connection = JdbcConnection.getConnection();
                String query = "insert into RentalRoom (tenant_name, phone_number, start_date, payment_method_id, notes) values (?, ?, ?, ?, ?)";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, room.getTenantName());
                preparedStatement.setString(2, room.getPhone());

                java.sql.Date sqlStartDate = new java.sql.Date(room.getStartDate().getTime());

                preparedStatement.setDate(3, sqlStartDate);
                preparedStatement.setInt(4, room.getPaymentMethod());
                preparedStatement.setString(5, room.getNote());

                if (preparedStatement.executeUpdate() > 0) {
                    System.out.println("Added room successfully.");
                } else {
                    System.out.println("Failed to insert room.");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
    }

    public Room findRoomByID(int roomId) {
        Room room = null;
        try {
            Connection connection = JdbcConnection.getConnection();
            String query = "SELECT * FROM rentalroom r WHERE r.id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, roomId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                room = new Room();
                room.setId(resultSet.getInt("id"));
                room.setTenantName(resultSet.getString("tenant_name"));
                room.setPhone(resultSet.getString("phone_number"));
                room.setStartDate(resultSet.getDate("start_date"));
                room.setPaymentMethod(resultSet.getInt("payment_method_id"));
                room.setNote(resultSet.getString("notes"));
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return room;
    }

    public void update(Room room) {
        try {
            Connection connection = JdbcConnection.getConnection();
            String query = "UPDATE RentalRoom SET tenant_name = ?, phone_number = ?, start_date = ?, payment_method_id = ?, notes = ? WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, room.getTenantName());
            preparedStatement.setString(2, room.getPhone());

            java.sql.Date sqlStartDate = new java.sql.Date(room.getStartDate().getTime());

            preparedStatement.setDate(3, sqlStartDate);
            preparedStatement.setInt(4, room.getPaymentMethod());
            preparedStatement.setString(5, room.getNote());
            preparedStatement.setInt(6, room.getId());

            if (preparedStatement.executeUpdate() > 0) {
                System.out.println("Updated room successfully.");
            } else {
                System.out.println("Failed to update room.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void delete(Integer id) {
        try {
            Connection connection = JdbcConnection.getConnection();
            String query = "DELETE FROM rentalroom WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);

            if(preparedStatement.executeUpdate() > 0) {
                System.out.println("Removed room successfully.");
            } else {
                System.out.println("Failed to remove room.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void search (Integer id) {
        try {
            Connection connection = JdbcConnection.getConnection();
            String sql = "SELECT * FROM rentalroom WHERE id = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);

            if(preparedStatement.executeUpdate() > 0) {
                System.out.println("Search room successfully.");
            } else {
                System.out.println("Failed to search room.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}