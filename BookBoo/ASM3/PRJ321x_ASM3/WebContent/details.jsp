<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
    
 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookly: Free delivery worldwide on over 20 milion books</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/style.css">
</head>

<!-- Truy van du lieu de hien thi chi tiet san pham -->
<sql:setDataSource
	var="myDS01"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306"
	user="root" password="tybtrwcM1996"
 />
 <sql:query var="bookDetails" dataSource="${myDS01}">
    SELECT * FROM bookboo_csdl.books WHERE id LIKE '<c:out value="${param.bookIDne }"></c:out>';
</sql:query>

<!-- Truy van du lieu de hien thi danh sach cac san pham giong nhu index.jsp -->
<sql:setDataSource
	var="myDS02"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306"
	user="root" password="tybtrwcM1996"
 />
 <sql:query var="list_books" dataSource="${myDS02}">
    SELECT * FROM bookboo_csdl.books;
</sql:query>

<body>
	<%@include file="header.jsp" %>

	<c:forEach var="book" items="${bookDetails.rows }">
		<section class="detail-container">
			<div class="col-1">
				<img src="${book.image }" alt="">
			</div>
			<div class="col-2">
				<h1 class="books-name">${book.name }</h1>
				<h4 class="author">
					${book.author } <span>(Author)</span>
				</h4>
				<p>FORMAT</p>
				<div class="box">
					<p class="book-type">${book.type }</p>
					<div class="book-price">
						<p class="price">$${book.price }</p>
						<p>$${book.promo_price }</p>
					</div>
				</div>
				<a >
					<span>PRE-ORDER </span> SHIPS FEB 07, 2023
				</a>
				<div class="orders-buttons">
					<a href="AddToController?bookID=${book.id }&action=add" class="btn">PRE-ORDER</a> <a href="#" class="btn">ADD
						TO WISHLIST</a>
				</div>
				<p class="get-audio-book">GET THE AUDIO BOOK</p>
				<div class="description-area">
					<h2>Description</h2>
					<p class="content">${book.description }</p>
				</div>
				<h2 class="product-detail-h2">Product Detail</h2>
				<div class="product-details">
					<div class="col-1">
						<p>Price</p>
						<p>Publisher</p>
						<p>Publish Date</p>
						<p>Pages</p>
						<p>Language</p>
						<p>Type</p>
					</div>
					<div class="col-2">
						<p class="price">
							$${book.price } <span>$${book.promo_price }</span>
						</p>
						<p>${book.publisher }</p>
						<p>${book.published_date}</p>
						<p>${book.page }</p>
						<p>${book.language }</p>
						<p>${book.type }</p>
					</div>
				</div>
				<div class="about-the-author">
					<h2>About the Author</h2>
					<p class="content">Salman Rushdie is the author of fourteen
						previous novels, including Midnight's Children (for which he won
						the Booker Prize and the Best of the Booker), Shame, The Satanic
						Verses, The Moor's Last Sigh, and Quichotte, all of which have
						been shortlisted for the Booker Prize; a collection of stories,
						East, West; a memoir, Joseph Anton; a work of reportage, The
						Jaguar Smile; and three collections of essays, most recently
						Languages of Truth. His many awards include the Whitbread Prize
						for Best Novel, which he won twice; the PEN/Allen Foundation
						Literary Service Award; the National Arts Award; the French Prix
						du Meilleur Livre Étranger; the European Union's Aristeion Prize
						for Literature; the Budapest Grand Prize for Literature; and the
						Italian Premio Grinzane Cavour. He is a member of the American
						Academy of Arts and Letters and a fellow of the American Academy
						of Arts and Sciences, and he is a Distinguished Writer in
						Residence at New York University. He is a former president of PEN
						America. His books have been translated into over forty languages.</p>
				</div>
			</div>
		</section>

	</c:forEach>


	
	<!--FEATURED SECTION starts-->
    <section class="featured" id="featured">
        <h1 class="heading"><span>featured books</span></h1>
        <div class="swiper featured-slider">
            <div class="swiper-wrapper">
            	<c:forEach var="books" items="${list_books.rows}"> 
    				<div class="swiper-slide box">
						<div class="icons">
							<a href="#" class="fas fa-search"></a>
							 <a href="#" class="fas fa-heart"></a>
							 <a href="details.jsp?bookIDne=${books.id }" class="fas fa-eye"></a>
						</div>
						<div class="image">
							<img src="${books.image}" alt="">
						</div>
						<div class="content">
							<h3>${books.name }</h3>
							<div class="price">
								$${books.promo_price}<span>$${books.price}</span>
							</div>
							<a href="#" class="btn">add to cart</a>
						</div>
					</div>
				</c:forEach>
           
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </section>
    <!--FEATURED SECTION ends-->

	<!-- NEWSLETTER SECTION starts -->
	<section class="newsletter">
		<form action="">
			<h3>subscribe for lastest updates</h3>
			<input type="email" name="" placeholder="enter your email" id=""
				class="input-box"> <input type="submit" value="subscribe"
				class="btn">
		</form>
	</section>
	<!-- NEWSLETTER SECTION ends -->

	<%@include file="footer.jsp" %>

    <!-- LOADER -->
    <!--
    <div class="loader-container">
        <img src="./assets/image/loader-img.gif" alt="">
    </div>
    -->
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="./assets/js/index.js"></script>
</body>
</html>