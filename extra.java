/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Eclass;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lalendra
 */
public class extra {
    public static int getDayOfWeek(String dt){
        String[] split = dt.split("-");
        String x=""+split[1]+"/"+split[2]+"/"+split[0];
        System.out.println(x);
        Date date = new Date(x);
       // System.out.println(date);
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        System.out.println(dayOfWeek);
        return dayOfWeek;
    }
    
    public static boolean chechWithCurrentDate(String date){
//        String date="2016-04-24";
        
      DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date x = new java.util.Date();
        String y = dateFormat.format(x);
//        out.println(y);
        java.util.Date z = null;
        try {
            z = dateFormat.parse(y);
        } catch (ParseException ex) {
           // Logger.getLogger(channelDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
//        out.println(z);
        boolean before = false;
        try {
            before = z.before(dateFormat.parse(date));
        } catch (ParseException ex) {
         //   Logger.getLogger(channelDoc.class.getName()).log(Level.SEVERE, null, ex);
        }
//        System.out.println(before);
    return before;
            
    }
    
//    public static void main(String[] args) {
////        String date="2016-04-20";
////        extra.getDayOfWeek(date);
//        chechWithCurrentDate("2016-04-25");
//    }
}
