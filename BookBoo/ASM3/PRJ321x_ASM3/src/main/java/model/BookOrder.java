package model;

public class BookOrder {
	private int orderID;
	private int bookID;
	private int amountBook;
	private String bookName;
	
	public BookOrder(int orderID, int bookID, int amountBook, String bookName) {
		super();
		this.orderID = orderID;
		this.bookID = bookID;
		this.amountBook = amountBook;
		this.bookName = bookName;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getBookID() {
		return bookID;
	}

	public void setBookID(int bookID) {
		this.bookID = bookID;
	}

	public int getAmountBook() {
		return amountBook;
	}

	public void setAmountBook(int amountBook) {
		this.amountBook = amountBook;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
	
	
}
