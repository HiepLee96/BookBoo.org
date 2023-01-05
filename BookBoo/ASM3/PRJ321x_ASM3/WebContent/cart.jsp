<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="model.Cart" %>
<%@page import="model.Books" %>
<%@page import="java.util.List"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


 
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <%@include file="header.jsp" %>
	
	<%
		Cart c = (Cart)session.getAttribute("cart");
		List<Books> bookList;
		double subTotalAmount = 0;
		double shippingFee = 2.99;
		if(c != null) {
			bookList = (List<Books>)c.getItems();
			subTotalAmount += c.getAmount();
		} else {
			bookList = null;
		}
		
		double totalAmount = subTotalAmount + shippingFee;
	%>
	<c:set var="totalAmount" value="<%= totalAmount %>"></c:set>	
    <main>
        <section class="h-100 h-custom">
            <div class="container h-100 py-5">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col">
          
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
                          <th scope="col" class="h2">Shopping Bag</th>
                          <th scope="col" class="h4">Format</th>
                          <th scope="col" class="h4">Quantity</th>
                          <th scope="col" class="h4">Price</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:choose>
                      		<c:when test="${cart.getItems().size() > 0 }">
                      			<c:forEach var="bookList" items="${cart.getItems() }">
                      				<tr>
									<th scope="row">
										<div class="d-flex align-items-center">
											<img src="${bookList.getImgLink() }" class="img-fluid rounded-3" style="width: 120px;"
												alt="Book">
											<div class="flex-column ms-4">
												<p class="mb-2">${bookList.getName() }</p>
												<p class="mb-0">${bookList.getAuthor() }</p>
											</div>
										</div>
									</th>
									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;">${bookList.getType() }</p>
									</td>
									<td class="align-middle">
										<div class="d-flex flex-row">
											<a class="btn btn-link px-2" href="AddToController?bookID=${bookList.getID() }&action=delete" role="button">
												<i class="fas fa-minus"></i>
											</a>
											<input id="form1" min="0" name="quantity" value="${bookList.getNumberInCart() }"
												type="number" class="form-control form-control-lg"
												style="width: 50px;" />
											<a class="btn btn-link px-2" href="AddToController?bookID=${bookList.getID() })&action=add" role="button">
												<i class="fas fa-plus"></i>
											</a>
										</div>
									</td>
									<td class="align-middle">
										<p class="mb-0" style="font-weight: 500;">$${bookList.getPromo_price() }</p>
									</td>
									</tr>
                      			</c:forEach>
                      		</c:when>
                      		<c:otherwise>
                      			<p class="d-flex align-items-center mb-0">Your cart is empty</p>
                      		</c:otherwise>
                      	</c:choose>
						</tbody>
                    </table>
                  </div>
          
                  <div class="card shadow-2-strong mb-5 mb-lg-0" style="border-radius: 16px;">
                    <div class="card-body p-4">
          
                      <div class="row">
                        <div class="col-md-6 col-lg-4 col-xl-3 mb-4 mb-md-0">
                          <form>
                            <div class="d-flex flex-row pb-3">
                              <div class="d-flex align-items-center pe-2">
                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel1v" value="" aria-label="..." checked />
                              </div>
                              <div class="rounded border w-100 p-3">
                                <p class="d-flex align-items-center mb-0">
                                  <i class="fab fa-cc-mastercard fa-lg text-dark pe-2"></i>Credit Card
                                </p>
                              </div>
                            </div>
                            <div class="d-flex flex-row pb-3">
                              <div class="d-flex align-items-center pe-2">
                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel2v" value="" aria-label="..." />
                              </div>
                              <div class="rounded border w-100 p-3">
                                <p class="d-flex align-items-center mb-0">
                                  <i class="fab fa-cc-visa fa-2x fa-lg text-dark pe-2"></i>Debit Card
                                </p>
                              </div>
                            </div>
                            <div class="d-flex flex-row">
                              <div class="d-flex align-items-center pe-2">
                                <input class="form-check-input" type="radio" name="radioNoLabel" id="radioNoLabel3v" value="" aria-label="..." />
                              </div>
                              <div class="rounded border w-100 p-3">
                                <p class="d-flex align-items-center mb-0">
                                  <i class="fab fa-cc-paypal fa-2x fa-lg text-dark pe-2"></i>PayPal
                                </p>
                              </div>
                            </div>
                          </form>
                        </div>
                        
                        <div class="col-md-6 col-lg-4 col-xl-6">
                        <form action="SaveCartToDatabase" method="POST" id="cartInfoForm">
                          	<div class="row">
                            	<div class="form-outline">
                              		<input type="text" name="inputAddress" class="form-control form-control-lg" size="100" placeholder="Texas abc123" />
                              		<label class="form-label" for="typeName">Your address</label>
                            	</div>
                          	</div>
                          	<div class="row">
                            <div class="col-12 col-xl-6">
                              <div class="form-outline">
                                <input type="text" name="inputName" class="form-control form-control-lg" size="30" placeholder="John Smith" />
                                <label class="form-label" for="typeName">Name on card</label>
                              </div>
          
                              <div class="form-outline">
                                <input type="text" name="inputExp" class="form-control form-control-lg" placeholder="MM/YY" size="7" id="exp" minlength="7" maxlength="7" />
                                <label class="form-label" for="typeExp">Expiration</label>
                              </div>

                              <div class="form-outline">
                                <input type="text" name="inputCardNumber" class="form-control form-control-lg" size="19" placeholder="1111 2222 3333 4444" minlength="19" maxlength="19" />
                                <label class="form-label" for="typeText">Card Number</label>
                              </div>
          
                              
                            </div>

                            <div class="col-12 col-xl-6">
                              <div class="form-outline">
                                <input type="text" name="inputPhoneNumber" class="form-control form-control-lg" placeholder="0123 456 789" size="11" id="exp" minlength="11" maxlength="11" />
                                <label class="form-label" for="typeExp">Your phone</label>
                              </div>

                              <div class="form-outline">
                                <input type="text" name="inputDiscountCode" class="form-control form-control-lg" size="11" placeholder="123456789" minlength="11" maxlength="11" />
                                <label class="form-label" for="typeText">Discount code</label>
                              </div>
                              <div class="form-outline mb-1 mb-xl-5">
                                <input type="password" name="inputCvv" class="form-control form-control-lg" placeholder="&#9679;&#9679;&#9679;" size="1" minlength="3" maxlength="3" />
                                <label class="form-label" for="typeText">Cvv</label>
                              </div>
                            </div>
                         </form>
                         </div>
                        </div>
                        <div class="col-lg-4 col-xl-3">
                          <div class="d-flex justify-content-between" style="font-weight: 500;">
                            <p class="mb-2">Subtotal</p>
                            <p class="mb-2">$<% out.print(subTotalAmount); %></p>
                          </div>
          
                          <div class="d-flex justify-content-between" style="font-weight: 500;">
                            <p class="mb-0">Shipping</p>
                            <p class="mb-0">$<% out.print(shippingFee); %></p>
                          </div>
          
                          <hr class="my-4">
          
                          <div class="d-flex justify-content-between mb-4" style="font-weight: 500;">
                            <p class="mb-2">Total (tax included)</p>
                            <p class="mb-2">$<fmt:formatNumber type="number" maxFractionDigits="2" value="${totalAmount}" /></p>
                          </div>
          
                          <button type="submit" class="btn btn-success btn-block btn-lg" form="cartInfoForm">
                            <div class="d-flex justify-content-between">
                              <span>Checkout </span>
                              <span>&ensp;&ensp;$<fmt:formatNumber type="number" maxFractionDigits="2" value="${totalAmount}" /></span>
                            </div>
                          </button>
          
                        </div>
                      </div>
          
                    </div>
                  </div>
          
                </div>
              </div>
            </div>
          </section>
    </main>

	<%@include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
    <script src="./assets/js/index.js"></script>
</body>
</html>