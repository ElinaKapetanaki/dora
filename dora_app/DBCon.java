package dora_app;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBCon {  

	/* Database connection settings, change dbName, dbusername, dbpassword */
	private final String dbServer = "195.251.249.131";
	private final String dbServerPort = "3306";
	private final String dbName = "ismgroup71";
	private final String dbusername = "ismgroup71";
	private final String dbpassword = "esr$s0";

	Connection dbcon = null;

   public Connection getConnection() throws Exception {

		try {

			// Dynamically load the driver's class file into memory
			Class.forName("com.mysql.jdbc.Driver").newInstance();

		} catch (Exception e) {

			throw new Exception("MySQL Driver error: " + e.getMessage());
		}

		/*
		 * Step 2 -> Establish a connection with the database and initializes
		 * the Connection object (con)
		 */

		try {

			dbcon = DriverManager.getConnection("jdbc:mysql://" 
				+ dbServer + ":" + dbServerPort + "/" + dbName, dbusername, dbpassword);

			// Step 3 -> returns the connection object
			return dbcon;

		} catch (Exception e) {
			
			// throw Exception if any error occurs
			throw new Exception("Could not establish connection with the Database Server: " 
				+ e.getMessage());
		}

	} // End of getConnection

    /**
	 * Close database connection. 
	 * 
	 * @throws SQLException
	 */
	public void close(Connection dbcon) throws SQLException {

		try {

			// if connection is (still) open
			if (dbcon != null)
				dbcon.close(); // close the connection to the database to end database session

		} catch (SQLException e) {

			throw new SQLException("Could not close connection with the Database Server: " 
				+ e.getMessage());
		}

	}// end of close

} // End of class
