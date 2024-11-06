package org.example.bai_thi_ket_thuc_module_3.controller;

import org.example.bai_thi_ket_thuc_module_3.model.RoomRental;
import org.example.bai_thi_ket_thuc_module_3.service.IRoomRentalService;
import org.example.bai_thi_ket_thuc_module_3.service.RoomRentalService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet(name = "RoomRentalController", urlPatterns = {"/roomRentals"})
public class RoomRentalController extends HttpServlet {
    private final IRoomRentalService roomRentalService = new RoomRentalService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteRoomRental(request, response);
                break;
            case "search":
                searchRoomRentals(request, response);
                break;
            default:
                listRoomRentals(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createRoomRental(request, response);
                break;
            case "edit":
                updateRoomRental(request, response);
                break;
            default:
                listRoomRentals(request, response);
                break;
        }
    }

    private void listRoomRentals(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<RoomRental> roomRentals = roomRentalService.findAll();
        request.setAttribute("roomRentals", roomRentals);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/create.jsp").forward(request, response);
    }

    private void createRoomRental(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String tenantName = request.getParameter("tenantName");
        String phoneNumber = request.getParameter("phoneNumber");
        String startDateStr = request.getParameter("startDate");
        Date startDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date parsedDate = sdf.parse(startDateStr);
            startDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
        }
        String paymentMethod = request.getParameter("paymentMethod");
        int paymentMethodId;
        switch (paymentMethod) {
            case "monthly":
                paymentMethodId = 1;
                break;
            case "quarterly":
                paymentMethodId = 2;
                break;
            case "yearly":
                paymentMethodId = 3;
                break;
            default:
                throw new ServletException("Invalid payment method");
        }
        String notes = request.getParameter("notes");

        RoomRental newRoomRental = new RoomRental(tenantName, phoneNumber, startDate, paymentMethodId, notes);
        roomRentalService.save(newRoomRental);
        response.sendRedirect("/roomRentals");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        RoomRental existingRoomRental = roomRentalService.findById(roomId);
        request.setAttribute("roomRental", existingRoomRental);
        request.getRequestDispatcher("/edit.jsp").forward(request, response);
    }

    private void updateRoomRental(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        String tenantName = request.getParameter("tenantName");
        String phoneNumber = request.getParameter("phoneNumber");
        String startDateStr = request.getParameter("startDate");
        Date startDate = null;
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            java.util.Date parsedDate = sdf.parse(startDateStr);
            startDate = new Date(parsedDate.getTime());
        } catch (ParseException e) {
            throw new ServletException("Invalid date format", e);
        }
        String paymentMethod = request.getParameter("paymentMethod");
        int paymentMethodId;
        switch (paymentMethod) {
            case "monthly":
                paymentMethodId = 1;
                break;
            case "quarterly":
                paymentMethodId = 2;
                break;
            case "yearly":
                paymentMethodId = 3;
                break;
            default:
                throw new ServletException("Invalid payment method");
        }
        String notes = request.getParameter("notes");

        RoomRental roomRental = new RoomRental(roomId, tenantName, phoneNumber, startDate, paymentMethodId, notes);
        roomRentalService.update(roomId, roomRental);
        response.sendRedirect("/roomRentals");
    }

    private void deleteRoomRental(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int roomId = Integer.parseInt(request.getParameter("roomId"));
        roomRentalService.remove(roomId);
        response.sendRedirect("/roomRentals");
    }

    private void searchRoomRentals(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<RoomRental> roomRentals = roomRentalService.search(keyword);
        request.setAttribute("roomRentals", roomRentals);
        request.getRequestDispatcher("/list.jsp").forward(request, response);
    }
}
