<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.otakushop.dao.Producto" %>
<%@ page import="com.otakushop.dao.ProductoDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestión de Productos - OtakuShop</title>
    <link rel="stylesheet" href="estilos.css">
</head>
<body>
    <h2>Productos</h2>

    <!-- Formulario para agregar un producto -->
    <h3>Agregar Producto</h3>
    <form action="AgregarProductoServlet" method="post">
        <label for="nombre">Nombre:</label><br>
        <input type="text" name="nombre" id="nombre" required><br><br>

        <label for="precio">Precio:</label><br>
        <input type="number" step="0.01" name="precio" id="precio" required><br><br>

        <label for="stock">Stock:</label><br>
        <input type="number" name="stock" id="stock" required><br><br>

        <button type="submit">Agregar Producto</button>
    </form>

    <hr>

    <!-- Listado de productos -->
    <h3>Lista de Productos</h3>
    <%
        ProductoDAO productoDAO = new ProductoDAO();
        List<Producto> productos = productoDAO.listarProductos();
    %>

    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Precio</th>
            <th>Stock</th>
            <th>Acciones</th>
        </tr>
        <%
            for (Producto p : productos) {
        %>
        <tr>
            <td><%= p.getId() %></td>
            <td><%= p.getNombre() %></td>
            <td><%= p.getPrecio() %></td>
            <td><%= p.getStock() %></td>
            <td>
                <a href="EditarProductoServlet?id=<%= p.getId() %>">Editar</a> |
                <a href="EliminarProductoServlet?id=<%= p.getId() %>">Eliminar</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
