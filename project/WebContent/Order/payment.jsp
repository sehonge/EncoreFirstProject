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
<script type="text/javascript" src="${pageContext.request.contextPath}/Order/js/payment.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/payment.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">

<style>
	body{
    	margin: 0 auto;
    	width: 100%;
	}

	#footer{
	  clear:both;
	}
</style>
<script>
$(function(){

	$(window).scroll(function(){
		var scrollTop = $(document).scrollTop();
		if (scrollTop < 130) {
		 scrollTop = 130;
		}
		$("#quick").stop();
		$("#quick").animate( { "top" : scrollTop });
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
		<li><a href="${pageContext.request.contextPath}/PizzaMenu.do">메뉴</a></li>
		<li><a href="${pageContext.request.contextPath}/showCustomer.do?id=${vo.id}">마이페이지</a></li>
		<li><a href="${pageContext.request.contextPath}/Main/register.jsp">회원가입</a></li>
		<li><a href="${pageContext.request.contextPath}/Order/cartView.jsp">장바구니</a></li>
	</ul>
	
	<a href="#" class="navbar__toogleBtn">
		<i class="fas fa-book-open"></i>
	</a>
</nav>

<div id="quick">
	 <ul>
	 	<li><h2>퀵메뉴</h2></li>
	 	<li><a href="${pageContext.request.contextPath}/Main/login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
	 	<li><a href="${pageContext.request.contextPath}/logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
	 	<li><a href="${pageContext.request.contextPath}/Main/Mypage.jsp"><i class="fas fa-info-circle">마이페이지</i></a></li>
	 </ul>	
 </div>

<!-- main -->
<div id="custId" style="display:none;">${rvo.custId}</div>
<div id="custAddr" style="display:none;">${rvo.custAddr}</div>
<div id="shopId" style="display:none;">${param.shopId}</div>


<h1 style="margin-left:10%">결제</h1>
<main>
	<div id="section">
		
		<h3>고객 및 주소 정보 확인</h3>
		<table>
				<tr>
					<th>주문 유형</th><td>${param.type}</td>
				</tr>
				<tr>
					<th>수령인</th><td>${rvo.custName}</td>
				</tr>
				<tr>
					<th>연락처</th><td>${rvo.custContact}</td>
				</tr>
				<tr>
					<th>${param.type} 주소</th><td>${param.addr}</td>
				</tr>
		</table>
	</div>

    <aside>
      <div class="summary">
        <div class="summary-total-items">주문확인</div>
        <div id="summaryList">
          <!-- Insert summary information from localStorage here (jQuery) -->
        </div>
        <div class="summary-total">
          <div class="total-title">최종결제금액</div>
          <div class="total-value final-value" id="basket-total"><font color="red" size="5em"></font></div>
        </div>
        <div class="summary-checkout">
          <button class="checkout-cta">결제하기</button>
        </div>
      </div>
    </aside>
</main>

  <!-- footer -->
  <footer id="footer">
		<br><br><br><br><br><br>
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