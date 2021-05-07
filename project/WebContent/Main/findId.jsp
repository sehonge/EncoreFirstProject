<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="model.Customer"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title>회원정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!--  JQuery CDN -->
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>
<script src="js/index.js" defer></script>
<script type="text/javascript">
	$(function() {
		   
	});// ready

	// 비동기 구현
	var xhr;
	var resultView;
	function startRequest() {
		var email = document.emailForm.email.value;
		resultView = document.getElementById("idResultView");

		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		xhr.open("post", "../findId.do", true);

		xhr.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded;charset=utf-8");

		xhr.send("email=" + email);
	}

	function callback() {
		if (xhr.readyState == 4) {
			if (xhr.status == 200) {
				var custId = xhr.responseText;
				resultView = document.getElementById("idResultView");
				resultView.innerHTML = "<font color='green'><B>"+custId+"</b></font>";
				if (custId.length == "0"){
					resultView.innerHTML = "<font color='red'><B> 입력하신 E-mail의 ID는 존재하지 않습니다.</b></font>";

				}
				
			}
		}
	}
</script>

</head>
<style type="text/css">
@import url("css/header.css");

@import url("css/columns.css");

@import url("css/footer.css");

@import url("css/search.css");

@import url("css/sidebar.css");
</style>


<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i> <a href="Index.jsp">8자피자</a>
		</div>

		<ul class="navbar__menu">
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<c:choose>
				<c:when test="${!empty rvo}">
					<li><a href="../showCustomer.do?id=${rvo.custId}">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="../showCustomer.do?id=">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			
			<li><a href="../bakset.do">장바구니</a></li>
		</ul>


		
	 <div id="quick">
		 <ul>
		 	<li><h2>퀵메뉴</h2></li>
		 <c:choose>
		 	<c:when test="${!empty rvo}">
		 		<li><i class="fas fa-trophy">${rvo.custName} 님</i></li>
			 	<li><a href="../showCustomer.do?id=${rvo.custId}"><i class="fas fa-info-circle">마이페이지</i></a></li>
			 	<li><a href="../logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
			 </c:when>
			 <c:otherwise>	
		 		<li><a href="login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
		 		<li><a href="register.jsp"><i class="fas fa-registered">회원가입</i></a></li>
		 	</c:otherwise>
		 </c:choose>
		 
		 </ul>	
	 </div>

		<a href="#" class="navbar__toogleBtn"> <i class="fas fa-book-open"></i>
		</a>
	</nav>

	<div class="columns">
		<div class="menu">
			<ul>
				<br>
				<li><h4>
						<span id="menu1">회원 공간</span>
					</h4></li>
				<li><a href="login.jsp"> 로그인 </a></li>
				<li><a href="register.jsp"> 회원가입 </a></li>
				<li><a href="findId.jsp"> 아이디 찾기 </a></li>
				<li><a href="findPw.jsp"> PW 찾기 </a></li>
				<li><a href="updateInfo.jsp"> 회원정보수정 </a></li>
			</ul>
		</div>

		<div class="pwSearchFrm">
			<div>
				<form name="emailForm">
					<h3>Email을 입력해주세요</h3>
					<span><input type="email" placeholder="E-mail 입력" name="email"></span> ID 찾기 <input type="button" value="click" onclick="startRequest()">
				</form>
			</div>
			<h3>찾으시는 ID</h3>
			<span id="idResultView">${vo.custId}</span>
		</div>
	</div>





	<hr>
	<footer id="footer">
		<div class="container">
			<div class="row">
				<div class="footer">
					<ul>
						<li><a href="#">사이트 도움말</a></li>
						<li><a href="#">사이트 이용약관</a></li>
						<li><a href="#">사이트 운영원칙</a></li>
						<li><a href="#"><strong>개인정보취급방침</strong></a></li>
						<li><a href="#">책임의 한계와 법적고지</a></li>
						<li><a href="#">게시중단요청서비스</a></li>
						<li><a href="#">고객센터</a></li>
					</ul>
					<address>
						Copyright © <a href="#"><strong> Encore 8자피자 </strong></a> All Rights Reserved.
					</address>
				</div>
			</div>
		</div>
	</footer>




</body>



</html>