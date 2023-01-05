<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<header class="header">
	<div class="header-1">
		<a href="index.jsp" class="logo"><img src="./assets/image/logo3.png" alt=""></a>
		
		<form action="searchServlet" method="post" class="search-form">
			<input type="search" placeholder="search here..." name="search-box">
			<button type="submit" class="fas fa-search"></button>
		</form>
		
		<div class="icons">
			<div id="search-btn" class="fas fa-search"></div>
			<a href="#" class="fas fa-heart"></a>
			<a href="./cart.jsp" class="fas fa-shopping-cart"></a>
			<a href="login.jsp" id="login-btn" class="fas fa-user"></a>
		</div>
	</div>

	<div class="header-2">
		<nav class="myNavbar">
			<a href="index.jsp">home</a>
			<a href="index.jsp#featured">featured</a>
			<a href="index.jsp#arrivals">arrivals</a>
			<a href="index.jsp#reviews">reviews</a>
			<a href="index.jsp#blogs">blog</a>
		</nav>
	</div>

	<!--BOTTOM NAVBAR starts-->
	<nav class="bottom-navbar">
		<a href="#home" class="fas fa-home"></a> <a href="#featured" class="fas fa-list"></a>
		<a href="#arrivals" class="fas fa-tags"></a>
		<a href="#reviews" class="fas fa-comments"></a>
		<a href="#blogs" class="fa-solid fa-blog"></a>
	</nav>
	<!--BOTTOM NAVBAR ends-->
</header>