package com.otakushop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/otakushop?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "16321548xD";

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USER, PASS);
    }
}
