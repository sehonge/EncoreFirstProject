<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 우리모두</title>
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>
<style>
	@import url("css/header.css");
	body{
    	margin: 0 auto;
    	width: 100%;
	}
	#delivery{
		cursor: pointer;
		padding: 10% 10%;
		border-radius: 10px;
		font-size:20px;
	}
	#delivery:hover{
		cursor: pointer;
		background-color : #91F8D0;
		padding: 10% 10%;
		border-radius: 10px;
		font-size:20px;
	}
	#pickup{
		padding: 10% 10%;
		border-radius: 10px;
		font-size:20px;
	}
	#pickup:hover{
		cursor: pointer;
		background-color : #91F8D0;
		padding: 10% 10%;
		border-radius: 10px;
		font-size:20px;
	}
	
</style>
<script>
	function toCart(){
		location.href = "cartView.jsp";
	}
	function toDelivery(){
		location.href = "delivery.jsp";
	}
	function toPickup(){
		location.href = "pickup.jsp";
	}
</script>
</head>
<body>
<nav class="navbar">
	<div class="navbar__logo">
		<i class="fas fa-pizza-slice"></i>
		<a href="Index.jsp">8자피자</a>
	</div>
	
	<ul class="navbar__menu">
		<li><a href="#">메뉴</a></li>
		<li><a href="#">마이페이지</a></li>
		<li><a href="#">회원가입</a></li>
		<li><a href="#" onclick="toCart()">장바구니</a></li>
		<li><a href="#"></a></li>
	</ul>
	
	
	<ul class="navbar__icons">
		<li><a href="#"><i class="fas fa-bars"></i></a></li>
	</ul>
	
	<a href="#" class="navbar__toogleBtn">
		<i class="fas fa-book-open"></i>
	</a>
</nav>
<h1 style="margin-left:10%">주문 유형 선택</h1>
<div align="center">
	<button id="delivery" onclick="toDelivery()" value="배달">배달 Delivery</button>&nbsp;&nbsp;&nbsp;
	<button id="pickup" onclick="toPickup()" value="포장">포장 Pick-up</button>
</div>
</body>
</html>