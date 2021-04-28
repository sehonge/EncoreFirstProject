<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		@import url("css/PizzaMenu.css");
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
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_blackking.jpg"></a></div>
							<div class="food_name">블랙킹타이거쉬림프</div>
							<div class="food_price">
								<span class="price">
									<span class="size_L">L</span>
									27,900원~ 
								</span>
								<span class="price">
									<span class="size_M">M</span>
									21,900원~ 
								</span>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_global4.jpg"></a></div>
							<div class="food_name">글로벌 레전드4</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_chilicrab.jpg"></a></div>
							<div class="food_name">시리얼 칠리크랩</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_stake.jpg"></a></div>
							<div class="food_name">블랙앵거스 스테이크</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_starchef.jpg"></a></div>
							<div class="food_name">스타 셰프 시그니처</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_cheesecake.jpg"></a></div>
							<div class="food_name">치즈케이크 블랙타이거</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
						<li>
							<div class="food_img"><a href="PizzaDisc.jsp"><img alt="foodimage" src="img/pizza_trouple.jpg"></a></div>
							<div class="food_name">스타 셰프 트러플 바질</div>
							<div class="food_price">
								<div class="price_box">
									<span class="price">
										<span class="size_L">L</span>
										27,900원~ 
									</span>
									<span class="price">
										<span class="size_M">M</span>
										21,900원~ 
									</span>
								</div>
							</div>
						</li>
					</ul>
				</div>	
			</article>
		</section>
	</div>
</body>
</html>