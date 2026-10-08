<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Hospital Patient Record System</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/style.css">
</head>
<body>
<div class="container">
    <div class="card login-card">
        <h1>Hospital Patient Record System</h1>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert"><%= request.getAttribute("error") %></div>
        <% } %>

        <form method="post" action="<%=request.getContextPath()%>/login">
            <label>Username</label>
            <input type="text" name="username" required>

            <label>Password</label>
            <input type="password" name="password" required>

            <button type="submit">Secure Login</button>
        </form>

        <p class="subtitle">Default demo login: admin / Admin@123</p>
    </div>
</div>
</body>
</html>
