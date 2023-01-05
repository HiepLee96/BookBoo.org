<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 

<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306"
	user="root" password="tybtrwcM1996"
 />
 <sql:query var="list_books" dataSource="${myDS}">
    SELECT * FROM bookboo_csdl.books;
</sql:query>

<main>
    <!--HOME SECTION starts-->
    <section class="home" id="home">
        <div class="row">
            <div class="content">
                <h3>upto 75% off</h3>
                <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Magnam deserunt nostrum accusamus. Nam alias sit necessitatihbus, aliquid ex minam at!</p>
                <a href="#" class="btn">shop now</a>
            </div>
            <div class="swiper books-slider">
                <div class="swiper-wrapper">
                	<!-- 1. & 2. Hien thi danh sach san pham co su dung JSTL  -->
                	<c:forEach var="books" items="${list_books.rows}"> 
    					<a href="details.jsp?bookIDne=${books.id }" class="swiper-slide"><img src="${books.image}" alt=""></a>
					</c:forEach>
                </div>
                <img src="./assets/image/stand.png" class="stand" alt="">
            </div>
        </div>
    </section>
    <!--HOME SECTION ends-->

    <!--ICONS SECTION starts-->
    <section class="icons-container">
        <div class="icons">
            <i class="fas fa-paper-plane"></i>
            <div class="content">
                <h3>free shipping</h3>
                <p>order over $100</p>
            </div>
        </div>
        <div class="icons">
            <i class="fas fa-lock"></i>
            <div class="content">
                <h3>secure payment</h3>
                <p>100 secure payment</p>
            </div>
        </div>
        <div class="icons">
            <i class="fas fa-redo-alt"></i>
            <div class="content">
                <h3>easy return</h3>
                <p>10 days returns</p>
            </div>
        </div>
        <div class="icons">
            <i class="fas fa-headset"></i>
            <div class="content">
                <h3>24/7 support</h3>
                <p>call us anytime</p>
            </div>
        </div>
    </section>
    <!--ICONS SECTION ends-->

    <!--FEATURED SECTION starts-->
    <section class="featured" id="featured">
        <h1 class="heading"><span>featured books</span></h1>
        <div class="swiper featured-slider">
            <div class="swiper-wrapper">
            	<!-- 7. Su dung JSTL de hien thi du lieu trong JSP -->
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
							<h3>${books.name}</h3>
							<div class="price">
								$${books.promo_price}<span>$${books.price}</span>
							</div>
							<a href="AddToController?bookID=${books.id }&action=add" class="btn">add to cart</a>
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
            <input type="email" name="" placeholder="enter your email" id="" class="input-box">
            <input type="submit" value="subscribe" class="btn">
        </form>
    </section>
    <!-- NEWSLETTER SECTION ends -->

    <!-- ARRIVALS SECTION starts -->
    <section class="arrivals" id="arrivals">
        <h1 class="heading"><span>new arrivals</span></h1>
        <div class="swiper arrivals-slider">
            <div class="swiper-wrapper">
            	<c:forEach var="books" items="${list_books.rows}"> 
					<a href="details.jsp?bookIDne=${books.id }" class="swiper-slide box">
						<div class="image">
							<img src="${books.image}" alt="">
						</div>
						<div class="content">
							<h3>${books.name}</h3>
							<div class="price">
								$${books.promo_price} <span>$${books.price}</span>
							</div>
							<div class="stars">
								<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star"></i> <i class="fas fa-star"></i> <i
									class="fas fa-star-half-alt"></i>
							</div>
						</div>
					</a>
				</c:forEach>
            </div>
        </div>
        <div class="swiper arrivals-slider">
            <div class="swiper-wrapper">
                <a href="" class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/book-6.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">$15.99 <span>$20.99</span></div>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
                <a href="" class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/book-7.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">$15.99 <span>$20.99</span></div>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
                <a href="" class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/book-8.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">$15.99 <span>$20.99</span></div>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
                <a href="" class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/book-9.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">$15.99 <span>$20.99</span></div>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
                <a href="" class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/book-10.png" alt="">
                    </div>
                    <div class="content">
                        <h3>new arrivals</h3>
                        <div class="price">$15.99 <span>$20.99</span></div>
                        <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                        </div>
                    </div>
                </a>
            </div>
    </section>
    <!-- ARRIVALS SECTION ends -->

    <!-- DEAL SECTION starts -->
    <section class="deal">
        <div class="content">
            <h3>deal of the day</h3>
            <h1>upto 50% off</h1>
            <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
            <a href="#" class="btn">shop now</a>
        </div>
        <div class="image">
            <img src="./assets/image/deal-img.jpg" alt="">
        </div>
    </section>
    <!-- DEAL SECTION ends -->

    <!-- REVIEWS SECTION starts -->
    <section class="reviews" id="reviews">
        <h1 class="heading"><span>client's reviews </span></h1>
        <div class="swiper reviews-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-1.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-2.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-3.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-4.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-5.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <img src="./assets/image/pic-6.png" alt="">
                    <h3>john deo</h3>
                    <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                    <div class="stars">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- REVIEWS SECTION ends -->

    <!-- BLOG SECTION starts -->
    <section class="blogs" id="blogs">
        <h1 class="heading"> <span>our blogs</span></h1>
        <div class="swiper blog-slider">
            <div class="swiper-wrapper">
                <div class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/blog-1.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>blog title goes here</h3>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                        <a href="#" class="btn">read more</a>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/blog-2.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>blog title goes here</h3>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                        <a href="#" class="btn">read more</a>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/blog-3.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>blog title goes here</h3>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                        <a href="#" class="btn">read more</a>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/blog-4.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>blog title goes here</h3>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                        <a href="#" class="btn">read more</a>
                    </div>
                </div>
                <div class="swiper-slide box">
                    <div class="image">
                        <img src="./assets/image/blog-5.jpg" alt="">
                    </div>
                    <div class="content">
                        <h3>blog title goes here</h3>
                        <p>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Une perspiciatis in atque dolore tempora quaerat at fuga dolorum natus velit.</p>
                        <a href="#" class="btn">read more</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- BLOG SECTION ends -->
    </main>