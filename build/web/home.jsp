<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="otakushop.dao.Usuario" %>
<%
    HttpSession session = request.getSession(false);
    Usuario usuario = (session != null) ? (Usuario) session.getAttribute("usuario") : null;
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Inicio - OtakuShop</title>
</head>
<body>
    <h2>Bienvenido <%= usuario.getNombre() %> a OtakuShop</h2>
    <p>Email: <%= usuario.getEmail() %></p>
    <a href="logout.jsp">Cerrar sesión</a>
</body>
</html>
