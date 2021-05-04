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
	@import url("../Main/css/sidebar.css");
	@import url("../Main/css/footer.css");
	@import url("css/orderType.css");
	#footer{
		clear:both;
	}
</style>
<script>
</script>
</head>
<body>
<!-- header -->
<nav class="navbar">
	<div class="navbar__logo">
		<i class="fas fa-pizza-slice"></i>
		<a href="Index.jsp">8자피자</a>
	</div>
	
	<ul class="navbar__menu">
		<li><a href="../Menu/PizzaMenu.jsp">메뉴</a></li>
		<li><a href="../Main/Mypage.jsp">마이페이지</a></li>
		<li><a href="../Main/register.jsp">회원가입</a></li>
		<li><a href="cartView.jsp">장바구니</a></li>
		<li><a href="#"></a></li>
	</ul>
	
</nav>

<div id="quick">
	 <ul>
	 	<li><h2>퀵메뉴</h2></li>
	 	<li><a href="../Main/login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
	 	<li><a href="../Main/logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
	 	<li><a href="../Main/Mypage.jsp"><i class="fas fa-info-circle">마이페이지</i></a></li>
	 </ul>	
 </div>


<!-- main -->
<h1 style="margin-left:10%">주문 유형 선택</h1>
<div class="container1">
	<button id="delivery" value="배달">배달<br> <em>Delivery</em><br><img class="image1" src="img/delivery.png" width="30%" height="40%"></button>
	<div class="overlay1" onclick="location.href='delivery.jsp'">
		<div class="text1">빠르고 안전하게 배달해드립니다!</div><br>
	</div>
</div>
<div class="container2">
	<button id="pickup" value="포장">포장<br> <em>Pick-up</em><br><img class="image2" src="img/pickup.png" width="30%" height="40%"></button>
	<div class="overlay2" onclick="location.href='pickup.jsp'">
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