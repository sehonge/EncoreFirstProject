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

	
</style>
<script>
	function toCart(){
		location.href = "cartView.jsp";
	}
	
	function addAddress(){
		location.href = "addAddress.jsp";
	}
	
	function toPayment(){
		location.href = "payment.jsp";
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

<h1 style="margin-left:10%">배달 주소 선택</h1>
<div style="margin-left:10%">
	<button>주소 리스트</button>
	<button onclick="addAddress()">주소 추가</button><br/>
	<table border="1" width="800">
		<thead bgcolor="lightgray">
			<tr>
				<th>선택</th><th>주소</th>
			</tr>
		</thead>
		<tbody align="center">
			<tr>
				<td><input type="radio" name="select"></td><td>서울시~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
			</tr>
			<tr>
				<td><input type="radio" name="select"></td><td>서울시~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</td>
			</tr>
		</tbody>
	</table>
	<button>수정</button>
	<button>삭제</button><br/><br/>
	<button onclick="toPayment()">주소 선택 완료</button>
</div>
</body>
</html>