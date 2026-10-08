package com.abc.hospital.web;

import com.abc.hospital.entity.Patient;
import com.abc.hospital.service.PatientService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/patients")
public class PatientServlet extends HttpServlet {
    private final PatientService service = new PatientService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        if ("new".equals(action)) {
            req.getRequestDispatcher("/add-patient.jsp").forward(req, resp);
            return;
        }

        if ("edit".equals(action)) {
            Long id = parseId(req.getParameter("id"));
            Patient patient = id == null ? null : service.find(id);
            if (patient == null) {
                req.setAttribute("error", "Patient not found.");
                resp.sendRedirect(req.getContextPath() + "/patients");
                return;
            }
            req.setAttribute("patient", patient);
            req.getRequestDispatcher("/update-patient.jsp").forward(req, resp);
            return;
        }

        req.setAttribute("patients", service.findAll());
        req.getRequestDispatcher("/patients.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String action = req.getParameter("action");

        try {
            if ("add".equals(action)) {
                Patient p = new Patient();
                p.setPatientName(req.getParameter("patientName"));
                p.setDateOfBirth(LocalDate.parse(req.getParameter("dateOfBirth")));
                p.setGender(req.getParameter("gender"));
                p.setPhone(req.getParameter("phone"));
                p.setAddress(req.getParameter("address"));
                p.setMedicalHistory(req.getParameter("medicalHistory"));
                service.add(p);

                resp.sendRedirect(req.getContextPath() + "/patients?success=Patient+added+successfully");
                return;
            }

            if ("update".equals(action)) {
                Long id = parseId(req.getParameter("id"));
                Patient p = service.find(id);
                if (p == null) {
                    resp.sendRedirect(req.getContextPath() + "/patients?error=Patient+not+found");
                    return;
                }

                p.setPatientName(req.getParameter("patientName"));
                p.setDateOfBirth(LocalDate.parse(req.getParameter("dateOfBirth")));
                p.setGender(req.getParameter("gender"));
                p.setPhone(req.getParameter("phone"));
                p.setAddress(req.getParameter("address"));
                p.setMedicalHistory(req.getParameter("medicalHistory"));
                service.update(p);

                resp.sendRedirect(req.getContextPath() + "/patients?success=Patient+updated+successfully");
            }
        } catch (Exception e) {
            req.setAttribute("error", "Unable to save patient: " + e.getMessage());
            req.getRequestDispatcher("/add-patient.jsp").forward(req, resp);
        }
    }

    private Long parseId(String value) {
        try {
            return Long.valueOf(value);
        } catch (Exception e) {
            return null;
        }
    }
}
