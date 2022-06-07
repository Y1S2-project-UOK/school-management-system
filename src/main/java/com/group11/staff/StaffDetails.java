/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package com.group11.staff;

import java.util.ArrayList;

import javax.swing.table.DefaultTableModel;

import com.group11.staff.db.Staff;
import javax.swing.ButtonModel;
import javax.swing.JOptionPane;

/**
 *
 * @author ishan
 */
public class StaffDetails extends javax.swing.JFrame {

    /**
     * Creates new form staffDetails
     */
    public StaffDetails() {
        initComponents();
        loadTableData();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated
    // Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        buttonGroup7 = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        txtStaffNumber = new javax.swing.JTextField();
        txtName = new javax.swing.JTextField();
        txtEmail = new javax.swing.JTextField();
        selectNatinality = new javax.swing.JComboBox<>();
        selectReligion = new javax.swing.JComboBox<>();
        txtPassword = new javax.swing.JPasswordField();
        rbtnMale = new javax.swing.JRadioButton();
        rbtnFemale = new javax.swing.JRadioButton();
        txtNic = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();
        txtBasicSalary = new javax.swing.JTextField();
        jLabel11 = new javax.swing.JLabel();
        txtDateOfBirth = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        tblStaffDetails = new javax.swing.JTable();
        btnAddNew = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        jPanel1.setBackground(new java.awt.Color(20, 70, 137));
        jPanel1.setPreferredSize(new java.awt.Dimension(368, 618));
        jPanel1.addAncestorListener(new javax.swing.event.AncestorListener() {
            public void ancestorAdded(javax.swing.event.AncestorEvent evt) {
                jPanel1AncestorAdded(evt);
            }

            public void ancestorMoved(javax.swing.event.AncestorEvent evt) {
            }

            public void ancestorRemoved(javax.swing.event.AncestorEvent evt) {
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 1, 24)); // NOI18N
        jLabel1.setForeground(new java.awt.Color(255, 255, 255));
        jLabel1.setText("Teacher Details");

        txtStaffNumber.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                txtStaffNumberActionPerformed(evt);
            }
        });

        selectNatinality.setModel(new javax.swing.DefaultComboBoxModel<>(
                new String[] { "Sinhala", "Tamil", "Muslim", "Burgher", "Other" }));
        selectNatinality.setToolTipText("");

        selectReligion.setModel(new javax.swing.DefaultComboBoxModel<>(
                new String[] { "Buddhist", "Hindu", "Islam", "Catholic", "Christian", "Other" }));

        rbtnMale.setBackground(new java.awt.Color(20, 70, 137));
        buttonGroup7.add(rbtnMale);
        rbtnMale.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        rbtnMale.setForeground(new java.awt.Color(255, 255, 255));
        rbtnMale.setText("Male");

        rbtnFemale.setBackground(new java.awt.Color(20, 70, 137));
        buttonGroup7.add(rbtnFemale);
        rbtnFemale.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        rbtnFemale.setForeground(new java.awt.Color(255, 255, 255));
        rbtnFemale.setText("Female");

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setForeground(new java.awt.Color(255, 255, 255));
        jLabel2.setText("Staff Number");

        jLabel3.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel3.setForeground(new java.awt.Color(255, 255, 255));
        jLabel3.setText("Name");

        jLabel4.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel4.setForeground(new java.awt.Color(255, 255, 255));
        jLabel4.setText("Email");

        jLabel5.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel5.setForeground(new java.awt.Color(255, 255, 255));
        jLabel5.setText("Date of Birth");

        jLabel6.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel6.setForeground(new java.awt.Color(255, 255, 255));
        jLabel6.setText("Gender");

        jLabel7.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel7.setForeground(new java.awt.Color(255, 255, 255));
        jLabel7.setText("NIC");

        jLabel8.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel8.setForeground(new java.awt.Color(255, 255, 255));
        jLabel8.setText("Nationility");

        jLabel9.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel9.setForeground(new java.awt.Color(255, 255, 255));
        jLabel9.setText("Religion");

        jLabel10.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel10.setForeground(new java.awt.Color(255, 255, 255));
        jLabel10.setText("Password");

        jLabel11.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel11.setForeground(new java.awt.Color(255, 255, 255));
        jLabel11.setText("Basic Salary");

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(65, 65, 65)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                .addComponent(jLabel6)
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED,
                                                        javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addComponent(rbtnMale, javax.swing.GroupLayout.PREFERRED_SIZE, 63,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(18, 18, 18)
                                                .addComponent(rbtnFemale, javax.swing.GroupLayout.PREFERRED_SIZE, 74,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                .addGap(32, 32, 32))
                                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, jPanel1Layout
                                                .createSequentialGroup()
                                                .addGroup(jPanel1Layout
                                                        .createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addComponent(jLabel5)
                                                                .addGap(30, 30, 30)
                                                                .addComponent(txtDateOfBirth,
                                                                        javax.swing.GroupLayout.PREFERRED_SIZE, 167,
                                                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                .addGap(0, 0, Short.MAX_VALUE))
                                                        .addGroup(jPanel1Layout.createSequentialGroup()
                                                                .addGroup(jPanel1Layout.createParallelGroup(
                                                                        javax.swing.GroupLayout.Alignment.LEADING)
                                                                        .addComponent(jLabel2)
                                                                        .addComponent(jLabel3)
                                                                        .addComponent(jLabel4)
                                                                        .addComponent(jLabel7)
                                                                        .addComponent(jLabel8)
                                                                        .addComponent(jLabel9)
                                                                        .addComponent(jLabel10)
                                                                        .addComponent(jLabel11))
                                                                .addPreferredGap(
                                                                        javax.swing.LayoutStyle.ComponentPlacement.RELATED,
                                                                        javax.swing.GroupLayout.DEFAULT_SIZE,
                                                                        Short.MAX_VALUE)
                                                                .addGroup(jPanel1Layout.createParallelGroup(
                                                                        javax.swing.GroupLayout.Alignment.LEADING)
                                                                        .addComponent(txtBasicSalary,
                                                                                javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                                167,
                                                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                                                        .addGroup(jPanel1Layout.createParallelGroup(
                                                                                javax.swing.GroupLayout.Alignment.TRAILING,
                                                                                false)
                                                                                .addComponent(txtPassword)
                                                                                .addComponent(selectReligion, 0,
                                                                                        javax.swing.GroupLayout.DEFAULT_SIZE,
                                                                                        Short.MAX_VALUE)
                                                                                .addComponent(selectNatinality, 0,
                                                                                        javax.swing.GroupLayout.DEFAULT_SIZE,
                                                                                        Short.MAX_VALUE)
                                                                                .addComponent(txtEmail)
                                                                                .addComponent(txtName)
                                                                                .addComponent(txtStaffNumber)
                                                                                .addComponent(txtNic,
                                                                                        javax.swing.GroupLayout.Alignment.LEADING,
                                                                                        javax.swing.GroupLayout.PREFERRED_SIZE,
                                                                                        167,
                                                                                        javax.swing.GroupLayout.PREFERRED_SIZE)))))
                                                .addGap(20, 20, 20))))
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(105, 105, 105)
                                .addComponent(jLabel1)
                                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)));
        jPanel1Layout.setVerticalGroup(
                jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(jPanel1Layout.createSequentialGroup()
                                .addGap(48, 48, 48)
                                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 44,
                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(txtStaffNumber, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel2))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(txtName, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel3))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(txtEmail, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel4))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel5)
                                        .addComponent(txtDateOfBirth, javax.swing.GroupLayout.PREFERRED_SIZE, 30,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel6)
                                        .addComponent(rbtnMale)
                                        .addComponent(rbtnFemale))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel7)
                                        .addComponent(txtNic, javax.swing.GroupLayout.PREFERRED_SIZE, 31,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel8)
                                        .addComponent(selectNatinality, javax.swing.GroupLayout.PREFERRED_SIZE, 33,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(selectReligion, javax.swing.GroupLayout.PREFERRED_SIZE, 34,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel9))
                                .addGap(20, 20, 20)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(jLabel10)
                                        .addComponent(txtPassword, javax.swing.GroupLayout.PREFERRED_SIZE, 33,
                                                javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addGap(18, 18, 18)
                                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                        .addComponent(txtBasicSalary, javax.swing.GroupLayout.PREFERRED_SIZE, 31,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel11))
                                .addContainerGap(51, Short.MAX_VALUE)));

        tblStaffDetails.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][] {

                },
                new String[] {
                        "Staff Number", "Name", "Email", "Date of Birth", "Gender", "NIC", "Nationality", "Religion",
                        "Password", "Basic Salary"
                }) {
            Class[] types = new Class[] {
                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                    java.lang.String.class, java.lang.String.class
            };
            boolean[] canEdit = new boolean[] {
                    false, false, false, false, false, false, false, false, false, false
            };

            public Class getColumnClass(int columnIndex) {
                return types[columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit[columnIndex];
            }
        });
        tblStaffDetails.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tblStaffDetailsMouseClicked(evt);
            }
        });
        jScrollPane1.setViewportView(tblStaffDetails);

        btnAddNew.setText("Add New");
        btnAddNew.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnAddNewActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE,
                                        javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 814,
                                                Short.MAX_VALUE)
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(btnAddNew)
                                                .addGap(0, 0, Short.MAX_VALUE)))
                                .addContainerGap()));
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE,
                                        javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(0, 0, Short.MAX_VALUE))
                        .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                .addGap(22, 22, 22)
                                .addComponent(btnAddNew)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED,
                                        javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 509,
                                        javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addContainerGap()));

        pack();
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void txtStaffNumberActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_txtStaffNumberActionPerformed
        // TODO add your handling code here:
    }// GEN-LAST:event_txtStaffNumberActionPerformed

    private void tblStaffDetailsMouseClicked(java.awt.event.MouseEvent evt) {// GEN-FIRST:event_tblStaffDetailsMouseClicked
        DefaultTableModel model = (DefaultTableModel) tblStaffDetails.getModel();
        int selectedRowIndex = tblStaffDetails.getSelectedRow();
        txtStaffNumber.setText(model.getValueAt(selectedRowIndex, 0).toString());
        txtName.setText(model.getValueAt(selectedRowIndex, 1).toString());
        txtEmail.setText(model.getValueAt(selectedRowIndex, 2).toString());

        // model.getValueAt(selectedRowIndex, 1).toString();
        // model.getValueAt(selectedRowIndex, 2).toString();
        // Integer.parseInt(model.getValueAt(selectedRowIndex, 4).toString());
        // model.getValueAt(selectedRowIndex, 3).toString();

    }// GEN-LAST:event_tblStaffDetailsMouseClicked

    private void btnAddNewActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_btnAddNewActionPerformed
        String staffNo = txtStaffNumber.getText();
        String staffName = txtName.getText();
        String StaffEmail = txtEmail.getText();
        String dob = txtDateOfBirth.getText();
        String nic = txtNic.getText();
        String gender = null;
        if (rbtnMale.isSelected()) {
            gender = "Male";
        } else if (rbtnFemale.isSelected()) {
            gender = "Female";
        }
        String nationality = selectNatinality.getSelectedItem().toString();
        String religin = selectReligion.getSelectedItem().toString();
        char[] pwdText = txtPassword.getPassword();
        String pwd = new String(pwdText);
        double salary = 0;
        try {
            salary = Integer.parseInt(txtBasicSalary.getText());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        if (!(staffNo.equals("") ||
                staffName.equals("") ||
                StaffEmail.equals("") ||
                dob.equals("") ||
                nic.equals("") ||
                gender.equals("") ||
                religin.equals("") ||
                pwd.equals("") ||
                nationality.equals(""))

        ) {
            boolean status = Staff.addStaffMember(staffNo, staffName, StaffEmail, dob, nic, gender, nationality,
                    religin, pwd, salary);
            if (status) {
                // add data to table
                DefaultTableModel model = (DefaultTableModel) tblStaffDetails.getModel();
                Object[] row = new Object[10];
                row[0] = staffNo;
                row[1] = staffName;
                row[2] = StaffEmail;
                row[3] = dob;
                row[4] = nic;
                row[5] = gender;
                row[6] = nationality;
                row[7] = religin;
                row[8] = pwd;
                row[9] = salary;

                model.addRow(row);
                JOptionPane.showMessageDialog(this, "adding successful");
            }


        } else {
            JOptionPane.showMessageDialog(this, "All fields must not empty");
        }
    }// GEN-LAST:event_btnAddNewActionPerformed

    private void jPanel1AncestorAdded(javax.swing.event.AncestorEvent evt) {// GEN-FIRST:event_jPanel1AncestorAdded
        System.out.println(evt);
    }// GEN-LAST:event_jPanel1AncestorAdded

    private void loadTableData() {
        // load data to the table
        ArrayList<Staff> staffList = Staff.getStaffList();
        DefaultTableModel model = (DefaultTableModel) tblStaffDetails.getModel();
        Object[] row = new Object[10];
        for (int i = 0; i < staffList.size(); i++) {
            row[0] = staffList.get(i).getStaffRegNo() == null ? "-" : staffList.get(i).getStaffRegNo();
            row[1] = staffList.get(i).getStaffName() == null ? "-" : staffList.get(i).getStaffName();
            row[2] = staffList.get(i).getStaffEmail() == null ? "-" : staffList.get(i).getStaffEmail();
            row[3] = staffList.get(i).getStaffDateOfBirth() == null ? "-" : staffList.get(i).getStaffDateOfBirth();
            row[4] = staffList.get(i).getStaffGender() == null ? "-" : staffList.get(i).getStaffGender() == null;
            row[5] = staffList.get(i).getStaffNic() == null ? "-" : staffList.get(i).getStaffNic();
            row[6] = staffList.get(i).getStaffNationality() == null ? "-" : staffList.get(i).getStaffNationality();
            row[7] = staffList.get(i).getStaffReligion() == null ? "-" : staffList.get(i).getStaffReligion();
            row[8] = staffList.get(i).getStaffPassword() == null ? "-" : staffList.get(i).getStaffPassword();
            row[9] = staffList.get(i).getBasicSalary() == null ? "-" : staffList.get(i).getBasicSalary();
            model.addRow(row);
        }

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        // <editor-fold defaultstate="collapsed" desc=" Look and feel setting code
        // (optional) ">
        /*
         * If Nimbus (introduced in Java SE 6) is not available, stay with the default
         * look and feel.
         * For details see
         * http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(StaffDetails.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(StaffDetails.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(StaffDetails.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(StaffDetails.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        }
        // </editor-fold>
        // </editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new StaffDetails().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnAddNew;
    private javax.swing.ButtonGroup buttonGroup7;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel11;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JRadioButton rbtnFemale;
    private javax.swing.JRadioButton rbtnMale;
    private javax.swing.JComboBox<String> selectNatinality;
    private javax.swing.JComboBox<String> selectReligion;
    private javax.swing.JTable tblStaffDetails;
    private javax.swing.JTextField txtBasicSalary;
    private javax.swing.JTextField txtDateOfBirth;
    private javax.swing.JTextField txtEmail;
    private javax.swing.JTextField txtName;
    private javax.swing.JTextField txtNic;
    private javax.swing.JPasswordField txtPassword;
    private javax.swing.JTextField txtStaffNumber;
    // End of variables declaration//GEN-END:variables
}