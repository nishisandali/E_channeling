/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Eclass;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Eclass.channel;
import java.util.ArrayList;

/**
 *
 * @author Lalendra
 */
public class adminClass {

    // public channel z=new channel();
    public ArrayList getUpcommingChannelSummry() {

        Statement st;
        ResultSet rs = null;
        String Q = "SELECT distinct date,docName,time FROM echanneling.channel where date >= now() order by date ;";
        //String q = "select count(*) from channel where date='"+date+"' and docName='"+doc+"';";
        ArrayList<String[]> List = new ArrayList<>();

        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(Q);
            while (rs.next()) {
                String date = rs.getString(1);
                String doc = rs.getString(2);
                String time = rs.getString(3);
                String currentNumber = Integer.toString(channel.getCurrentNumber(doc, date));
                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{date, doc, time, currentNumber});
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return List;
    }
    public ArrayList getSummryOfChannelByDate(String dt) {

        Statement st;
        ResultSet rs = null;
        String Q = "SELECT distinct docName,time FROM echanneling.channel where  date='"+dt+"' ;";
        //String q = "select count(*) from channel where date='"+date+"' and docName='"+doc+"';";
        ArrayList<String[]> List = new ArrayList<>();

        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(Q);
            while (rs.next()) {
                String doc = rs.getString(1);
                String time = rs.getString(2);
                
                String currentNumber = Integer.toString(channel.getCurrentNumber(doc, dt));
                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{ doc, time, currentNumber});
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return List;
    }

    public ArrayList getAllUsers() {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM user where not uName='admin';";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String fName = rs.getString(3);
                String Email = rs.getString(4);
                String twn = rs.getString(5);
                String mobile = rs.getString(6);
                String gen = rs.getString(7);

                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{fName, Email, twn, mobile, gen});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }

    public ArrayList getAllDoctors() {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM doctorinfo;";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String name = rs.getString(1);
                String sp = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
                String hospital = rs.getString(5);

                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{name, sp, mobile, email, hospital});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }

    public ArrayList getDoctorDetails(String docName) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM doctorinfo where Name='" + docName + "';";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String name = rs.getString(1);
                String sp = rs.getString(2);
                String mobile = rs.getString(3);
                String email = rs.getString(4);
                String hospital = rs.getString(5);

                // System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{name, sp, mobile, email, hospital});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }

    public boolean deleteuser(String val) {
        Statement st;
        ResultSet rs = null;
        String q = "delete FROM user where Email='" + val + "';";
        //ArrayList<String[]> List= new ArrayList<>();
        boolean execute = false;
        try {

            st = dbSetup.getMyConnection().createStatement();
            execute = st.execute(q);

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return execute;
    }

//    public static void main(String[] args) {
//                     adminClass adminobj= new adminClass();
//                         ArrayList<String[]> List1 = new ArrayList<>();
//                                List1 = adminobj.getDoctorDetails("Doc2");
//                                int x= List1.size();
//                               System. out.println(x);
//    }
    public boolean updateDoctor(String docName, String sp, String mob, String email, String Hospital ,String oldName) {
        Statement st;
        ResultSet rs = null;
        String q = "UPDATE doctorinfo SET `Name` = '" + docName + "', `Speciality` = '" + sp + "',`Mobile` ='" + mob + "',`Email` = '" + email + "',`hospital` = '" + Hospital + "' WHERE `Name` = '" + oldName + "';";
        //ArrayList<String[]> List= new ArrayList<>();
        boolean execute = false;
        try {

            st = dbSetup.getMyConnection().createStatement();
            execute = st.execute(q);

        } catch (Exception ex) {
           //System.out.println(ex);
        }

        return execute;

    }

    public boolean addNewYouser(String uname, String psw, String fname, String email, String gen, String mob, String twn) {
      //INSERT INTO `user` (`uName`,`pass`,`fullName`,`email`,`town`,`mobile`,`gender`) VALUES();To change body of generated methods, choose Tools | Templates.
      Statement st;
        ResultSet rs = null;
        String q = "INSERT INTO `user` (`uName`,`pass`,`fullName`,`email`,`town`,`mobile`,`gender`) VALUES('"+uname+"','"+psw+"','"+fname+"','"+email+"','"+twn+"','"+mob+"','"+gen+"');";
//        ArrayList<String[]> List= new ArrayList<>();
      boolean execute = false ;
        try {
            st = dbSetup.getMyConnection().createStatement();
            execute = st.execute(q);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return execute;
    }

    public boolean checkUserNameAv(String uname) {
        Statement st;
        ResultSet rs;
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM `user` WHERE uName='" + uname + "' ");

            return !rs.next();
        } catch (Exception ex) {
            //  System.out.println("err");
        }
        return true;
    }

    public boolean updatDoctorSchedule(String docName, String sun, String mon, String tus, String wed, String thu, String fri, String sat) {
              Statement st;
        ResultSet rs = null;
        String q="UPDATE `docschedule` SET `1` = '"+sun+"',`2` = '"+mon+"',`3` = '"+tus+"',`4` = '"+wed+"',`5` = '"+thu+"' ,`6` = '"+fri+"' ,`7` = '"+sat+"'  WHERE `name` = '"+docName+"' ;";
        //ArrayList<String[]> List= new ArrayList<>();
        boolean execute = true;
        try {

            st = dbSetup.getMyConnection().createStatement();
            execute = st.execute(q);

        } catch (Exception ex) {
          // System.out.println(ex);
        }

        return execute;
    }
    
    
     public ArrayList getAllChannelByDate(String dt) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT docName,uName,time,number FROM echanneling.channel  where date='"+dt+"' order by docName,number;";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String docName = rs.getString(1);
                String uName = rs.getString(2);
                String time = rs.getString(3);
                String number = rs.getString(4);
                
                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{docName, uName, time, number});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }
     public ArrayList getInbox() {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM echanneling.inbox where toU='admin' order by date DESC;";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String from = rs.getString(1);
                String text = rs.getString(3);
                String date = rs.getString(4);
                
                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{date, from, text});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }
     
     
     public ArrayList getSENT() {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM echanneling.inbox where fromU='admin' order by date DESC;";
        ArrayList<String[]> List = new ArrayList<>();
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                String to = rs.getString(2);
                String text = rs.getString(3);
                String date = rs.getString(4);
                
                //System.out.println(string+string1+string2+currentNumber);
                List.add(new String[]{date, to, text});
            }

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return List;

    }

}
