package com.resqnet.controller;

import com.resqnet.dao.EmergencyReportDao;
import com.resqnet.dao.HospitalDao;
import com.resqnet.model.EmergencyReport;
import com.resqnet.model.HospitalStaff;
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
 * Controller managing the Hospital Response Desk, trauma queue, and status updates.
 */
@WebServlet("/hospital-portal")
public class HospitalPortalServlet extends HttpServlet {

    private final HospitalDao hospitalDao = new HospitalDao();
    private final EmergencyReportDao reportDao = new EmergencyReportDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        HospitalStaff staff = (session != null) ? (HospitalStaff) session.getAttribute("hospitalStaff") : null;

        String action = request.getParameter("action");
        if ("logout".equalsIgnoreCase(action)) {
            if (session != null) {
                session.removeAttribute("hospitalStaff");
            }
            response.sendRedirect(request.getContextPath() + "/hospital-portal");
            return;
        }

        if (staff != null) {
            List<EmergencyReport> allReports = reportDao.getAllReports();
            request.setAttribute("staff", staff);
            request.setAttribute("allReports", allReports);
        }

        request.getRequestDispatcher("/hospital-portal.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("login".equalsIgnoreCase(action)) {
            String identifier = request.getParameter("identifier");
            String password = request.getParameter("password");

            HospitalStaff staff = hospitalDao.authenticateStaff(identifier, password);
            if (staff != null) {
                HttpSession session = request.getSession(true);
                session.setAttribute("hospitalStaff", staff);
                response.sendRedirect(request.getContextPath() + "/hospital-portal");
                return;
            } else {
                request.setAttribute("errorMessage", "Invalid staff credentials. (Hint: Demo Staff Code: STAFF-101, Password: hospital123)");
            }
        } else if ("update-status".equalsIgnoreCase(action)) {
            HttpSession session = request.getSession(false);
            HospitalStaff staff = (session != null) ? (HospitalStaff) session.getAttribute("hospitalStaff") : null;
            if (staff != null) {
                int reportId = ValidationUtil.parseInt(request.getParameter("reportId"), 0);
                String newStatus = request.getParameter("newStatus");
                if (reportId > 0 && ValidationUtil.isNotEmpty(newStatus)) {
                    reportDao.updateReportStatus(reportId, newStatus, staff.getHospitalId());
                    request.setAttribute("successMessage", "Incident #" + reportId + " status updated to '" + newStatus + "'.");
                }
            }
        }

        doGet(request, response);
    }
}
