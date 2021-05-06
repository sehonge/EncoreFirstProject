<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> Login </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--  JQuery CDN -->
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>

<script src="js/index.js" defer></script>
<script type="text/javascript">

$(function(){
	
	
	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 130) {
		 scrollTop = 130;
		}
		$("#quick").stop();
		$("#quick").animate( { "top" : scrollTop });
		});
});// ready


</script>

</head>
<style type="text/css">
@import url("css/header.css");

@import url("css/sidebar.css");

@import url("css/login.css");

@import url("css/loginBody.css");

@import url("css/footer.css");

</style>


<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<c:choose>
				<c:when test="${!empty rvo}">
					<li><a href="../showCustomer.do?id=${rvo.custId}">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="../showCustomer.do?id=">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			
			<li><a href="../bakset.do">장바구니</a></li>
		</ul>
		
	

		
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	

	 <div id="quick">
		 <ul>
		 	<li><h2>퀵메뉴</h2></li>
		 <c:choose>
		 	<c:when test="${!empty rvo}">
		 		<li><i class="fas fa-trophy">${rvo.custName} 님</i></li>
			 	<li><a href="../showCustomer.do?id=${rvo.custId}"><i class="fas fa-info-circle">마이페이지</i></a></li>
			 	<li><a href="../logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
			 </c:when>
			 <c:otherwise>	
		 		<li><a href="login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
		 		<li><a href="register.jsp"><i class="fas fa-registered">회원가입</i></a></li>
		 	</c:otherwise>
		 </c:choose>
		 
		 </ul>	
	 </div>
	
	<div>
		
		
	</div>
	
	
	<div class="columns">
			
	  	<form action="../login.do" class="wrap" name="loginFrm">
	  	
	        <div class="login">
	         
	            <div class="login_id">
	            	<br><br>
	                <h4>ID</h4>
	                <input type="text" name="custId" id="" placeholder="아이디" required>
	                <div id="loginCheckResult"> </div>
	            </div>
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="custPw" id="" placeholder="Password">
	            </div>
	            <div class="login_etc">
	                <div class="checkbox">
	                <input type="checkbox" name="" id=""> Remember Me?
	                </div>
	                <div class="forgot_pw">
	                	<a href="findPw.jsp">Forgot Password?</a>
	                	<a href="findId.jsp">Forget ID?</a>
	            	</div>
	            </div>
	            <div class="submit">
	                <p><input type="submit" value="login"></p>
	                <p><a href="register.jsp"><input type="button" value="Register"></a></p>
	            </div>
	        </div>
    	</form>
	</div>
	
		<hr>
	<footer id="footer">
        <div class="container">
            <div class="row">
                <div class="footer">
                    <ul>
                        <li><a href="#">사이트 도움말</a></li>
                        <li><a href="#">사이트 이용약관</a></li>
                        <li><a href="#">사이트 운영원칙</a></li>
                        <li><a href="#"><strong>개인정보취급방침</strong></a></li>
                        <li><a href="#">책임의 한계와 법적고지</a></li>
                        <li><a href="#">게시중단요청서비스</a></li>
                        <li><a href="#">고객센터</a></li>
                    </ul>
                    <address>
                        Copyright ©
                        <a href="#"><strong> Encore 8자피자 </strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer>
	
	
	

</body>

</html>