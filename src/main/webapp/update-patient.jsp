<%@ page import="com.abc.hospital.entity.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Patient p = (Patient) request.getAttribute("patient");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Patient</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">Hospital Patient Record System</div>
    <a href="<%=request.getContextPath()%>/patients">Back to Records</a>
</div>

<div class="container">
    <div class="card">
        <h1>Update Patient</h1>

        <form method="post" action="<%=request.getContextPath()%>/patients">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%=p.getId()%>">

            <label>Patient Name</label>
            <input type="text" name="patientName" value="<%=p.getPatientName()%>" required>

            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth" value="<%=p.getDateOfBirth()%>" required>

            <label>Gender</label>
            <select name="gender" required>
                <option <%= "Male".equals(p.getGender()) ? "selected" : "" %>>Male</option>
                <option <%= "Female".equals(p.getGender()) ? "selected" : "" %>>Female</option>
                <option <%= "Other".equals(p.getGender()) ? "selected" : "" %>>Other</option>
            </select>

            <label>Phone</label>
            <input type="text" name="phone" value="<%=p.getPhone()%>" required>

            <label>Address</label>
            <input type="text" name="address" value="<%=p.getAddress() == null ? "" : p.getAddress()%>">

            <label>Medical History</label>
            <textarea name="medicalHistory"><%=p.getMedicalHistory() == null ? "" : p.getMedicalHistory()%></textarea>

            <button type="submit">Update Patient</button>
            <a class="btn btn-secondary" href="<%=request.getContextPath()%>/patients">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
