<%@ page import="java.util.List" %>
<%@ page import="com.abc.hospital.entity.Patient" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Records</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">Hospital Patient Record System</div>
    <div>
        <a href="<%=request.getContextPath()%>/dashboard">Dashboard</a>
        <a href="<%=request.getContextPath()%>/logout">Logout</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h1>Patient Records</h1>
        <a class="btn btn-success" href="<%=request.getContextPath()%>/patients?action=new">+ Add New Patient</a>
    </div>

    <% if (request.getParameter("success") != null) { %>
        <div class="alert success"><%=request.getParameter("success")%></div>
    <% } %>

    <% if (request.getParameter("error") != null) { %>
        <div class="alert"><%=request.getParameter("error")%></div>
    <% } %>

    <div class="card">
        <%
            List<Patient> patients = (List<Patient>) request.getAttribute("patients");
        %>
        <% if (patients == null || patients.isEmpty()) { %>
            <p>No patient records found.</p>
        <% } else { %>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Phone</th>
                    <th>Actions</th>
                </tr>
                <% for (Patient p : patients) { %>
                <tr>
                    <td><%=p.getId()%></td>
                    <td><%=p.getPatientName()%></td>
                    <td><%=p.getDateOfBirth()%></td>
                    <td><%=p.getGender()%></td>
                    <td><%=p.getPhone()%></td>
                    <td>
                        <a href="<%=request.getContextPath()%>/patient/details?id=<%=p.getId()%>">View</a>
                        |
                        <a href="<%=request.getContextPath()%>/patients?action=edit&id=<%=p.getId()%>">Update</a>
                    </td>
                </tr>
                <% } %>
            </table>
        <% } %>
    </div>
</div>
</body>
</html>
