package com.java.src;
import com.java.beans.*;
import java.sql.*;  
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;  

public class GetUploadFilesList {

	
	public static List<LogFileDetails> getRecords(int start,int total){  
        List<LogFileDetails> list=new ArrayList<LogFileDetails>();  
        try{  
            Connection con=MysqlConnection.getConnection();  
            PreparedStatement ps=con.prepareStatement(  
"select * from UploadedTransactionlogs limit "+(start)+","+total);  
            ResultSet rs=ps.executeQuery();  
            while(rs.next()){  
            	LogFileDetails e=new LogFileDetails();  
                e.setUploadedDate(rs.getString(2));  
                e.setUploadedTime(rs.getString(3));  
                e.setFilePath(rs.getString(4));  
                list.add(e);  
            }  
            con.close();
            Collections.reverse(list);
        }catch(Exception e){System.out.println(e);}  
        return list;  
    }
	public static int getRecordsCount()
	{
		String Countrow="";
		try {
		Connection con=MysqlConnection.getConnection();
		Statement st=con.createStatement();
		String strQuery = "SELECT COUNT(*) FROM UploadedTransactionlogs";
		ResultSet rs = st.executeQuery(strQuery);
		while(rs.next()){
		Countrow = rs.getString(1);
		}
		
		}catch(Exception e){System.out.println(e);}
		
		return Integer.parseInt(Countrow);
	}
}
