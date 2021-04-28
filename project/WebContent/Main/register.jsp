<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <!--  
    	Ajax로 (비동기)로 -- ID,email 중복체크
    	idCheckDo?
    	emailCheckDo? 2개다 만드!?
    	
     -->
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 회원가입 </title>
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
	//scroll
	
	
	function startRequest() {
		var id = document.registerFrm.id.value; // alert(id);
		resultView = document.getElementById("idCheckResult");

		if (id.length < 4) {
			resultView.innerHTML = "<font color = red> ID는 4글자 이상이어야 합니다. </font>";
			return;
			
		}
		
		// if가 true가 아니라면 비동기 통신으로 로직을 전개.
		xhr = new XMLHttpRequest();
		xhr.onreadystatechange = callback;
		
		xhr.open("post","idCheck.do", true);
		
    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

		xhr.send("id="+id); // Parameter 명 정하기.
	}
	
	
	function callback (){
		if(xhr.readyState == 4 ){
			if ( xhr.status == 200 ){
				var flag = xhr.responseText; // String 으로 넘어온다는거.
				
				resultView = document.getElementById("idCheckResult");

				if(flag == 'true') {
					resultView.innerHTML = "<font color = #D88019><b> 해당 ID 사용 불가 </b></font>";
					
				}else {
					resultView.innerHTML = "<font color = #00E200><b> 해당 ID 사용 가능 </b></font>";
				}
				
				
				
			}
		}
		
	}
	
	
	
	
	
	
	
	

});// ready


function passCheck() {
	//비밀번호가 일치하지 않으면 페이지 이동 안되도록...
	//메세지 띄워주고
	var f = document.registerFrm;
	if(f.password.value != f.repassword.value){
		alert("비밀번호가 일치하지 않습니다");
		f.repassword.value="";
		f.repassword.focus();
		return false;
	}
}

	var xhr;
	var resultView;
	
	


</script>

</head>
<style type="text/css">
@import url("css/header.css");
@import url("css/hamburger.css");
@import url("css/sidebar.css");
@import url("css/registerBody.css");
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
	
	<div class="columns">
			<div class="menu">
				<ul><br>
					<li><h4><span id="menu1">회원 공간</span></h4></li>
					<li><a href="login.jsp"> 로그인 </a></li>
					<li><a href="register.jsp"> 회원가입 </a></li>
					<li><a href="findId.jsp"> 아이디 찾기 </a></li>
					<li><a href="findPw.jsp"> 비밀번호 찾기 </a></li>
				</ul>
			</div>
		
		<form action="register.do" class="registerFrm" name="registerFrm">
			<div class="logo">
				<h1><i class="fas fa-pizza-slice"></i> 8자피자 회원가입</h1>
			</div>
			
					<div>
						<h3> 
							<label for="id">아이디</label>
						</h3>
						<span class="id_box">
							<input type="text" id="id" maxlength="16" onkeyup="startRequest()" required>
							<input type="button" value="ID Check" id="checkButton" onclick="startRequest()">
							<span id="idCheckResult"></span>
						</span>		
						<span class="error_next_box"></span>
					</div>
					
					<div>
						<h3> 
							<label for="password"> 비밀번호, 비밀번호 확인 </label>
						</h3>
						<span class="pass_box">
							<input type="password" id="password" name="password" maxlength="20" required>
							<input type="password" id="repassword" name="repassword" maxlength="20" placeholder="비밀번호 확인" required>
						</span>
						<span class="error_next_box"></span>
					</div>
					
					<div>
						<h3>
							<label for="name">이름</label>
						</h3>
						<span class="name_box">
							<input type="text" id="name" maxlength="20">
						</span>
						<span class="error_next_box"></span>
					</div>
					
	 				<div>
	 					<h3>
	 						<label for="address">주소</label>
	 					</h3>
	 					<span>
	 						<input type="text">
	 					</span>
	 				</div>
	 				
	 				<div>
	 					<h3>
	 						<label for="phoneNo">휴대전화</label>
	 					</h3>
	 					<span class="mobile_box">
	 						<input type="tel" id="mobile" maxlength="11" placeholder="전화번호 입력 - 빼고" required>
	 					</span>
	 				</div>
	 				
	 				<div>
	 					<h3>
	 						<label for="email">E-Mail</label>
	 					</h3>
	 					<span class="mobile_box">
	 						<input type="email" id="email" placeholder="E-Mail" name="email" required>
	 						<input type="button" value="email Check" onclick="" id="checkButton">
	 						
	 					</span>
	 				</div>
	 				
	 				<div class="btn_area">
	 					<button type="submit" id="registerBtn">
	 						<span>가입하기</span>
	 					</button>
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