package com.otakushop.servlets;

import com.otakushop.dao.ProductoDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class EliminarProductoServlet extends HttpServlet {

    private ProductoDAO productoDAO = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        productoDAO.eliminarProducto(id);
        response.sendRedirect("AgregarProductoServlet");
    }
}
