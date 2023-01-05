package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseContext {
	private String URL = "jdbc:mysql://localhost:3306";
	private String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	private String userName = "root";
	private String password = "tybtrwcM1996";
	
	public Connection connect() throws ClassNotFoundException, SQLException {

		Class.forName(JDBC_DRIVER);
		Connection conn = DriverManager.getConnection(URL, userName, password);
		
		return conn;
	}

}
