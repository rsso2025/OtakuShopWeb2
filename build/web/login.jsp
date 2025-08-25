<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - OtakuShop</title>
</head>
<body>
    <h2>Login OtakuShop</h2>
    <form action="LoginServlet" method="post">
        <label>Email:</label><br>
        <input type="text" name="email" required><br><br>
        <label>Contraseña:</label><br>
        <input type="password" name="password" required><br><br>
        <input type="submit" value="Ingresar">
    </form>

    <% if (request.getAttribute("error") != null) { %>
        <p style="color:red;"><%= request.getAttribute("error") %></p>
    <% } %>
</body>
</html>
