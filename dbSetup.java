/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Eclass;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



//jdbc:mysql://127.0.0.1:3306/?user=root
public class dbSetup  {
      private static Connection con;
    
    public static  Connection getMyConnection(){
        try{
       Class.forName("com.mysql.jdbc.Driver");
       con =DriverManager.getConnection("jdbc:mysql://localhost:3306/echanneling","root","");  
        }
        catch(ClassNotFoundException | SQLException e){
            System.out.println("SQL erro"+e);
        }
        return con;
    }
    
}
