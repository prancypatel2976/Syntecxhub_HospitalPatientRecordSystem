package com.abc.hospital.web;

import com.abc.hospital.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {
    private final PatientService service = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setAttribute("patientCount", service.findAll().size());
        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);
    }
}
