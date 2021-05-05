<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="#">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	@import url("Menu/css/PizzaMenu.css");
</style>
</head>
<body>
	<div id="wrap">
	
	<!-- nav -->
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Main/Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="pizzaMenu.do">메뉴</a></li>
			<li><a href="showCustomer.do?id=${vo.id}">마이페이지</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<li><a href="#">장바구니</a></li>
		</ul>
		
		<div class="menu_btn"><a href="#">       
        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjQgNmgtMjR2LTRoMjR2NHptMCA0aC0yNHY0aDI0di00em0wIDhoLTI0djRoMjR2LTR6Ii8+PC9zdmc+">
        </a>
        </div>
        
		<div class="menu_bg"></div>
		<div class="sidebar_menu">
    	<div class="close_btn">
    	<a href="#">       
         <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjMuOTU0IDIxLjAzbC05LjE4NC05LjA5NSA5LjA5Mi05LjE3NC0yLjgzMi0yLjgwNy05LjA5IDkuMTc5LTkuMTc2LTkuMDg4LTIuODEgMi44MSA5LjE4NiA5LjEwNS05LjA5NSA5LjE4NCAyLjgxIDIuODEgOS4xMTItOS4xOTIgOS4xOCA5LjF6Ii8+PC9zdmc+">
        </a>
        </div>
		     <ul class="menu_wrap">
		          <li><a href="Index.jsp">Home</a></li>
		          <li><a href="pizzaMenu.do">메뉴</a></li>
		          <li><a href="showCustomer.do?id=${vo.id}">마이페이지</a></li>
		          <li><a href="register.jsp">회원가입</a></li>
		          <li><a href="#">장바구니</a></li>
		     </ul>
		</div>
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
		
		
		<!-- contents -->
		<section id="contents">
		
			<!-- 네비게이션 -->
			<div class="menu_nav_wrap">
				<div class="menu-nav">
					<ul>
						<li><a href="pizzaMenu.do"><span>피자</span></a></li>
						<li><a href="sideMenu.do"><span>사이드/음료</span></a></li>
						<li><a href="customMenu.do"><span>나만의 피자</span></a></li>
					</ul>
				</div>
			</div>
			
			
			<!-- 콘텐츠 -->
			<article id="article" style="width: 1700px;	margin: 0 auto;">
				<div class="food">
					<ul>
						<c:forEach items="${list}" var="list" varStatus="vs" step="2">
							<li>
								<div class="food_img"><a href="pizzaDisc.do?menuId=${list.menuId}"><img alt="foodimage" src="${list.pictureUrl}"></a></div>
								<div class="food_name">${list.menuName}</div>
							</li>	
						</c:forEach>
					</ul>
				</div>	
			</article>
		</section>
	</div>
</body>
</html>