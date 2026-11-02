package com.resqnet.controller;

import com.resqnet.dao.EmergencyContactDao;
import com.resqnet.dao.HospitalDao;
import com.resqnet.model.EmergencyContact;
import com.resqnet.model.Hospital;
import com.resqnet.util.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

/**
 * Controller managing User Emergency Contacts and Regional Hospital Directory.
 */
@WebServlet("/emergency-contacts")
public class EmergencyContactsServlet extends HttpServlet {

    private final EmergencyContactDao contactDao = new EmergencyContactDao();
    private final HospitalDao hospitalDao = new HospitalDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int userId = (session != null && session.getAttribute("userId") != null) ?
                (Integer) session.getAttribute("userId") : 0;

        List<EmergencyContact> contacts = (userId > 0) ? contactDao.getContactsByUserId(userId) : List.of();
        List<Hospital> hospitals = hospitalDao.getAllHospitals();

        request.setAttribute("contacts", contacts);
        request.setAttribute("hospitals", hospitals);
        request.getRequestDispatcher("/emergency-contacts.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login?error=auth-required");
            return;
        }

        int userId = (Integer) session.getAttribute("userId");
        String action = request.getParameter("action");

        if ("add".equalsIgnoreCase(action)) {
            String contactName = request.getParameter("contactName");
            String relationship = request.getParameter("relationship");
            String phone = request.getParameter("phone");
            boolean isPrimary = "true".equalsIgnoreCase(request.getParameter("isPrimary"));

            if (ValidationUtil.isNotEmpty(contactName) && ValidationUtil.isValidPhone(phone)) {
                EmergencyContact c = new EmergencyContact(userId, contactName, relationship, phone, isPrimary);
                contactDao.addContact(c);
                request.setAttribute("successMessage", "Emergency contact added successfully.");
            } else {
                request.setAttribute("errorMessage", "Please provide a valid contact name and phone number.");
            }
        } else if ("delete".equalsIgnoreCase(action)) {
            int contactId = ValidationUtil.parseInt(request.getParameter("contactId"), 0);
            if (contactId > 0) {
                contactDao.deleteContact(contactId, userId);
                request.setAttribute("successMessage", "Contact removed successfully.");
            }
        }

        doGet(request, response);
    }
}
