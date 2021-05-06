<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${!empty rvo}">
		<script>			
		</script>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("로그인 부터 진행하시기 바랍니다!");
			location.href="login.jsp";
		</script>
	</c:otherwise>
</c:choose>
 

<!--  vo 객체를 여기다가 쏴주면 
	추후 진행 --> 

   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> MyPage </title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> <!--  JQuery CDN -->
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>

<script src="js/index.js" defer></script>
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
	
	
	

});// ready


</script>

</head>
<style type="text/css">
@import url("css/header.css");

@import url("css/columns.css");

@import url("css/sidebar.css");

@import url("css/footer.css");

@import url("css/mypage.css");


</style>


<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<li><a href="../showCustomer.do?id=${rvo.custId}">마이페이지</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<li><a href="#">장바구니</a></li>
		</ul>
		

		
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	

	
	
	 <div id="quick">
	 <ul>
	 	<li><h2>퀵메뉴</h2></li>
	 	<li><a href="login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
	 	<li><a href="../logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
	 	<li><a href="../showCustomer.do?id=${rvo.custId}"><i class="fas fa-info-circle">마이페이지</i></a></li>
	 </ul>	
	 </div>
	
	<div class="columns">
			<div class="menu">
				<ul><br>
					<li><h4><span id="menu1">회원 공간</span></h4></li>
					<li><a href="updateInfo.jsp"> 회원정보수정 </a></li>
					<li><a href="#"> 장바구니 </a></li>
					<li><a href="../pizzaMenu.do"> 메뉴 </a></li>
				</ul>
				
			</div>			
			
			<div class="wrap1">
				<ul>
					<li><h4><span id="menu2"><i class="fas fa-pizza-slice"></i> 마이페이지 </span></h4></li>
					<li>아이디 : ${rvo.custId}</li>
					<li>이름 : ${rvo.custName}</li>
					<li>주소 : ${rvo.custAddr}</li>
					<li>연락처 : ${rvo.custContact}</li>
					<li>이메일 : ${rvo.custEmail}</li>
				</ul>
				
				<ul>
					<li><h4><span id="menu3"> 주문내역 및 장바구니 </span></h4></li>					
					
				</ul>
			</div>
		
	</div>
	
	<div class ="columns2">
		<div class ="wrap2">
		
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