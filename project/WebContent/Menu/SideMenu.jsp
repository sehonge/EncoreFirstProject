<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		@import url("css/SideMenu.css");
</style>
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
			<div class="menu_nav_wrap">
				<div class="menu-nav">
					<ul>
						<li><a href="PizzaMenu.jsp"><span>피자</span></a></li>
						<li><a href="SideMenu.jsp"><span>사이드/음료</span></a></li>
						<li><a href="Custom.jsp"><span>나만의 피자</span></a></li>
					</ul>
				</div>
			</div>
			
			
			<!-- 콘텐츠 -->
			<article id="article" style="width: 1700px;	margin: 0 auto;">
				<div class="food">
					<ul>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/tomato_spaghetti.jpg"></a></div>
							<div class="food_name">토마토파스타</div>
							<div class="food_price">
								<span class="price">8,900원</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/cream_spaghetti.jpg"></a></div>
							<div class="food_name">크림파스타</div>
							<div class="food_price">
								<span class="price">8,900원</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/garlic_wing.jpg"></a></div>
							<div class="food_name">갈릭&허브 윙스</div>
							<div class="food_price">
								<span class="price">8,900원</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/corn.jpg"></a></div>
							<div class="food_name">프레쉬 코운슬로</div>
							<div class="food_price">
								<span class="price">2,400원</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/coke.jpg"></a></div>
							<div class="food_name">코카콜라 1.25L</div>
							<div class="food_price">
								<span class="price">2,400원</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="SideDisc.jsp"><img alt="foodimage" src="img/cider.jpg"></a></div>
							<div class="food_name">스프라이트 1.5L</div>
							<div class="food_price">
								<span class="price">2,400원</span>
							</div>
						</li>
					</ul>
				</div>	
			</article>
		</section>
	</div>
</body>
</html>