<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.otakushop.model.Carrito" %>
<%@ page import="com.otakushop.dao.ProductoDAO" %>
<%@ page import="com.otakushop.model.Producto" %>

<%
    List<Carrito> carrito = (List<Carrito>) request.getAttribute("lista");
    ProductoDAO pdao = new ProductoDAO();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrito de Compras - OtakuShop</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { border: 1px solid #333; padding: 8px; text-align: center; }
        th { background-color: #555; color: white; }
        h1 { text-align: center; }
        a.button { padding: 5px 10px; background-color: #555; color: white; text-decoration: none; margin: 2px; border-radius: 3px; }
        a.button:hover { background-color: #333; }
    </style>
</head>
<body>
    <h1>Carrito de Compras</h1>

    <%
        if (carrito == null || carrito.isEmpty()) {
    %>
        <p style="text-align:center;">El carrito está vacío.</p>
        <div style="text-align:center; margin-top:20px;">
            <a class="button" href="ProductoServlet">Ir a Productos</a>
        </div>
    <%
        } else {
            double total = 0;
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Producto</th>
            <th>Precio</th>
            <th>Cantidad</th>
            <th>Subtotal</th>
            <th>Acciones</th>
        </tr>
        <%
            for (Carrito c : carrito) {
                Producto p = pdao.buscarPorId(c.getProductoId());
                if (p != null) {
                    double subtotal = p.getPrecio() * c.getCantidad();
                    total += subtotal;
        %>
        <tr>
            <td><%= c.getId() %></td>
            <td><%= p.getNombre() %></td>
            <td>$<%= String.format("%.2f", p.getPrecio()) %></td>
            <td><%= c.getCantidad() %></td>
            <td>$<%= String.format("%.2f", subtotal) %></td>
            <td>
                <a class="button" href="CarritoServlet?action=eliminar&id=<%= c.getId() %>">Eliminar</a>
            </td>
        </tr>
        <%
                }
            }
        %>
        <tr>
            <td colspan="4" style="text-align:right;"><strong>Total:</strong></td>
            <td colspan="2">$<%= String.format("%.2f", total) %></td>
        </tr>
    </table>

    <div style="text-align:center; margin-top:20px;">
        <a class="button" href="CarritoServlet?action=vaciar">Vaciar Carrito</a>
        <a class="button" href="ProductoServlet">Seguir Comprando</a>
        <!-- Aquí luego se podrá agregar "Confirmar Compra" -->
    </div>
    <%
        }
    %>
</body>
</html>
