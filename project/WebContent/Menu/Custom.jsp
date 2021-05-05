<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/Custom.js"></script>
<link rel="stylesheet" type="text/css" href="Menu/css/Custom.css">
<link rel="shortcut icon" href="#">
</head>
<body>

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
		
	<!-- 메뉴 -->
	<div class="menu_wrap">
		<div class="menu">
			<ul>
				<li><a href="PizzaMenu.do"><span>피자</span></a></li>
				<li><a href="sideMenu.do"><span>사이드/음료</span></a></li>
				<li><a href="customMenu.do"><span>나만의 피자</span></a></li>
			</ul>
		</div>
	</div>
			
			
	<section id="section" style="margin: 0 auto; width: 1300px; position: relative;">	
		<!-- 피자 이미지 -->
		<div id="article1" class="clearfix">
			<div class="imgcut">
				<img id="dough_L" alt="foodimage" src="img/dough_L.png">
				<img id="dough_M" alt="foodimage" src="img/dough_M.png">
			</div>
		</div>
				
		<!-- 디테일 -->
		<div id="article2" class="clearfix">
			<!-- 피자 타이틀 -->
			<div class="title">
				<div class="name">나만의 피자</div>
				<p>토핑은 내맘대로, 나만의 피자를 만들어보세요!</p>
				<hr/>
			</div>
			
			<!-- 주문 버튼 -->
			<div class="size">
				<h2 align="left">사이즈 선택</h2>
				<!-- label안에 input을 넣으면 텍스트를 클릭해도 선택이 된다! -->
				<label class="radio"><input id="L" type="radio" name="size" value="L"><span>L(+5900원)</span></label>
				<label class="radio"><input id="R" type="radio" name="size" value="R"><span>R</span></label>
			</div>
			
			<!-- 토핑 -->
			<div class="side">
				<h2>토핑</h2>
				<table>
					<thead>
						<tr>
							<th><img alt="foodimage" src="img/topping_stake.png"></th>
							<th><img alt="foodimage" src="img/topping_lobster.png"></th>
							<th><img alt="foodimage" src="img/topping_squid.png"></th>
							<th><img alt="foodimage" src="img/topping_mushroom.png"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>스테이크</td>
							<td>랍스타</td>
							<td>스퀴드</td>
							<td>발사믹 버섯</td>
						</tr>
						<tr>
							<td>+3000원</td>
							<td>+3000원</td>
							<td>+2000원</td>
							<td>+2000원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 수량선택 -->
			<div class="qty">
				<h2>수량 선택</h2>
                <input type="number" id="qty_input" value="1" min="1" max="9">
			</div>
				
			<!-- 결제 -->
			<div class="c">
				<div class="cost_box" style="width: 550px; height: 74px; inline-height: 74px; background-color: #f9f9f9;">
					<span class="cost"><span class="costall">총 금액</span>27,900원</span>
					<a href="bascket.do" class="button"><span>담기</span></a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>