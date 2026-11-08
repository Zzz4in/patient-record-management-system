/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.hms;
import java.sql.*;
import java.util.Scanner;
public class HMS {
        public static void AddPatient(){
            System.out.println("Enter Patient's name: ");
            patient_name = sc.nextLine();
            System.out.println("Enter Patient's phone no: ");
            phone = sc.nextLine();      
            
    }
            static int patient_id;
            static String patient_name;
            static String phone;
   public static Scanner sc = new Scanner(System.in);
    public static void main(String[] args) {
        
        try{
    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hms", "root", "your password");
            Statement st = con.createStatement();
            System.out.println("------PROGRAM MENU-----");
            System.out.println("Enter: \n 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t ");
            int choice = 0;
            OUTER:
            while (choice!=5) {
                choice = Integer.parseInt(sc.nextLine());
                switch (choice) {
                    case 1:
                        AddPatient();
                        PreparedStatement ps = con.prepareStatement("INSERT INTO Patient(patient_name,phone) Values(?,?)");
                        ps.setString(1,patient_name);
                        ps.setString(2, phone);
                        ps.executeUpdate();
                        System.out.println("\n Query Successful.");
                        System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t");
                        break;
                    case 2:
                        ResultSet rs = st.executeQuery("SELECT patient_id,patient_name,phone FROM patient");
                        while(rs.next()){
                            System.out.println(rs.getString("patient_id") + " " + rs.getString("patient_name")+" " +rs.getString("phone"));
                        }
                        System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t ");
                        break;
                    case 3:
                        System.out.println("\n Which patient record would you like to delete? Please enter patient id: ");
                        patient_id = Integer.parseInt(sc.nextLine());
                        ps = con.prepareStatement("DELETE FROM Patient where patient_id = ?");
                        ps.setInt(1,patient_id);
                        int rows = ps.executeUpdate();
                        if (rows == 0){
                            System.out.println("\n No patient with that ID.");
                            System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t");
                            break;
                        }
                        else{
                        System.out.println("\n Query Successful.");
                        System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t");
                        break;
                        }
                    case 4:
                        System.out.println("\n Which patient's phone number would you like to update? Please enter new phone number and existing patient ID: ");
                        phone = sc.nextLine();
                        patient_id = Integer.parseInt(sc.nextLine());
                        ps = con.prepareStatement("UPDATE Patient SET phone = ? WHERE patient_id = ?");
                        ps.setString(1,phone);
                        ps.setInt(2,patient_id);
                        ps.executeUpdate();
                        System.out.println("\nQuery Successful.");
                        System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t");
                        break;
                    case 5:
                        System.out.println("\n End of program.");
                        break OUTER;
                    default:
                        System.out.println("\n Invalid choice");
                        System.out.println("\n Enter 1 to add patients,\n 2 to select all patient details,\n 3 to delete a patient record,\n 4 to update patient record,\n 5 to exit the program: \n\t");
                }
            }
            con.close();
        }
            
            catch(SQLException e){
                    System.out.println(e.getMessage());
                    }
        }
    }
