package com.otakushop.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {
    private static final String URL = "jdbc:mysql://localhost:3306/otakushop?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = "16321548xD";

    public static Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // para conector 5.1.49
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
