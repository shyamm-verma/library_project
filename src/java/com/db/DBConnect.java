package com.db;
import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnect {



    public static Connection getConnection() {
        Connection conn =null;
        if (conn == null) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                 conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/library_management", "root", "");

            } catch (Exception e) {
                e.printStackTrace();
            }
            return conn;
        }

        return conn;

    }

}
