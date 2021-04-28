<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> Login </title>
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
@import url("css/hamburger.css");
@import url("css/sidebar.css");
@import url("css/login.css");
@import url("css/loginBody.css");
@import url("css/footer.css");

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
	
	<div>
		
		
	</div>
	
	
	<div class="columns">
		<div class="menu">
				<ul><br>
					<li><h4><span id="menu1">회원 공간</span></h4></li>
					<li><a href="login.jsp"> 로그인 </a></li>
					<li><a href="register.jsp"> 회원가입 </a></li>
					<li><a href="showCustomer.do?id=${vo.id}">마이페이지</a>
					<li><a href="findId.jsp"> 아이디 찾기 </a></li>
					<li><a href="findPw.jsp"> PW 찾기 </a></li>
					<li><a href="updateInfo.jsp"> 회원정보수정 </a></li>
				</ul>
			</div>
			
	  	<form action="login.do" class="wrap">
	  	
	        <div class="login">
	         
	            <div class="login_id">
	            	<br><br>
	                <h4>ID</h4>
	                <input type="text" name="id" id="" placeholder="아이디" required>
	            </div>
	            <div class="login_pw">
	                <h4>Password</h4>
	                <input type="password" name="password" id="" placeholder="Password">
	            </div>
	            <div class="login_etc">
	                <div class="checkbox">
	                <input type="checkbox" name="" id=""> Remember Me?
	                </div>
	                <div class="forgot_pw">
	                <a href="findPw.jsp">Forgot Password?</a>
	                <a href="findId.jsp">Forget ID?</a>
	            </div>
	            </div>
	            <div class="submit">
	                <input type="submit" value="submit">
	            </div>
	        </div>
    	</form>
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