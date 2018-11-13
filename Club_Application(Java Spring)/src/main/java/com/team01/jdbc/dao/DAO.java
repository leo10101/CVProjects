package com.team01.jdbc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class DAO {
	private Connection con;
	private String database = "jdbc:mysql://localhost:3306/sa46team01cab?SSL=fa";
	private String username = "root";
	private String password = "password";
	private String username2 = "user";
	private String password2 = "password";

	private Statement statement;
	
	private ArrayList<String> queryHashMapKeys; //this will be the HM keys relating to each DTO obj's records
	private ArrayList<HashMap> queryHashMapArrayList; //this will be the DTO obj - containing an ArrayList of targetted entity
	private ArrayList<String> queryAttributeTypeArrayList; //this will be the attribute type of each attribute
	
	private static DAO daoInstance; //return the DAO instance, DAO is a singleton and can only have one instance
	
	public Connection getCon() {
		return con;
	}

	public Statement getStatement() {
		return statement;
	}

	public ArrayList<String> getQueryHashMapKeys() {
		return queryHashMapKeys;
	}

	public ArrayList<HashMap> getQueryHashMapArrayList() {
		return queryHashMapArrayList;
	}

	public ArrayList<String> getQueryAttributeTypeArrayList() {
		return queryAttributeTypeArrayList;
	}

	public static DAO getDaoInstance() {
		return daoInstance;
	}

	protected DAO() throws ClassNotFoundException {
		// step 1 - load driver
		Class.forName("com.mysql.jdbc.Driver");
		
		//instantiate class attributes
		queryHashMapKeys = new ArrayList<String>();
		queryHashMapArrayList = new ArrayList<HashMap>();
		queryAttributeTypeArrayList = new ArrayList<String>();
		daoInstance = this;
	}

	public int NonQuery(String command) throws SQLException {
		// step 2 - establish connection through driver
		try {
		con = DriverManager.getConnection(database, username, password);
		} catch(SQLException e) {
			con = DriverManager.getConnection(database, username2, password2);
		}
		// step 3 - create statement
		statement = con.createStatement();
		// step 4 - update DB
		int status = statement.executeUpdate(command);

		// step 5 - close statement and connection
		statement.close();
		con.close();

		return status;
	}
	
	//this will return in ArrayList<HashMap> which contains an arraylist of the results
	//the HashMap uses the column name as the key and its value can be queried as follows
	public ArrayList<HashMap> Query(String command) throws SQLException {
		//as this DAO class is a singleton, new queries will clear all the class member's values
		//and reuse the class's member to reduce memory requirement
		queryHashMapKeys.clear();
		queryHashMapArrayList.clear();
		queryAttributeTypeArrayList.clear();
		
		// step 2 - establish connection through driver
		try {
		con = DriverManager.getConnection(database, username, password);
		} catch(SQLException e) {
			con = DriverManager.getConnection(database, username2, password2);
		}
		// step 3 - create statement
		statement = con.createStatement();
		// step 4 - query from db and populate to ResultSet obj
		ResultSet rs = statement.executeQuery(command);

		// get meta-data
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		
		//get column types ArrayList and column name as HashMap keys
		for(int i = 1; i <= columnCount; i++) {
			queryAttributeTypeArrayList.add(rsmd.getColumnClassName(i));
			queryHashMapKeys.add(rsmd.getColumnName(i));
		}

		
		// populate data into ArrayList where HashMap defines the row (search col by key)
		while (rs.next()) {
			HashMap<String, Object> studentHMRow = new HashMap<String, Object>(columnCount);
			for (int i = 1; i <= columnCount; i++) {			
				studentHMRow.put(rsmd.getColumnName(i), rs.getObject(i)); //create student data row in HashMap
			}
			
			//adds respective row to queryArrayLists
			queryHashMapArrayList.add(studentHMRow);
		}
		
		// step 5 - close statement and connection
		statement.close();
		con.close();
		
		return queryHashMapArrayList;
	}
	
	//this is used for displaying the output in a console
	//it will display the arraylist items according to its column name and data type
	public void showDTO() {
		try {
			for (int i = 0; i < this.queryHashMapArrayList.size(); i++) {
				for (int k = 0; k < this.queryHashMapKeys.size(); k++) {
					System.out.println("Class type: " + this.queryAttributeTypeArrayList.get(k));
					System.out.print(this.queryHashMapKeys.get(k) + ": ");
					System.out.println(this.queryHashMapArrayList.get(i).get(this.queryHashMapKeys.get(k)));
				}
				System.out.println("");
			} 
		} catch (NullPointerException e) {
			System.out.println(e.getClass() + "\n" + e.getMessage());
			System.out.println(e.getCause());
		} catch (Exception e) {
			System.out.println(e.getClass() + "\n" + e.getMessage());
			System.out.println(e.getCause());
		}
	}
	
	//the DAO class follows the concept of a singleton, only one instance can exist
	//this reduces the memory requirements if more than one query is executed
	public static DAO factoryCreate() throws ClassNotFoundException {
		if(daoInstance == null) return new DAO();
		else return daoInstance;
	}
}