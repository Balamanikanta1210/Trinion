package com.java.beans;

import java.io.FileReader;
import java.io.LineNumberReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class DemoClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String filename = "C:\\Users\\Nani\\Desktop\\AP_Base1_VSDC_F55_Iss All_21112007";
		try {
			String line;
			int hundKey = 0, onetenKey = 0;
			String RecordContent = "";
			String STANNumber="";
			String responseCode="";
			Map<String, String> hunderedtrans = new HashMap<String, String>();
			Map<String, List<String>> onetentrans = new HashMap<String, List<String>>();
			Map<String,String> approvedtrans=new HashMap<String,String>();
			LineNumberReader r = new LineNumberReader(new FileReader(filename));
			while ((line = r.readLine()) != null) {
				String lineWithoutSpaces = line.replaceAll("\\s+", "");
				if (lineWithoutSpaces.contains("Message:") && lineWithoutSpaces.contains("Auth0100")) {
					// System.out.println("Word found at line " + r.getLineNumber());
					// System.out.println(line);
					for (int i = 0; i < 3; i++)
						r.readLine();

					while ((line = r.readLine()) != null
							&& !(lineWithoutSpaces = line.replaceAll("\\s+", "")).contains("TransactionDate&Time:")) {
						if (lineWithoutSpaces.contains("SystemTraceAuditNumber")) {
							STANNumber=lineWithoutSpaces.substring(lineWithoutSpaces.length() - 6);
						}
						RecordContent = RecordContent + line + "\n";
					}
					if (!RecordContent.equals("")) {
						hunderedtrans.put(STANNumber, RecordContent);
						RecordContent = "";
					}
				}

				if (lineWithoutSpaces.contains("Message:") && lineWithoutSpaces.contains("Auth0110")) {
					System.out.println("Word found at line " + r.getLineNumber());
					System.out.println(line);
					for (int i = 0; i < 3; i++)
						r.readLine();
					while ((line = r.readLine()) != null
							&& !(lineWithoutSpaces = line.replaceAll("\\s+", "")).contains("TransactionDate&Time:")) {
						if (lineWithoutSpaces.contains("SystemTraceAuditNumber")) {
							STANNumber=lineWithoutSpaces.substring(lineWithoutSpaces.length() - 6);
						}
						if (lineWithoutSpaces.contains("ResponseCode")) {
							responseCode=lineWithoutSpaces.substring(lineWithoutSpaces.length() - 2);
						}
						RecordContent = RecordContent + line + "\n";
					}
					if (!RecordContent.equals("")) {
						List<String> trans = new ArrayList<String>();
						trans.add(RecordContent);
						trans.add(responseCode);
						onetentrans.put(STANNumber,trans);
						RecordContent = "";
					}
				}

			}
	        for(Map.Entry<String, List<String>> data:onetentrans.entrySet())
	        {
	        	if(data.getValue().get(1).equals("00"))
	        	{
	        		approvedtrans.put(data.getKey(), data.getValue().get(0));
	        	}
	        	System.out.println("Entry key"+data.getKey());
	        	System.out.println("Entry Value"+data.getValue().get(1));
	        }
			System.out.println(onetentrans.keySet());
			System.out.println(hunderedtrans.keySet());
			System.out.println(approvedtrans.keySet());
		} catch (Exception e) {
			// TODO: handle exception
		}
		finally {
		
		}
	}

}
