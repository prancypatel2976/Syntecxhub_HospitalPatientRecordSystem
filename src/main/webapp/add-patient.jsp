<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Patient</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">Hospital Patient Record System</div>
    <a href="<%=request.getContextPath()%>/dashboard">Dashboard</a>
</div>

<div class="container">
    <div class="card">
        <h1>Add New Patient</h1>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert"><%= request.getAttribute("error") %></div>
        <% } %>

        <form method="post" action="<%=request.getContextPath()%>/patients">
            <input type="hidden" name="action" value="add">

            <label>Patient Name</label>
            <input type="text" name="patientName" required>

            <label>Date of Birth</label>
            <input type="date" name="dateOfBirth" required>

            <label>Gender</label>
            <select name="gender" required>
                <option value="">Select</option>
                <option>Male</option>
                <option>Female</option>
                <option>Other</option>
            </select>

            <label>Phone</label>
            <input type="text" name="phone" required>

            <label>Address</label>
            <input type="text" name="address">

            <label>Medical History</label>
            <textarea name="medicalHistory" placeholder="Enter relevant medical history"></textarea>

            <button type="submit">Save Patient</button>
            <a class="btn btn-secondary" href="<%=request.getContextPath()%>/patients">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
