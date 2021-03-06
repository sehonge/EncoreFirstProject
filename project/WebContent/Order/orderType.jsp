<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 우리모두</title>
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/orderType.css">

<style>
    #footer {
	  position:absolute;
	  left:0;
	  right:0;
	  bottom:0;
	}
</style>
<c:choose>
	<c:when test="${empty rvo}">
		<script>
			alert("로그인부터 진행하시기 바랍니다.");
			location.href="${pageContext.request.contextPath}/Main/login.jsp";/*"/project/project/Main/login.jsp"*/
		</script>
	</c:when>
</c:choose>
<script type="text/javascript">
$(function(){

	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 130) {
		 scrollTop = 130;
		}
		$("#quick").stop();
		$("#quick").animate( { "top" : scrollTop });
		});
	
	$('.overlay1').on('click', function(){
		
		  var address = $('#custAddr').text();
		  var form = document.createElement('form');
		  var objs1;
		  objs1 = document.createElement('input');
		  objs1.setAttribute('type','hidden');
		  objs1.setAttribute('name', 'address');
		  objs1.setAttribute('value', address);
		  form.appendChild(objs1);
		  form.setAttribute('method', 'post');
		  form.setAttribute('action', "${pageContext.request.contextPath}/addAddress.do"); //use /project/project 
		  document.body.appendChild(form);
		  form.submit();
	});
});
</script>
</head>
<body>
<!-- header -->
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="${pageContext.request.contextPath}/Main/Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="${pageContext.request.contextPath}/pizzaMenu.do">메뉴</a></li>

			<c:choose>
				<c:when test="${!empty rvo}">
					<li><a href="${pageContext.request.contextPath}/showCustomer.do?id=${rvo.custId}">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/showCustomer.do">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			
			<li><a href="${pageContext.request.contextPath}/basket.do">장바구니</a></li>

		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	
	 <div id="quick">
		 <ul>
		 	<li><h2>퀵메뉴</h2></li>
		 <c:choose>
		 	<c:when test="${!empty rvo}">
		 		<li><i class="fas fa-trophy">${rvo.custName} 님</i></li>
			 	<li><a href="${pageContext.request.contextPath}/showCustomer.do"><i class="fas fa-info-circle">마이페이지</i></a></li>
			 	<li><a href="${pageContext.request.contextPath}/logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
			 </c:when>
			 <c:otherwise>	
		 		<li><a href="${pageContext.request.contextPath}/Main/login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
		 		<li><a href="${pageContext.request.contextPath}/Main/register.jsp"><i class="fas fa-registered">회원가입</i></a></li>
		 	</c:otherwise>
		 </c:choose>
		 
		 </ul>	
	 </div>

<!-- main -->
<div id="custAddr" style="display:none;">${rvo.custAddr}</div>
<h1 style="margin-left:10%">주문 유형 선택</h1>
<div class="container1">
	<button id="delivery">배달<br> <em>Delivery</em><br><img class="image1" src="img/delivery.png" width="30%" height="40%"></button>
	<div class="overlay1">
		<div class="text1">빠르고 안전하게 배달해드립니다!</div><br>
	</div>
</div>
<div class="container2">
	<button id="pickup">포장<br> <em>Pick-up</em><br><img class="image2" src="img/pickup.png" width="30%" height="40%"></button>
	<div class="overlay2" onclick="location.href='${pageContext.request.contextPath}/pickUpAddress.do'">
		<div class="text2">가까운 매장에서 찾아가세요!</div>
	</div>
</div>


  <!-- footer -->
  <footer id="footer">
		<br><br><br><br>
		<hr>
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
                        Copyright ©
                        <a href="#"><strong> Encore 8자피자 </strong></a>
                        All Rights Reserved.
                    </address>
                </div>
            </div>
        </div>
    </footer>
</body>
</html>