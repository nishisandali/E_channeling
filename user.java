/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Eclass;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lalendra
 */
public class user {

    private String un;
    private String pw;

    public user(String n, String p) {
        un = n;
        pw = p;
    }
    public  user(){
    }

    public boolean checkUnAndPw() {
        return check();

    }

    private boolean check() {
        Statement st;
        ResultSet rs;
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery("SELECT * FROM `user` WHERE uName='" + un + "' ");

            if (rs.next()) {
                String tmppw = rs.getString("pass");
                if (tmppw.equals(pw)) {
                    return true;
                }
            }

        } catch (Exception ex) {
           // System.out.println("err");
        }

        return false;
    }
    
    public  ResultSet  getUserDetails(String uName){
             Statement st;
        ResultSet rs = null;
        String q="SELECT * FROM user where uName='"+uName+"';";
        try {

            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);

          

        } catch (Exception ex) {
//            System.out.println("err");
        }

        return rs;
    }
    
    
    public boolean changeUserPw(String uName,String pass){
        Statement st;
        ResultSet rs = null;
        String q = "update user set pass='"+pass+"' where uName='"+uName+"';";
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
    public boolean updateUserDetalis(String uName,String fName, String email,String twn,String mob,String gen){
        Statement st;
        ResultSet rs = null;
        String q = "UPDATE user SET fullName = '"+fName+"',email ='"+email+"',town = '"+twn+"',mobile = '"+mob+"',gender ='"+gen+"' WHERE uName ='"+uName+"';";
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
    public boolean sendNewMSG(String fromx,String toX,String text ){
        Statement st;
        ResultSet rs = null;
        String q="insert into inbox value ('"+fromx+"','"+toX+"','"+text+"',Now() )";
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
    
    public ArrayList getInbox(String Uname) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM echanneling.inbox where toU='"+Uname+"' order by date DESC;";
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
    
     public ArrayList getSENT(String Uname) {
        Statement st;
        ResultSet rs = null;
        String q = "SELECT * FROM echanneling.inbox where fromU='"+Uname+"' order by date DESC;";
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


