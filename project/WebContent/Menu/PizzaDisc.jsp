<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/PizzaDisc.js"></script>
<link rel="stylesheet" type="text/css" href="css/PizzaDisc.css">
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
		<div id="contents">
		
			<!-- 메뉴 -->
			<div class="menu_nav_wrap">
				<div class="menu-nav">
					<ul>
						<li><a href="PizzaMenu.jsp"><span>피자</span></a></li>
						<li><a href="SideMenu.jsp"><span>사이드/음료</span></a></li>
						<li><a href="Custom.jsp"><span>나만의 피자</span></a></li>
					</ul>
				</div>
			</div>
			
			
			<!-- 음식 -->
			<section id="food" class="clearfix">
			
				<!-- 피자 이미지 -->
				<aside class="food_cut">
					<img alt="foodimage" src="img/블랙킹타이거.jpg">
					<span>* 위 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</span>
				</aside>
				
				<!-- 피자 타이틀 -->
				<div id="detail_wrap">
					<div class="title">
						<div class="name">블랙킹타이거</div>
						<p>압도적 크기, 블랙킹타이거 새우</p>
						<hr/>
					</div>
					<!-- 주문 버튼 -->
					<div class="selection">
						<div class="select_title">
							<h1>사이즈 선택</h1>
						</div>
						<div class="size">
							<!-- label안에 input을 넣으면 텍스트를 클릭해도 선택이 된다! -->
							<label class="radio"><input type="radio" name="size" value="L"><span>L 27,900원</span></label>
							<label class="radio"><input type="radio" name="size" value="M"><span>M 21,900원</span></label>
						</div>
						
						<!-- 수량선택 -->
						<div class="select_wrap">
							<div class="select_title">
								<h1>수량 선택</h1>
							</div>
						  	<div class="quantity">
                               <input type="number" id="qty_input" value="1" min="1" max="9">
							</div>
						</div>
						
						<div class="side">
							<div class="select_title">
								<h1>사이드/음료</h1>
							</div>
							<div class="select_side">
								<table>
									<thead>
										<tr>
											<th><img alt="foodimage" src="img/토마토파스타.jpg"></th>
											<th><img alt="foodimage" src="img/토마토파스타.jpg"></th>
											<th><img alt="foodimage" src="img/토마토파스타.jpg"></th>
											<th><img alt="foodimage" src="img/토마토파스타.jpg"></th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>토마토파스타</td>
											<td>토마토파스타</td>
											<td>토마토파스타</td>
											<td>토마토파스타</td>
										</tr>
										<tr>
											<td>8900원</td>
											<td>8900원</td>
											<td>8900원</td>
											<td>8900원</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div class="cost">
							<div class="container">
								<button class="cost_btn">담기</button>
							</div>
						</div>
					</div>
				</section>
			</div>	
		</div>
</body>
</html>