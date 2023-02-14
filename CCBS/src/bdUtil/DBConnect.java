package bdUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	
	public static Connection openconnection() {
//		connect database
//		using standard JDBC
		
		Connection conn = null;
		
		String dbUrl = "jdbc:mysql://localhost:3306/ccbs";
		String username = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, username, password);
			System.out.println("connection successfully opened : " + conn.getMetaData());

		}catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
		}
			
		return conn;
	}
}
