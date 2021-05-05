<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 우리모두</title>
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
	
	$(".hover").mouseleave(
			  function () {
			    $(this).removeClass("hover");
			  }
			);
	
	
	

});// ready


</script>

</head>
<style type="text/css">
@import url("css/header.css");

@import url("css/columns.css");

@import url("css/sidebar.css");

@import url("css/Index.css");

@import url("css/IndexColumns.css");

@import url("css/footer.css");

@import url("css/IndexColumns2.css");

</style>


<body>
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<li><a href="../showCustomer.do?id=${vo.id}">마이페이지</a></li>
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
		 	<li><a href="../showCustomer.do?id=${vo.id}"><i class="fas fa-info-circle">마이페이지</i></a></li>
		 </ul>	
	 </div>
	
	<div class="columns1">
		<div class="item1">
			<div class="hover_effect_box hover_effect_5">
			  <div class="content_bg">
			  	<h1> 나만의 피자를 만들어 봅시다.</h1>
			  	<img src="https://t1.daumcdn.net/cfile/tistory/242FB135532BA4A22A">
			  </div>
			  <div class="caption">
			    <div class="caption_title">D.I.Y 피자만들기</div>
			    <div class="caption_desc">
			      원하는 토핑을 통해 <br>
			      자신이 원하는 피자를 <br>
			      만들어 봅시다.
			    </div>
			    <a href="#" class="caption_link">바로가기</a> 
			  </div>
			</div>
		</div>
	</div>
	
	<div class="columns2">
		<div class = "item2">
			<figure class="snip1382">
			  <img src="https://www.thedrive.co.kr/news/data/20210414/p1065592732779788_824_thum.jpg"/>
			  <figcaption>
			    <h2> 원하고자 하는 토핑을 골라서 먹자!</h2>
			    <br><br>
			    <p>다양하고, 맛있는 토핑들을 골라서 나만의 피자를 만들어 보자!</p>
			    <div class="icons"><a href="#"><i class="ion-chatbubbles"></i></a>
			      <a href="#"><i class="fas fa-smile-wink"></i></a>
			    </div>
			  </figcaption>
			</figure>
			
			<figure class="snip1382 hover"><img src="http://img2.tmon.kr/cdn3/deals/2020/09/23/4430738322/4430738322_catlist_3col_v2_385d06c854.jpg">
			  <figcaption>
			    <h2> 포장, 배달 다 가능합니다! </h2><br><br>
			    <p> 코로나로 힘든 시기 맜있는 피자로 극복해봅시다!! </p>
			    <div class="icons"><a href="#"><i class="ion-chatbubbles"></i></a>
			      <a href="#"> <i class="fas fa-smile-wink"></i></a>
			    </div>
			  </figcaption>
			</figure>					
		</div>	
	</div>
	
	
	
	<div class="columns3">
		<div class = "item3">
			<div>
				<h3> 엔코아 학생 </h3><br>
				<p> 20% 할인 </p>
			</div>
			
			<div>
				<h3> 방문 포장 </h3><br>
				<p> 2000원 할인 </p>
			</div>
			<div>
				<h3> 현금 결제 </h3><br>
				<p> 2000원 할인 </p>
			</div>
			<div>
				<h3> 2+1 </h3><br>
				<p> 2판 주문시, 1판 증정 </p>
			</div>
			<div>
				<h3> 엔코아카드 </h3><br>
				<p> 30%할인 </p>
			</div>
		
		</div>
	</div>
	
	
	
	
	<br>
	<br>
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