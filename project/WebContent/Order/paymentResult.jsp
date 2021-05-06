<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@300&display=swap" rel="stylesheet">
<title> 8자피자 우리모두</title>
<script src="https://kit.fontawesome.com/8ab89a6252.js" crossorigin="anonymous"></script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">

<style>
	body{
    	margin: 0 auto;
    	width: 100%;
	}
	
	button{
		cursor:pointer;
		border: 1px solid #aaa;
		outline:0 none;
		border-radius:3px;
		padding:4px 0;
		width:100px;
	}
	
	button:hover{
	  background-color:#91F8D0;
	}
	
	#checkOrder{
		width:150px;
		padding:6px 0;
		background-color: #666;
		color:white;
	}
	
	#checkOrder:hover{
		background-color:#91F8D0;
		color:black;
	}
	#invoice-POS{
	  box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
	  padding:2mm;
	  margin: 0 auto;
	  background: #FFF;
  
	::selection {background: #f31544; color: #FFF;}
	::moz-selection {background: #f31544; color: #FFF;}
	h1{
	  font-size: 1.5em;
	  color: #222;
	}
	h2{font-size: .9em;}
	h3{
	  font-size: 1.2em;
	  font-weight: 300;
	  line-height: 2em;
	}
	p{
	  font-size: .5em;
	  color: #666;
	  line-height: 1.2em;
	}
	 
	#top, #mid,#bot{ /* Targets all id with 'col-' */
	  border-bottom: 1px solid #EEE;
	}
	
	#top{min-height: 100px;}
	#mid{min-height: 80px;} 
	#bot{ min-height: 50px;}
	
	#top .logo{
	    align:center;
		height: 60px;
		width: 60px;
		background-size: 60px 60px;
		background-color:lightgrey;
	}
	.clientlogo{
	  float: left;
		height: 60px;
		width: 60px;
		background: url(http://michaeltruong.ca/images/client.jpg) no-repeat;
		background-size: 60px 60px;
	  border-radius: 50px;
	}
	.info{
	  display: block;
	  float:left;
	  margin-left: 0;
	}
	
	.title{
	  float: right;
	}
	.title p{text-align: right;} 
	table{
	  width: 100%;
	  border-collapse: collapse;
	}
	td{
	  padding: 5px 0 5px 15px;
	  border: 1px solid #EEE
	}
	.tabletitle{
	  padding: 5px;
	  font-size: .5em;
	  background-color: #EEE;
	}
	.service{border-bottom: 1px solid #EEE;}
	.item{width: 24mm;}
	.itemtext{font-size: .5em;}
	
	#legalcopy{
	  margin-top: 5mm;
	}
	
	}
    #footer {
	  position:absolute;
	  left:0;
	  right:0;
	  bottom:0;
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
	
	loadPage();
	
	$("#dialog").dialog({
		autoOpen: false,
		scrollable: true,
		height: 525,
        width: 400,
		show:{
			effect: "fade",
			duration: 1000
		},
		hide:{
			effect: "blind",
			duration: 500
		}
	});
	
	$('#checkOrder').on('click', function(){
		$('#dialog').dialog("open");
	});
	
	$('.logout').on('click', function(){
	  var custId = $('#custId').text();
	  for(var key in localStorage){
	    if(localStorage.getItem(key).endsWith(custId)){
	      localStorage.removeItem(key);
	      location.href='${pageContext.request.contextPath}/logout.do';
	    }
	  }
	});
	
});

function loadPage(){
	var html = "";
	var totalPrice = 0;
	var custId = $('#custId').text();
	for(var key in localStorage){
		if(key=='length') break; 
		var data = localStorage.getItem(key).split(",");
		if(localStorage.getItem(key).endsWith(custId)){
			html +=
				'<tr class=service style=text-align:center;>'+
					'<td class=tableitem><p class=itemtext>'+data[1]+'</p></td>'+
					'<td class=tableitem><p class=itemtext>'+data[3]+'</p></td>'+
					'<td class=tableitem><p class=itemtext>'+(data[5].substr(0,data[5].length-3)+','+data[5].substr(-3,3))+'원</p></td>'+
				'</tr>';

		}
	}
	$('#tableLabel').after(html);
}

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
	 	<li><a class="logout" href="${pageContext.request.contextPath}/logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
	 	<li><a href="${pageContext.request.contextPath}/Main/Mypage.jsp"><i class="fas fa-info-circle">마이페이지</i></a></li>
	 </ul>	
 </div>

<!-- main -->
<div id="custId" style="display:none;">${rvo.custId}</div>
<h1 align="center">결제가 완료 되었습니다!<br>감사합니다.</h1>
<hr align="center" width="30%"><br>
<div align="center">
	<button id="checkOrder"><strong>주문내역 확인</strong></button>
</div><br/>
<div align="center">
	<button onclick="location.href='${pageContext.request.contextPath}/Main/Index.jsp'">홈으로</button><br/><br/>
	<button class="logout">로그아웃</button>
</div>

<div id="dialog" title="주문 내역">
    <div id="invoice-POS">
    
    <div id="top">
      <div class="logo" align="center" style="background-color:lightgrey;"><img src="${pageContext.request.contextPath}/Order/img/logo.png"></div>
    </div>
    
    <div id="mid">
      <div class="info">
        <p> 
            [수령인]  ${rvo.custName}<br>
            [고객주소]  ${order.orderAddr}<br>
            [연락처]  ${rvo.custContact}<br>
            [주문일자]  ${order.orderDate}<br>
            [주문번호]  ${order.orderId}<br>
        </p>
      </div>
    </div>
    
    <hr style="border: 2px dashed black;" />
    
    <div id="bot">

					<div id="table" style="border-bottom:2px dashed black;">
						<table style="border-collapse:collapse; width:100%;">
							<tr id="tableLabel" class="tabletitle" style="border-bottom:2px dashed black; padding-bottom:10px;">
								<th class="item">제품</th>
								<th class="Hours">수량</th>
								<th class="Rate">가격</th>
							</tr>
							
							<!-- insert order details here -->
							
							<tr class="tabletitle" style="text-align:center;border-top:2px dashed black;">
								<td></td>
								<td class="Rate" style="text-align:right;"><h4>판매총액 :</h4></td>
								<td class="payment"><h4>${order.orderPrice}원</h4></td>
							</tr>

						</table>
					</div><!--End Table-->

					<div id="legalcopy">
						<p class="legal" align="center">감사합니다!<br>좋은 하루 되세요!
						</p>
					</div>

				</div><!--End InvoiceBot-->
  </div><!--End Invoice-->
</div>
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
</div>
</body>
</html>

