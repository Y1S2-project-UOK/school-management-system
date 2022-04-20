package users.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.group11.config.MysqlConnect;
import com.mysql.cj.jdbc.CallableStatement;

public class SystemUser {
    private String staffRegNo;
    private String staffName;
    private String staffEmail;
    private String reasonToJoin;
    private int approveStatus;

    public SystemUser(String staffRegNo, String staffName, String staffEmail, String reasonToJoin, int approveStatus) {
        this.staffRegNo = staffRegNo;
        this.staffName = staffName;
        this.staffEmail = staffEmail;
        this.reasonToJoin = reasonToJoin;
        this.approveStatus = approveStatus;
    }

    public String getStaffRegNo() {
        return staffRegNo;
    }

    public void setStaffRegNo(String staffRegNo) {
        this.staffRegNo = staffRegNo;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public String getStaffEmail() {
        return staffEmail;
    }

    public void setStaffEmail(String staffEmail) {
        this.staffEmail = staffEmail;
    }

    public String getReasonToJoin() {
        return reasonToJoin;
    }

    public void setReasonToJoin(String reasonToJoin) {
        this.reasonToJoin = reasonToJoin;
    }

    public int getApproveStatus() {
        return approveStatus;
    }

    public void setApproveStatus(int approveStatus) {
        this.approveStatus = approveStatus;
    }

    public static ArrayList<SystemUser> getSystemUserList() {
        ArrayList<SystemUser> systemUserList = new ArrayList<SystemUser>();
        try {
            Connection conn = MysqlConnect.ConnectDB();

            String query = "CALL get_users_table();";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                SystemUser systemUser = new SystemUser(rs.getString("staff_reg_no"), rs.getString("staff_name"), rs.getString("staff_email"), rs.getString("reason_to_join"), rs.getInt("aprove_status"));
                systemUserList.add(systemUser);
            }
            return systemUserList;

        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 0);
            return null;
        }
    }

    // public static void main(String[] args) {
    //     SystemUser.getSystemUserList();
    // }
}
