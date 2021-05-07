<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/cartView.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/Order/js/cartView.js"></script>
<style type="text/css">
	#footer{
		clear:both;
	}

</style>
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
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<li><a href="../showCustomer.do">마이페이지</a></li>			
			<li><a href="${pageContext.request.contextPath}/basket.do">장바구니</a></li>
		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	
	 <div id="quick">
		 <ul>
		 	<li><h2>퀵메뉴</h2></li>
		 	<li><i class="fas fa-trophy">${rvo.custName} 님</i></li>
			 <li><a href="../showCustomer.do"><i class="fas fa-info-circle">마이페이지</i></a></li>
			 <li><a href="../logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
			 
		 
		 </ul>	
	 </div>
 
<!-- main -->
<div id="custId" class='hide'>${rvo.custId}</div>
<h1 style="margin-left:10%; color:black;">장바구니</h1>
<main>
    <div class="basket">
      <div class="basket-labels">
        <ul>
          <li class="select"><input type="checkbox" id="selectAll"></li>
          <li class="item item-heading"><strong>제품</strong></li>
          <li class="quantity"><strong>수량</strong></li>
          <li class="subtotal-heading"><strong>가격</strong></li>
        </ul>
      </div>
      <!-- Insert basket information from localStorage here (jQuery) -->
      <div id="basketList"></div>
      <div class="bottomBtn">
	   	<button class="bottomBtn-remove">선택 제품 삭제</button>
	   	<button class="bottomBtn-cont" onclick="location.href='${pageContext.request.contextPath}/PizzaMenu.do'">계속 메뉴 고르기</button>
	  </div>
    </div>
 
    <aside>
      <div class="summary">
        <div class="summary-total-items">주문계산</div>
        <div id="summaryList">
          <!-- Insert summary information from localStorage here (jQuery) -->
        </div>
        <div class="summary-total">
          <div class="total-title">결제예정금액</div>
          <div class="total-value final-value" id="basket-total"><font color="red" size="5em"></font></div>
        </div>
        <div class="summary-checkout">
          <button class="checkout-cta">주문하기</button>
        </div>
      </div>
    </aside>
  </main>
  
  <!-- footer -->
  <footer id="footer">
		<br><br><br><br><br><br><br><br>
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