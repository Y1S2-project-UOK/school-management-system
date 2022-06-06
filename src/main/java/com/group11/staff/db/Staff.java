/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group11.staff.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.group11.config.MysqlConnect;
import com.mysql.cj.jdbc.CallableStatement;

/**
 *
 * @author ishan
 */
public class Staff {
    private String staffRegNo;
    private String staffName;
    private String staffEmail;
    private String staffDateOfBirth;
    private String staffGender;
    private String staffNic;
    private String staffNationality;
    private String staffReligion;
    private String staffPassword;
    private String basicSalary;

    

    public Staff(String staffRegNo, String staffName, String staffEmail, String staffDateOfBirth, String staffGender,
            String staffNic, String staffNationality, String staffReligion, String staffPassword, String basicSalary) {
        this.staffRegNo = staffRegNo;
        this.staffName = staffName;
        this.staffEmail = staffEmail;
        this.staffDateOfBirth = staffDateOfBirth;
        this.staffGender = staffGender;
        this.staffNic = staffNic;
        this.staffNationality = staffNationality;
        this.staffReligion = staffReligion;
        this.staffPassword = staffPassword;
        this.basicSalary = basicSalary;
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
    public String getStaffDateOfBirth() {
        return staffDateOfBirth;
    }
    public void setStaffDateOfBirth(String staffDateOfBirth) {
        this.staffDateOfBirth = staffDateOfBirth;
    }
    public String getStaffGender() {
        return staffGender;
    }
    public void setStaffGender(String staffGender) {
        this.staffGender = staffGender;
    }
    public String getStaffNic() {
        return staffNic;
    }
    public void setStaffNic(String staffNic) {
        this.staffNic = staffNic;
    }
    public String getStaffNationality() {
        return staffNationality;
    }
    public void setStaffNationality(String staffNationality) {
        this.staffNationality = staffNationality;
    }
    public String getStaffReligion() {
        return staffReligion;
    }
    public void setStaffReligion(String staffReligion) {
        this.staffReligion = staffReligion;
    }
    public String getStaffPassword() {
        return staffPassword;
    }
    public void setStaffPassword(String staffPassword) {
        this.staffPassword = staffPassword;
    }
    public String getBasicSalary() {
        return basicSalary;
    }
    public void setBasicSalary(String basicSalary) {
        this.basicSalary = basicSalary;
    }

    public static ArrayList<Staff> getStaffList(){
        ArrayList<Staff> staffList = new ArrayList<Staff>();
        try {
            Connection conn = MysqlConnect.ConnectDB();

            String query = "CALL get_Staff_table();";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Staff staffMember = new Staff(rs.getString("staff_reg_no"),rs.getString("staff_name"),rs.getString("staff_email"),rs.getString("staff_date_of_birth"),rs.getString("staff_gender"),rs.getString("staff_nic"),rs.getString("staff_nationality"),rs.getString("staff_religion"),rs.getString("password"),rs.getString("basic_salary"));
                staffList.add(staffMember);
            }
            return staffList;

        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, e.getMessage(), e.getMessage(), 0);
            return null;
        }
    }

    // public static void main(String[] args) {
    //   System.out.println(Staff.getStaffList());  
    // }
    
    
}
