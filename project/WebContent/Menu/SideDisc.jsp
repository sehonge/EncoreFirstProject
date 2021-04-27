<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/SideDisc.js"></script>
<link rel="stylesheet" type="text/css" href="css/SideDisc.css">
<link rel="shortcut icon" href="#">
</head>
<body>
		<div id="wrap">
		<!-- header -->
		<nav class="navbar">
			<div class="navbar__logo">
				<i class="fas fa-pizza-slice"></i>
				<a href="Index.jsp">8자피자</a>
			</div>
			
			<ul class="navbar__menu">
				<li><a href="#">메뉴</a></li>
				<li><a href="#">마이페이지</a></li>
				<li><a href="#">회원가입</a></li>
				<li><a href="#">장바구니</a></li>
				<li><a href="#"></a></li>
			</ul>
			
			
			<ul class="navbar__icons">
				<li><a href="#"><i class="fas fa-shopping-basket"></i></a></li>
				<li><a href="#"><i class="fas fa-bars"></i></a></li>
			</ul>
			
			<a href="#" class="navbar__toogleBtn">
				<i class="fas fa-book-open"></i>
			</a>
		</nav>
		
		<!-- contents -->
		<section id="contents">
			<!-- 네비게이션 -->
			<div class="menu">
				<h1 class="menu_title">메뉴</h1>
			</div>
			<article class="menu_select">
				<div class="menu_nav_wrap">
					<div class="menu_nav">
						<ul>
							<li><a href="PizzaMenu.jsp">피자</a></li>
							<li><a href="SideMenu.jsp">사이드/음료</a></li>
							<li><a href="Custom.jsp">나만의 피자</a></li>
						</ul>
					</div>
				</div>
				<!-- 콘텐츠 -->
				<div class="food">
					<!-- 피자 이미지 -->
					<div class="food_cut">
						<div><img alt="foodimage" src="img/토마토파스타.jpg"></div>
						<div class="food_cut_detail">* 위 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</div>
					</div>
					<!-- 피자 타이틀 -->
					<div class="detail_wrap">
						<div class="title">
							<div>토마토파스타</div>
						</div>
						<div class="title_disc">
							<span>치즈 듬뿍 셰프의 토마토 파스타</span>
						</div>
					</div>
					<hr/>
					<!-- 주문 버튼 -->
					<div class="selection">
						
						<!-- 수량선택 / javascript 수정필요-->
						<div class="select_wrap">
							<div class="select_title">
								<h1>수량 선택</h1>
							</div>
							<div class="quantity">
								<form>
								<!-- <button type="button" onclick="fnCalCount('m',ths);">-</button> -->
								<input type="number" name="qty" value="1" min="1" max="9">
								<!-- <button  type="button" onclick="fnCalCount('p',ths);">+</button> -->
								</form>
							</div>	
						</div>
						<!-- 계산하기 -->
						<div class="cost">
							<div class="container">
								<button class="cost_btn">총 1개 8900원 담기</button>
							</div>
						</div>
					</div>
				</div>	
			</article>
		</section>
	</div>
</body>
</html>