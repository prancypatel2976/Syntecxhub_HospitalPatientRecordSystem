<%@ page import="com.abc.hospital.entity.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Patient p = (Patient) request.getAttribute("patient");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Details</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">Hospital Patient Record System</div>
    <a href="<%=request.getContextPath()%>/patients">Back to Records</a>
</div>

<div class="container">
    <div class="card">
        <h1>Patient Details</h1>
        <p><strong>Patient ID:</strong> <%=p.getId()%></p>
        <p><strong>Patient Name:</strong> <%=p.getPatientName()%></p>
        <p><strong>Date of Birth:</strong> <%=p.getDateOfBirth()%></p>
        <p><strong>Gender:</strong> <%=p.getGender()%></p>
        <p><strong>Phone:</strong> <%=p.getPhone()%></p>
        <p><strong>Address:</strong> <%=p.getAddress()%></p>
        <p><strong>Medical History:</strong></p>
        <div class="card"><%=p.getMedicalHistory() == null ? "Not provided" : p.getMedicalHistory()%></div>

        <a class="btn" href="<%=request.getContextPath()%>/patients?action=edit&id=<%=p.getId()%>">
            Update Patient / Medical History
        </a>
    </div>
</div>
</body>
</html>
