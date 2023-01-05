<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookly: Free delivery worldwide on over 20 milion books</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="./assets/css/style-login.css">
</head>
<body>
	<!-- Get cookies's data -->
	<%
	Cookie[] Cookies = request.getCookies();
	String userName_loginPage = "";
	String userPassword_loginPage = "";
	if (Cookies != null) {
		for(int i = 0; i < Cookies.length; i++){
			if(Cookies[i].getName().equals("userNameCookie")){
				userName_loginPage = Cookies[i].getValue();
			}
			if(Cookies[i].getName().equals("userPasswordCookie")){
				userPassword_loginPage = Cookies[i].getValue();
			}
		}
	}
	%>
	<!--LOGIN FORM starts-->
    <div class="login-form-container">
        <a href="./index.jsp">
            <div id="close-login-btn" class="fas fa-times"></div>
        </a>

        <form action="LoginServlet" method="POST" name="login-form" onsubmit="return(isLoginFormEmpty());">
            <h3>sign in</h3>            
            <span>username</span>
            <input type="text" class="input-box" id="username" placeholder=" enter your email" name="username" value="<% out.print(userName_loginPage);%>">
            <p id="errUserName"></p>
            <span>password</span>
            <input type="password" class="input-box" id="password" placeholder=" enter your password" name="password"  value="<%out.print(userPassword_loginPage);%>">
            <p id="errPassword"></p>
            
            <!-- In ra thong bao loi neu username hoac password sai -->
            <% String invalidUerErr = (String)session.getAttribute("error"); %>
            <p style="color: red;">
            	<%
            		if(invalidUerErr != null){
            			out.print(invalidUerErr);
            		}
            	%>
            </p>
            <div class="checkbox">
                <input type="checkbox" name="remember-me" id="remember-me" >
                <label for="remember-me">remember me</label>
            </div>
            <input type="submit" value="sign in" class="btn" id="submit-btn">
            <p>forget password? <a href="#">click here</a> </p>
            <p>don't have an account <a href="#">create one</a> </p>
        </form>
    </div>
    <!--LOGIN FORM ends-->

    <script src="./assets/js/index.js"></script>
</body>
</html>