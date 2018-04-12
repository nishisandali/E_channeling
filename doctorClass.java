package Eclass;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import Eclass.dbSetup;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Lalendra
 */
public class doctorClass {

    public ResultSet getDocInfo() {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM doctorinfo;";
//        ArrayList<String[]> List= new ArrayList<>();
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
//         while (rs.next()) {                
//                 String Doc=rs.getString(1);
//                String Speciality=rs.getString(2);
//                String Mobile=rs.getString(3);
//                String Email=rs.getString(4);
//                String hospital=rs.getString(5);
//                //Name, Speciality, Mobile, Email, hospital
//                List.add(new String[]{Doc,Speciality,mon,tus,wed,thu,fri,sat});
//            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        //System.out.println("check");
        return rs;

    }

    public ArrayList getScheduleInfo() {
        Statement st;
        ResultSet rs;
        String q = "SELECT s.*,i.Speciality FROM docschedule s join doctorinfo i on s.name=i.Name;";
        ArrayList<String[]> List = new ArrayList<>();
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String Doc = rs.getString(1);
                String sun = rs.getString(2);
                String mon = rs.getString(3);
                String tus = rs.getString(4);
                String wed = rs.getString(5);
                String thu = rs.getString(6);
                String fri = rs.getString(7);
                String sat = rs.getString(8);
                String Speciality = rs.getString(9);
                List.add(new String[]{Doc, Speciality, sun, mon, tus, wed, thu, fri, sat});
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        //System.out.println("check");
        return List;
    }

    public ArrayList getScheduleInfo(String doc) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT s.*,i.Speciality FROM docschedule s join doctorinfo i on s.name=i.Name where i.Name='" + doc + "';";
        ArrayList<String[]> List = new ArrayList<>();
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String Doc = rs.getString(1);
                String sun = rs.getString(2);
                String mon = rs.getString(3);
                String tus = rs.getString(4);
                String wed = rs.getString(5);
                String thu = rs.getString(6);
                String fri = rs.getString(7);
                String sat = rs.getString(8);
                String Speciality = rs.getString(9);
                List.add(new String[]{Doc, Speciality, sun, mon, tus, wed, thu, fri, sat});
            }
//        
        } catch (SQLException e) {
            System.out.println(e);
        }
        //System.out.println("check");
        return List;
    }

    public static ResultSet checkAvDate(String doc, int day) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT  docschedule." + day + " FROM docschedule  where name='" + doc + "' ;";
//        ArrayList<String[]> List= new ArrayList<>();
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
        } catch (SQLException e) {
            System.out.println(e);
        }
        //System.out.println("check");
        return rs;

    }
    
    
     public ArrayList getUpCommingChannel(String uName) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT distinct date,time,docName,number FROM echanneling.channel where uName='"+uName+"' and date >=now()  ;";
        ArrayList<String[]> List = new ArrayList<>();
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String date = rs.getString(1);
                String time = rs.getString(2);
                String doc = rs.getString(3);
                String num = rs.getString(4);
             
                
                List.add(new String[]{date, time, doc, num});
            }
//        
        } catch (SQLException e) {
            System.out.println(e);
        }
        //System.out.println("check");
        return List;
    }

   

//    public static void main(String[] args) throws SQLException {
//        int currentNumber = getCurrentNumber("Doctor1","2016-04-27");
//        System.out.println(currentNumber);
//    }

}
