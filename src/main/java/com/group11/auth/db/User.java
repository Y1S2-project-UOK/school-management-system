package com.group11.auth.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JOptionPane;

import com.group11.config.MysqlConnect;
import com.mysql.cj.jdbc.CallableStatement;

public class User {
    public boolean createUser(String fullName, String email, String pwd, String positionSelection, String reasonToJoin,
            String contactNumber, int approveStatus) {
        try {
            Connection conn = MysqlConnect.ConnectDB();
            String query = " insert into system_users (full_name, email, login_password, position, reason_to_join, contact_no, aprove_status)"
                    + " values (?, ?, ?, ?, ?,?,?)";

            PreparedStatement preparedStmt = conn.prepareStatement(query);
            preparedStmt.setString(1, fullName);
            preparedStmt.setString(2, email);
            preparedStmt.setString(3, pwd);
            preparedStmt.setString(4, positionSelection);
            preparedStmt.setString(5, reasonToJoin);
            preparedStmt.setString(6, contactNumber);
            preparedStmt.setInt(7, 0);

            preparedStmt.execute();
            conn.close();
            return true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", approveStatus);
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
