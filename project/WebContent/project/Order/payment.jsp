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
	#confirm{
		float:left;
		margin-left:10%;
		width:55%;
	}
	#confirm th{
		background-color:lightgray;
	}
	#confirm td{
		text-align:center;
	}
	#calc{
		float:left;
		margin-right:10%;
		margin-top:5%;
	}
	#pay{
		cursor: pointer;
		width:100%;
		border-radius:5px;
		padding-top:3%;
		padding-bottom:3%;
		
	}
	#pay:hover{
		cursor: pointer;
		width:100%;
		background-color : #91F8D0;
	}
	
</style>
<script>
	function toCart(){
		location.href = "cartView.jsp";
	}
	function toPaymentResult(){
		location.href = "paymentResult.jsp";
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

<h1 style="margin-left:10%">결제</h1>
<div id="confirm">
	
	<h3>고객 및 주소 정보 확인</h3>
	<table border="1" width="700">
			<tr>
				<th>주문 유형</th><td>배달</td>
			</tr>
			<tr>
				<th>수령인</th><td>홍길동</td>
			</tr>
			<tr>
				<th>연락처</th><td>123-456-789</td>
			</tr>
			<tr>
				<th>주소</th><td>서울시~~~~~~~~~~~~~~~~~~~~~</td>
			</tr>
	</table>
</div>
<div id="calc">
	<table border="1" width="300">
		<thead bgcolor="lightgray" align="center">
			<tr>
				<th colspan="3">주문 계산</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>블랙킹타이거</td><td>L 1</td><td>27,900원</td>
			</tr>
			<tr>
				<td>토마토파스타</td><td>L 1</td><td>8,900원</td>
			</tr>
		</tbody>
	</table><br/>
	<div align="right">결제예정금액 :  <font color="red" size="6em">36,800</font>원</div><br/>
	<button id="pay" onclick="toPaymentResult()">결제하기</button>
</div>
</body>
</html>