package com.abc.hospital.service;

import com.abc.hospital.dao.PatientDao;
import com.abc.hospital.entity.Patient;

import java.util.List;

public class PatientService {
    private final PatientDao dao = new PatientDao();

    public void add(Patient patient) {
        validate(patient);
        dao.save(patient);
    }

    public Patient find(Long id) {
        return dao.findById(id);
    }

    public List<Patient> findAll() {
        return dao.findAll();
    }

    public void update(Patient patient) {
        validate(patient);
        dao.update(patient);
    }

    private void validate(Patient p) {
        if (p.getPatientName() == null || p.getPatientName().isBlank())
            throw new IllegalArgumentException("Patient name is required.");
        if (p.getDateOfBirth() == null)
            throw new IllegalArgumentException("Date of birth is required.");
        if (p.getGender() == null || p.getGender().isBlank())
            throw new IllegalArgumentException("Gender is required.");
        if (p.getPhone() == null || p.getPhone().isBlank())
            throw new IllegalArgumentException("Phone is required.");
    }
}
