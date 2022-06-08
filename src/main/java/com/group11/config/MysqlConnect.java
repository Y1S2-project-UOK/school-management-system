package com.group11.config;

import java.sql.Connection;
import java.sql.DriverManager;


public class MysqlConnect {
    private static final String URL = "jdbc:mysql://localhost:3306/school_management_system";
    private static final String DATABASE_USER_NAME = "root";
    private static final String DATABASE_PASSWORD = "12345678";
    Connection con = null;
   
    public static Connection ConnectDB(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, DATABASE_USER_NAME, DATABASE_PASSWORD);
            return con;
        } catch (Exception e) {
            return null;
        }
    }
}
