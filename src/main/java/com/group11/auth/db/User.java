package com.group11.auth.db;

import java.sql.Connection;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import com.group11.config.MysqlConnect;
import com.mysql.cj.jdbc.CallableStatement;

public class User {
    public boolean createUser(String staffId, String email, String password,String reasonToJoin) {
        try {
            Connection conn = MysqlConnect.ConnectDB();
            //check user already registered
            // String CheckQuery = "CALL get_user_by_staff_id(?);";
            // CallableStatement CheckStmt = (CallableStatement) conn.prepareCall(CheckQuery);
            // CheckStmt.setString(1, staffId);
            // ResultSet CheckRs = CheckStmt.executeQuery();
            // System.out.println(CheckRs.next());
            // if(CheckRs.next()){
            //     throw new Exception("your may already registered try to login");
            // }
            //validate staff member 
            String query = "CALL auth_staff_member(?,?,?);";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);
            stmt.setString(1, staffId);
            stmt.setString(2, email);
            stmt.setString(3, password);
            ResultSet rs = stmt.executeQuery();
            if(!rs.next()){
                throw new Exception("check your staffID, email or password");
            }
            if (rs.next()) {
                   //adding new user as system user
                   String newQuery = "CALL add_system_user(?,?);";
                   CallableStatement newStmt = (CallableStatement) conn.prepareCall(newQuery);
                   newStmt.setString(1, reasonToJoin);
                   newStmt.setString(2, staffId);
                   newStmt.execute();
            }
            conn.close();
            return true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 1);
            return false;
        }
    }

    public boolean validateUser(String email, String pwd) {
        try {
            Connection conn = MysqlConnect.ConnectDB();

            String query = "{CALL get_user_status_by_email_and_password(?,?)}";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);
            stmt.setString(1, email);
            stmt.setString(2, pwd);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // check user approveStatus
                if (rs.getInt(1) == 1) {
                    return true;

                } else {
                    JOptionPane.showMessageDialog(null, "your signup request is pending try again some time", "", 0);
                    return false;
                }
            } else {
                JOptionPane.showMessageDialog(null, "Wrong Username & Password", "", 0);
                return false;
            }

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 0);
            return false;
        }
    }
}
