<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="model.Books"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
    
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
<body>
	<%@include file="header.jsp" %>

	<section class="search-result">
		<h1 class="number-of-result">
			<!-- 3. Su dung EL de luu tru du lieu nhap vao tren search form -->
			<c:out value="${resultBooks.size() }"></c:out> results for "<span><c:out value='${map1["searched-words"]}'></c:out></span>"
		</h1>

		<div class="results">
			<c:forEach var="bookList" items="${resultBooks }">
				<div class="box">
						<div class="image">
							<img src="${bookList.getImgLink() }" alt="">
						</div>
						<div class="content">
							<h3>${bookList.getName() }</h3>
							<h4>${bookList.getAuthor() }</h4>
							<div class="price">
								$${bookList.getPromo_price() }<span>$${bookList.getPrice() }</span>
							</div>
						</div>
						<div class="button">
							<a href="#" class="btn">add to cart</a>
						</div>
					</div>
			</c:forEach>
		</div>
	</section>

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