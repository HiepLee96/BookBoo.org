package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import context.DatabaseContext;
import controller.Account;

public class UsersDAO {
	
	public Account searchUser(String userEmail, String password) throws ClassNotFoundException, SQLException {
		Account account = new Account();
		
		DatabaseContext DC = new DatabaseContext();
		Connection conn = (Connection)DC.connect();
		Statement stmt = (Statement)conn.createStatement();
		String MySQLQuery = "SELECT * FROM bookboo_csdl.account WHERE user_email LIKE '" +
							userEmail + "' AND password LIKE '" + 
							password + "';";
		ResultSet rs = stmt.executeQuery(MySQLQuery);
		while(rs.next()) {
			account.setUser(rs.getString(1));
			account.setPassword(rs.getString(2));
			account.setName(rs.getString(3));
			account.setAddress(rs.getString(4));
			account.setPhone(rs.getString(5));
			account.setRole(1);
		}
		
		return account;
	}
}
