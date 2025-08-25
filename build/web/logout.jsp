package com.otakushop.servlets;

import com.otakushop.dao.UsuarioDAO;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UsuarioDAO usuarioDAO = new UsuarioDAO();
        boolean valido = usuarioDAO.validarUsuario(email, password);

        if (valido) {
            // Guardamos la sesión
            HttpSession session = request.getSession();
            session.setAttribute("usuario", email);

            // Redirigimos al home.jsp
            response.sendRedirect("home.jsp");
        } else {
            // Enviamos mensaje de error al login.jsp
            request.setAttribute("error", "Usuario o contraseña incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
