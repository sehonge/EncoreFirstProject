<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//피자 가격 계산하기
	function calc(){		
		var amount = $("#qty").val();
	 	
	 	var pizzaL = ${pizzaL.menuPrice}
	 	
 	  	var pizzaR = ${pizzaR.menuPrice}
 	  	
 		if(document.getElementById('btn_L').checked){
	  		var costL = pizzaL*amount;
 	  		$("#cost").html(costL+"원 입니다.");
 	  	}else if(document.getElementById('btn_M').checked){
 	  		var costR = pizzaR*amount;	
 	  		$("#cost").html(costR+"원 입니다.");
 	  	}else{
 	  		alert("피자 크기와 수량을 입력해주세요!");
 	  	}
 	};
</script>
<style type="text/css">
	@import url("Menu/css/PizzaDisc.css");
</style>
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
			<li><a href="register.do">회원가입</a></li>
			<li><a href="bascket.do">장바구니</a></li>
		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
		
	<!-- 메뉴 -->
	<div class="menu_wrap">
		<div class="menu">
			<ul>
				<li><a href="pizzaMenu.do"><span>피자</span></a></li>
				<li><a href="sideMenu.do"><span>사이드/음료</span></a></li>
				<li><a href="customMenu.do"><span>나만의 피자</span></a></li>
			</ul>
		</div>
	</div>
			
			
	<section id="section" style="margin: 0 auto; width: 1300px; position: relative;">	
		<!-- 피자 이미지 -->
		<div id="article1" class="clearfix">
			<div class="imgcut">
				<img alt="foodimage" src="${pizzaL.pictureUrl}">
				<span>* 위 사진은 이미지컷으로 실제 제품과 다를 수 있습니다.</span>
			</div>
		</div>
				
		<!-- 디테일 -->
		<div id="article2" class="clearfix">
			<!-- 피자 타이틀 -->
			<div class="title">
				<div class="name">${pizzaL.menuName}</div>
				<p>${pizzaL.menuDesc}</p>
				<hr/>
			</div>
			
			<!-- 주문 버튼 -->		
			<div class="size">
				<h2 align="left" style="color: #404040; margin-bottom: 10px; padding-top: 15px;">사이즈 선택</h2>
				<label class="radio"><input id="btn_L" type="radio" class="checks" name="size" value="L" checked="checked" onchange="calc()"><span>L ${pizzaL.menuPrice}원</span></label>
				<label class="radio"><input id="btn_M" type="radio" class="checks" name="size" value="R" onchange="calc()"><span>R ${pizzaR.menuPrice}원</span></label>
			</div>
			
			<!-- 수량선택 -->
			<div class="qty_box">
				<h2>수량 선택</h2>
                <input type="number" id="qty" value="1" min="1" max="9" onchange="calc()" 
                style="width: 400px; height:50px; text-align: center; border-radius:50px; font-size: 20px;">
			</div>
			
			<!-- 결제 -->
			<div class="c" style="padding-top: 50px;">
				<div class="cost_box" style="width: 550px; height: 74px; inline-height: 74px; background-color: #f9f9f9;">
					<span class="costall">총 금액</span><span id="cost">${pizzaL.menuPrice}원 입니다.</span>
					<a href="bascket.do" class="button"><span>담기</span></a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>