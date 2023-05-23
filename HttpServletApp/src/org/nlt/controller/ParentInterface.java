package org.nlt.controller;

import java.sql.Connection;
import java.sql.DriverManager;


    public interface ParentInterface {
    public static Connection con=getConnection();

    public static Connection getConnection() {
      try {
    	  
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb","root","");

	return con;
          } catch (Exception e) {
	                System.out.println("Connectivity Issue");
	               return null;
         }
	
       }
 }
