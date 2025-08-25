package com.otakushop.servlets;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class CerrarSesionServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate(); // Cierra la sesión
        }
        response.sendRedirect("login.jsp"); // Redirige a login
    }
}
