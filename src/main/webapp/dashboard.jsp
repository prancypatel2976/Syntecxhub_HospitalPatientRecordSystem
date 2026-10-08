<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="brand">Hospital Patient Record System</div>
    <div>
        <span>Welcome, <%=session.getAttribute("user")%></span>
        <a href="<%=request.getContextPath()%>/logout">Logout</a>
    </div>
</div>

<div class="container">
    <h1>Dashboard</h1>
    <p class="subtitle">Manage hospital patient records securely.</p>

    <div class="grid">
        <div class="stat">
            <div class="subtitle">Total Patients</div>
            <div class="stat-number"><%=request.getAttribute("patientCount")%></div>
        </div>
    </div>

    <div class="card">
        <h2>Patient Management</h2>
        <a class="btn btn-success" href="<%=request.getContextPath()%>/patients?action=new">Add New Patient</a>
        <a class="btn" href="<%=request.getContextPath()%>/patients">View Patient Records</a>
    </div>
</div>

</body>
</html>
