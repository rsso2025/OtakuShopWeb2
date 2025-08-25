package com.otakushop.servlets;

import com.otakushop.dao.PedidoDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PedidoServlet extends HttpServlet {

    private PedidoDAO pedidoDAO = new PedidoDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();
        Integer idUsuario = (Integer) sesion.getAttribute("idUsuario");

        if (idUsuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        double total = Double.parseDouble(request.getParameter("total"));

        pedidoDAO.crearPedido(idUsuario, total);

        response.sendRedirect("home.jsp");
    }
}
