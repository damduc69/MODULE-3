package com.codegym.rental.service;

import com.codegym.rental.dao.RoomDAO;
import com.codegym.rental.model.Room;

import java.util.List;
import java.util.Optional;

public class RoomService {
    private final RoomDAO roomDAO;

    public RoomService() {
        roomDAO = new RoomDAO();
    }

    public List<Room> getRooms() {
        List<Room> rooms = roomDAO.findRooms();
        if (Optional.ofNullable(rooms).isPresent()) {
            return rooms;
        }
        return null;
    }

    public Room getRoomById(Integer roomId) {
        return roomDAO.findRoomByID(roomId);
    }

    public void addRoom(Room room) {
        roomDAO.insert(room);
    }

    public void editRoom(Room room){
        roomDAO.update(room);
    }

    public void removeRoom(Integer id) {
        roomDAO.delete(id);
    }
    public void searchRoom(Integer id) {
        roomDAO.search(id);
    }
}
