package com.java.src;
import java.sql.*;  
; 

public class MysqlConnection {

	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("com.mysql.jdbc.Driver");  
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/trinion","root","password");  
            System.out.println(con);
        }catch(Exception e){System.out.println(e);}  
        return con;  
    }  
}
