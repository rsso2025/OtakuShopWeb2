<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>OtakuShop - Bienvenida</title>
</head>
<body>
    <h1>¡Bienvenido a OtakuShop!</h1>
    <p>
        <% 
            String usuario = (String) session.getAttribute("usuario");
            String mensaje = (String) session.getAttribute("mensaje");
            if(usuario != null) { out.print("Usuario: " + usuario); }
            if(mensaje != null){ out.print("<br>" + mensaje); session.removeAttribute("mensaje"); } 
        %>
    </p>
    <p><a href="index.html">Volver al inicio</a></p>
</body>
</html>
