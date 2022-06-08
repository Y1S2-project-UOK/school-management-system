/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.group11.Student.db;

import com.group11.config.MysqlConnect;
import com.group11.staff.db.Staff;
import com.mysql.cj.jdbc.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author hp
 */
public class Student {
    
    private String studentRegNo;
    private String studentName;
    private String studentEmail;
    private String studentDOB;
    private String studentGender;
    private String studentAddress;
    private String studentNationality;
    private String studentReligion;
    private String studentPassword;
    private String studentGuardianID;

    public Student(String studentRegNo, String studentName, String studentEmail, String studentDOB, String studentGender, String studentAddress, String studentNationality, String studentReligion, String studentPassword, String studentGuardianID) {
        this.studentRegNo = studentRegNo;
        this.studentName = studentName;
        this.studentEmail = studentEmail;
        this.studentDOB = studentDOB;
        this.studentGender = studentGender;
        this.studentAddress = studentAddress;
        this.studentNationality = studentNationality;
        this.studentReligion = studentReligion;
        this.studentPassword = studentPassword;
        this.studentGuardianID = studentGuardianID;
    }

      public String getStudentRegNo() {
        return studentRegNo;
    }

    public void setStudentRegNo(String studentRegNo) {
        this.studentRegNo = studentRegNo;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getStudentDOB() {
        return studentDOB;
    }

    public void setStudentDOB(String studentDOB) {
        this.studentDOB = studentDOB;
    }

    public String getStudentGender() {
        return studentGender;
    }

    public void setStudentGender(String studentGender) {
        this.studentGender = studentGender;
    }

    public String getStudentAddress() {
        return studentAddress;
    }

    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress;
    }

    public String getStudentNationality() {
        return studentNationality;
    }

    public void setStudentNationality(String studentNationality) {
        this.studentNationality = studentNationality;
    }

    public String getStudentReligion() {
        return studentReligion;
    }

    public void setStudentReligion(String studentReligion) {
        this.studentReligion = studentReligion;
    }

    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public String getStudentGuardianID() {
        return studentGuardianID;
    }

    public void setStudentGuardianID(String studentGuardianID) {
        this.studentGuardianID = studentGuardianID;
    }
    
    public static ArrayList<Student> getStudentList() {
        ArrayList<Student> studentList = new ArrayList<>();
        try {
            Connection conn = MysqlConnect.ConnectDB();

            String query = "CALL get_Studend_table();";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Student student = new Student(rs.getString("student_admission_no"),rs.getString("student_name"), rs.getString("student_email"), rs.getString("student_date_of_birth"), rs.getString("gender"),rs.getString("student_address"),rs.getString("student_nationality"),  rs.getString("student_religion"), rs.getString("student_password"),rs.getString("guardian_id"));
                studentList.add(student);
            }
            return studentList;

        } catch (Exception e) {

            JOptionPane.showMessageDialog(null, e.getMessage(), e.getMessage(), 0);
            return null;
        }
    }
    
    public static boolean addStudent(
            String studentNo,
            String gender,
            String address,
            String dob,
            String email,
            String name,
            String nationality,          
            String pwd,
            String religion,
            String guardianID
            ) {
        try {
            Connection conn = MysqlConnect.ConnectDB();
            System.out.println("gender: " + gender);
            System.out.println("guardian id: " + guardianID);
            System.out.println("address: " + address);
             //validate staff member
            String query = "CALL add_student(?,?,?,?,?,?,?,?,?,?);";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);
            stmt.setString(1, studentNo);
            stmt.setString(2, gender);
            stmt.setString(3, address);
            stmt.setString(4, dob);
            stmt.setString(5, email);
            stmt.setString(6, name);
            stmt.setString(7, nationality);
            stmt.setString(8, pwd);
            stmt.setString(9, religion);
            stmt.setString(10, "123");
            System.out.println(stmt.execute());
            conn.close();
            return true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 1);
            return false;
        }
    }
    
     public static boolean updateStudent(
            String studentNo,
            String gender,
            String address,
            String dob,
            String email,
            String name,
            String nationality,          
            String pwd,
            String religion,
            String guardianID
            ) {
        try {
            Connection conn = MysqlConnect.ConnectDB();
            System.out.println("gender: " + gender);
            System.out.println("guardian id: " + guardianID);
            System.out.println("address: " + address);
             //validate staff member
            String query = "CALL update_student(?,?,?,?,?,?,?,?,?,?);";
            CallableStatement stmt = (CallableStatement) conn.prepareCall(query);
            stmt.setString(1, studentNo);
            stmt.setString(2, gender);
            stmt.setString(3, address);
            stmt.setString(4, dob);
            stmt.setString(5, email);
            stmt.setString(6, name);
            stmt.setString(7, nationality);
            stmt.setString(8, pwd);
            stmt.setString(9, religion);
            stmt.setString(10, guardianID);
            System.out.println(stmt.execute());
            conn.close();
            return true;
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, e.getMessage(), "", 1);
            return false;
        }
    }
    
}
