<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 우리모두</title>
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	@import url("css/header.css");
	body{
    	margin: 0 auto;
    	width: 100%;
	}
	#cart{
		float:left;
		margin-left:10%;
		width:55%;
	}
	#calc{
		float:left;
		margin-right:10%;
		margin-top:3%;
	}
	#order{
		cursor: pointer;
		width:100%;
		border-radius:5px;
		padding-top:3%;
		padding-bottom:3%;
	}
	#order:hover{
		cursor: pointer;
		width:100%;
		background-color : #91F8D0;
	}
	
</style>
<script>
	function toCart(){
		location.href = "cartView.jsp";
	}
	function toOrderType(){
		location.href = "orderType.jsp";
	}
	
	$(function() {	
		$('#selectAll').click(function() {
	        var checked = this.checked;
	        $('input[type="checkbox"]').each(function() {
	        	this.checked = checked;
	    	});
	    })
	});
</script>
</head>
<body>
<!-- <header>
	<font size="30px">8JaPizza</font>&nbsp;&nbsp;&nbsp;
	
	<span style="margin-left:20%">
		<button>메뉴</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button onclick="toCart()">장바구니</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<button>마이페이지</button>
	</span>
	
	<span style="margin-left:25%">
		<button>로그인</button>&nbsp;
		<button>회원가입</button>
	</span>
</header> -->
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

<h1 style="margin-left:10%">장바구니</h1>
<div id="cart">
	
	<h3>담은 제품</h3>
	<table border="1" width="700">
		<thead bgcolor="lightgray">
			<tr>
				<th><input type="checkbox" id="selectAll"></th><th>제품</th><th>수량</th><th>가격</th>
			</tr>
		</thead>
		<!-- TB_Order에 저장된 정보를  -->
		<tbody align="center" style="vertical-align:middle">
			<tr>
				<td><input type="checkbox"></td><td><img src="img/pizza_blackking.jpg" width="80" height="80">&nbsp;<b style="vertical-align:top">블랙킹타이거 L</b></td>
				<td><img src="img/minus-sign.png" width="20" height="20" style="cursor:pointer">&nbsp;1&nbsp;
				<img src="img/plus-sign.png" width="20" height="20" style="cursor:pointer"></td>
				<td>27,900원</td>
			</tr>
			<tr>
				<td><input type="checkbox"></td><td><img src="img/tomato_spaghetti.jpg" width="80" height="80">&nbsp;<b style="vertical-align:top">토마토파스타 L</b></td>
				<td><img src="img/minus-sign.png" width="20" height="20" style="cursor:pointer">&nbsp;1&nbsp;
				<img src="img/plus-sign.png" width="20" height="20" style="cursor:pointer"></td>
				<td>8,900원</td>
			</tr>
		</tbody>
	</table><br/>
	<button style="background-color:darkgray; color:white;">선택제품삭제</button>
	<button>계속 메뉴 고르기</button>
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
	<button id="order" onclick="toOrderType()">주문하기</button>
	
</div>
</body>
</html>