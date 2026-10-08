package com.abc.hospital.web;

import com.abc.hospital.entity.Patient;
import com.abc.hospital.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/patient/details")
public class PatientDetailsServlet extends HttpServlet {
    private final PatientService service = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            Long id = Long.valueOf(req.getParameter("id"));
            Patient patient = service.find(id);

            if (patient == null) {
                resp.sendRedirect(req.getContextPath() + "/patients?error=Patient+not+found");
                return;
            }

            req.setAttribute("patient", patient);
            req.getRequestDispatcher("/patient-details.jsp").forward(req, resp);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/patients?error=Invalid+patient+ID");
        }
    }
}
