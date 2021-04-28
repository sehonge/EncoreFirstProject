<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
<c:choose>

	<c:when test="${!empty vo}">
		<b>${vo.name}님 로그인 성공!!</b><br>
		<a href="index.jsp">Home...</a>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("로그인 부터 진행하시기 바랍니다!");
			location.href="login.jsp";
		</script>
	</c:otherwise>
	
</c:choose>
 -->
<!-- 
<c:choose>
	<c:when test="${!empty vo}">
		<a href="showCustomer.do?id=${vo.id}">마이페이지</a>
	</c:when>
	
	<c:otherwise>
		<script>
			alert("로그인 부터 진행하시기 바랍니다!");
			location.href="login.jsp";
		</script>
	</c:otherwise>
</c:choose>
 -->


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
	$('.menu_btn').click(function(ev){
		
	    $('.menu_bg').show(); 
	    $('.sidebar_menu').show().animate({
				 right:0 
	   });

		 $('.close_btn>a').on('click', function(){
	         $('.menu_bg').hide(); 
	         $('.sidebar_menu').animate({
	             right: '-' + 50 + '%'},function(){
	             	$('.sidebar_menu').hide(); 
	             }); 
	                     });
	    

	}); //click
	
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
@import url("css/hamburger.css");
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
			<li><a href="pizzamenu.do">메뉴</a></li>
			<li><a href="showCustomer.do?id=${vo.id}">마이페이지</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<li><a href="#">장바구니</a></li>
		</ul>
		
		<div class="menu_btn"><a href="#">       
        <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjQgNmgtMjR2LTRoMjR2NHptMCA0aC0yNHY0aDI0di00em0wIDhoLTI0djRoMjR2LTR6Ii8+PC9zdmc+">
        </a>
        </div>


		<div class="menu_bg"></div>
		<div class="sidebar_menu">
    	<div class="close_btn"><a href="#">       
         <img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij48cGF0aCBkPSJNMjMuOTU0IDIxLjAzbC05LjE4NC05LjA5NSA5LjA5Mi05LjE3NC0yLjgzMi0yLjgwNy05LjA5IDkuMTc5LTkuMTc2LTkuMDg4LTIuODEgMi44MSA5LjE4NiA5LjEwNS05LjA5NSA5LjE4NCAyLjgxIDIuODEgOS4xMTItOS4xOTIgOS4xOCA5LjF6Ii8+PC9zdmc+">
         </a>
		     </div>
		     <ul class="menu_wrap">
		          <li><a href="Index.jsp">Home</a></li>
		          <li><a href="pizzamenu.do">메뉴</a></li>
		          <li><a href="showCustomer.do?id=${vo.id}">마이페이지</a></li>
		          <li><a href="register.jsp">회원가입</a></li>
		          <li><a href="#">장바구니</a></li>
		     </ul>
		</div>


		
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	

	
	
	 <div id="quick">
	 <ul>
	 	<li><h2>퀵메뉴</h2></li>
	 	<li><a href="login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
	 	<li><a href="logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
	 	<li><a href="showCustomer.do?id=${vo.id}"><i class="fas fa-info-circle">마이페이지</i></a></li>
	 </ul>	
	 </div>
	
	<div class="columns">
		<div class="menu">
				<ul><br>
					<li><h4><span id="menu1">회원 공간</span></h4></li>
					<li><a href="updateInfo.do"> 회원정보수정 </a></li>
					<li><a href="#"> 장바구니 </a></li>
					<li><a href="pizzamenu.do"> 메뉴 </a></li>
				</ul>
			</div>	
			
			
			
		<div class="wrap">
			여기에 이제 마이페이지 내용들.
			${info.id}
			${info.pw}
			${info.odod}
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