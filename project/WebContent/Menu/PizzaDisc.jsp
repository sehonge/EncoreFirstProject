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
		
	<!-- 메뉴 -->
	<div class="menu_wrap">
		<div class="menu">
			<ul>
				<li><a href="PizzaMenu.jsp"><span>피자</span></a></li>
				<li><a href="SideMenu.jsp"><span>사이드/음료</span></a></li>
				<li><a href="Custom.jsp"><span>나만의 피자</span></a></li>
			</ul>
		</div>
	</div>
			
			
	<section id="section" style="margin: 0 auto; width: 1300px; position: relative;">	
		<!-- 피자 이미지 -->
		<div id="article1" class="clearfix">
			<div class="imgcut">
				<img alt="foodimage" src="img/pizza_blackking.jpg">
				<span>* 위 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</span>
			</div>
		</div>
				
		<!-- 디테일 -->
		<div id="article2" class="clearfix">
			<!-- 피자 타이틀 -->
			<div class="title">
				<div class="name">블랙킹타이거 쉬림프</div>
				<p>압도적 크기, 블랙킹타이거 새우</p>
				<hr/>
			</div>
			
			<!-- 주문 버튼 -->
			<div class="size">
				<h2 align="left" style="color: #404040; margin-bottom: 10px; padding-top: 15px;">사이즈 선택</h2>
				<!-- label안에 input을 넣으면 텍스트를 클릭해도 선택이 된다! -->
				<label class="radio"><input type="radio" name="size" value="L"><span>L 27,900원</span></label>
				<label class="radio"><input type="radio" name="size" value="M"><span>M 21,900원</span></label>
			</div>
			
			<!-- 수량선택 -->
			<div class="qty">
				<h2>수량 선택</h2>
                <input type="number" id="qty_input" value="1" min="1" max="9">
			</div>
				
			<!-- 사이드/음료 -->
			<div class="side">
				<h2>사이드/음료</h2>
				<table>
					<thead>
						<tr>
							<th><img alt="foodimage" src="img/tomato_spaghetti.jpg"></th>
							<th><img alt="foodimage" src="img/cream_spaghetti.jpg"></th>
							<th><img alt="foodimage" src="img/garlic_wing.jpg"></th>
							<th><img alt="foodimage" src="img/corn.jpg"></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>토마토파스타</td>
							<td>크림파스타</td>
							<td>갈릭&허브 윙스</td>
							<td>코운슬로</td>
						</tr>
						<tr>
							<td>8,900원</td>
							<td>8,900원</td>
							<td>8,900원</td>
							<td>2,400원</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<!-- 결제 -->
			<div class="c">
				<div class="cost_box" style="width: 550px; height: 74px; inline-height: 74px; background-color: #f9f9f9;">
					<span class="cost"><span class="costall">총 금액</span>27,900원</span>
					<a href="#" class="button"><span>담기</span></a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>