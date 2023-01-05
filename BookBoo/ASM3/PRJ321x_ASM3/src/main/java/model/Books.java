package model;

import java.sql.Date;

public class Books {
	private String ID;
	private String name;
	private String author;
	private float price;
	private float promo_price;
	private int quantity_in_stock;
	private String description;
	private String publisher;
	private Date published_date;
	private int page;
	private String language;
	private String type;
	private String imgLink;
	private int numberInCart = 1;
	
	public Books() {
		
	};
	public Books(String ID, String name, String author, float price, float promo_price, int quantity_in_stock,
			String description, String publisher, Date published_date, int page, String language, String type,
			String imgLink) {
		super();
		this.ID = ID;
		this.name = name;
		this.author = author;
		this.price = price;
		this.promo_price = promo_price;
		this.quantity_in_stock = quantity_in_stock;
		this.description = description;
		this.publisher = publisher;
		this.published_date = published_date;
		this.page = page;
		this.language = language;
		this.type = type;
		this.imgLink = imgLink;
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public float getPromo_price() {
		return promo_price;
	}
	public void setPromo_price(float promo_price) {
		this.promo_price = promo_price;
	}
	public int getQuantity_in_stock() {
		return quantity_in_stock;
	}
	public void setQuantity_in_stock(int quantity_in_stock) {
		this.quantity_in_stock = quantity_in_stock;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public Date getPublished_date() {
		return published_date;
	}
	public void setPublished_date(Date published_date) {
		this.published_date = published_date;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getImgLink() {
		return imgLink;
	}
	public void setImgLink(String imgLink) {
		this.imgLink = imgLink;
	}

	public int getNumberInCart() {
		return numberInCart;
	}

	public void setNumberInCart(int numberInCart) {
		this.numberInCart = numberInCart;
	}
	
}
