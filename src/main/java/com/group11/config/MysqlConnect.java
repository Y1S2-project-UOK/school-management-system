package com.group11.config;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class MysqlConnect {
    private static final String URL = "jdbc:mysql://localhost:3306/schoolManagementSystem";
    private static final String DATABASE_USER_NAME = "root";
    private static final String DATABASE_PASSWORD = "123@Ishan";
    Connection con = null;
   
    public static Connection ConnectDB(){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, DATABASE_USER_NAME, DATABASE_PASSWORD);
            return con;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e);
            return null;
        }
    }
}