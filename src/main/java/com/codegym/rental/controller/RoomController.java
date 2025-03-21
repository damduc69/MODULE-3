package com.codegym.rental.controller;

import com.codegym.rental.model.Room;
import com.codegym.rental.service.RoomService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@WebServlet(name = "RoomController",
            urlPatterns = {"/tenant/list", "/tenant/add",
                            "/tenant/detail", "/tenant/edit", "/tenant/remove", "/tenant/search"})
public class RoomController extends HttpServlet {
    private final RoomService roomService;

    public RoomController() {
        roomService = new RoomService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        Integer roomId = 0;
        Room room = null;

        if (Optional.ofNullable(req.getParameter("id")).isPresent()) {
            roomId = Integer.parseInt(req.getParameter("id"));
            room = roomService.getRoomById(roomId);
        }

        switch (action) {
            case "/tenant/list":
                List<Room> rooms = roomService.getRooms();
                req.setAttribute("rooms", rooms);
                req.getRequestDispatcher("/WEB-INF/view/tenant/list.jsp").forward(req, resp);
                break;
            case "/tenant/detail":
                req.setAttribute("room", room);
                req.getRequestDispatcher("/WEB-INF/view/tenant/detail.jsp").forward(req, resp);
                break;
            case "/tenant/add":
                req.getRequestDispatcher("/WEB-INF/view/tenant/add.jsp").forward(req, resp);
                break;
            case "/tenant/edit":
                req.setAttribute("room", room);
                req.getRequestDispatcher("/WEB-INF/view/tenant/edit.jsp").forward(req, resp);
                break;
            case "/tenant/remove":
                roomService.removeRoom(roomId);
                resp.sendRedirect(req.getContextPath() + "/tenant/list");
                break;
            case "tenant/search":
                roomService.searchRoom(roomId);
                req.getRequestDispatcher("/WEB-INF/view/tenant/search.jsp").forward(req,resp);
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getServletPath();
        Integer roomId;
        Room currentRoom = null;

        if (Optional.ofNullable(req.getParameter("id")).isPresent()) {
            roomId = Integer.parseInt(req.getParameter("id"));
            currentRoom = roomService.getRoomById(roomId);
        }

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate;
        try {
            startDate = formatter.parse(req.getParameter("startDate"));
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        String tenantName = req.getParameter("tenantName");
        String phone = req.getParameter("phone");
        Integer paymentMethod = Integer.valueOf(req.getParameter("paymentMethod"));
        String note = req.getParameter("note");


        switch (action) {
            case "/tenant/add":
                Room addingRoom = new Room(tenantName, phone, startDate, paymentMethod, note);
                roomService.addRoom(addingRoom);
                req.setAttribute("addedMessage", "Thêm mới phòng thành công");
                resp.sendRedirect(req.getContextPath() + "/tenant/list");
                break;
            case "/tenant/edit":
                if (currentRoom == null) {
                    req.setAttribute("failedMessage", "Không tìm thấy phòng!!!");
                    req.getRequestDispatcher("/WEB-INF/view/tenant/edit.jsp").forward(req, resp);
                } else {
                    currentRoom.setTenantName(tenantName);
                    currentRoom.setPhone(phone);

                    java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());

                    currentRoom.setStartDate(sqlStartDate);
                    currentRoom.setPaymentMethod(paymentMethod);
                    currentRoom.setNote(note);
                    roomService.editRoom(currentRoom);

                    req.setAttribute("updatedMessage", "Cập nhật phòng thành công!!!");
                    resp.sendRedirect(req.getContextPath() + "/tenant/list");
                    break;
                }
            default:
                break;
        }
    }
}
