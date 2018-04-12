/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Eclass;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lalendra
 */
public class channel {
    public static boolean addChanel(String date,String uName,String doc,String time,int num){
         Statement st;
        ResultSet rs = null;
        String q = "INSERT INTO channel(`date`,`uName`,`docName`,`time`,`number`)VALUES('"+date+"','"+uName+"','"+doc+"','"+time+"',"+num+");";
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
    
     public static int getCurrentNumber(String doc,String date) {
        Statement st;
        ResultSet rs = null;
        String q = "select count(*) from channel where date='"+date+"' and docName='"+doc+"';";
//        ArrayList<String[]> List= new ArrayList<>();
        int num = 0;
        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
            while (rs.next()) {
                num = rs.getInt(1);

            }

        } catch (SQLException e) {
            System.out.println(e);
        }

        return num;

    }
     
        public ResultSet getChannelHistory(String uName) {
        Statement st = null;
        ResultSet rs = null;
        String q = "SELECT c.date,c.docName,d.Speciality,c.time,c.number FROM channel c join doctorinfo d on d.Name=c.docName where uName='"+uName+"' order by date DESC;";

        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
        } catch (SQLException ex) {
            Logger.getLogger(user.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
        }
        public ResultSet getChannelHistory() {
        Statement st = null;
        ResultSet rs = null;
        String q = "SELECT c.date,c.docName,d.Speciality,c.time,c.number FROM channel c join doctorinfo d on d.Name=c.docName order by date DESC;";

        try {
            st = dbSetup.getMyConnection().createStatement();
            rs = st.executeQuery(q);
        } catch (SQLException ex) {
            Logger.getLogger(user.class.getName()).log(Level.SEVERE, null, ex);
        }

        return rs;
        }
     
}
