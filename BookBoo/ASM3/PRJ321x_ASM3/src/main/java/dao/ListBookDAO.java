package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import context.DatabaseContext;
import model.Books;

public class ListBookDAO {
	
	public List<Books> search(String searchInput) throws ClassNotFoundException, SQLException{
		List<Books> listBooks = new ArrayList<>();
		
		DatabaseContext DBconnector = new DatabaseContext();
		Connection conn =  (Connection)DBconnector.connect();

		Statement stmt = (Statement)conn.createStatement();
		String MySQLQuery = "SELECT * FROM bookboo_csdl.books WHERE name LIKE '%" 
						+ searchInput + "%'" + "OR author LIKE '%" + searchInput + "%'";
		ResultSet rs = stmt.executeQuery(MySQLQuery);
		while(rs.next()) {
			Books book = new Books();
			book.setID(rs.getString(1));
			book.setName(rs.getString(2));
			book.setAuthor(rs.getString(3));
			book.setPrice(rs.getFloat(4));
			book.setPromo_price(rs.getFloat(5));
			book.setQuantity_in_stock(rs.getInt(6));
			book.setDescription(rs.getString(7));
			book.setPublisher(rs.getString(8));
			book.setPublished_date(rs.getDate(9));
			book.setPage(rs.getInt(10));
			book.setLanguage(rs.getString(11));
			book.setType(rs.getString(12));
			book.setImgLink(rs.getString(13));
			
			if(book != null) {
				listBooks.add(book);
			}
			
		}
	
		return listBooks;
	}
	
	public Books getBooks(String bookID) throws ClassNotFoundException, SQLException {
		Books result = new Books();
		
		DatabaseContext DBconnector = new DatabaseContext();

		Statement stmt = DBconnector.connect().createStatement();
		String MySQLQuery = "SELECT * FROM bookboo_csdl.books WHERE id='" + bookID + "';";
		ResultSet rs = stmt.executeQuery(MySQLQuery);
		
		while(rs.next()) {
			result.setID(rs.getString(1));
			result.setName(rs.getString(2));
			result.setAuthor(rs.getString(3));
			result.setPrice(rs.getFloat(4));
			result.setPromo_price(rs.getFloat(5));
			result.setQuantity_in_stock(rs.getInt(6));
			result.setDescription(rs.getString(7));
			result.setPublisher(rs.getString(8));
			result.setPublished_date(rs.getDate(9));
			result.setPage(rs.getInt(10));
			result.setLanguage(rs.getString(11));
			result.setType(rs.getString(12));
			result.setImgLink(rs.getString(13));
			
		}
		
		return result;
	}
}
