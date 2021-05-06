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

<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/delivery.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">

<style>
	body{
    	margin: 0 auto;
    	width: 100%;
	}

    #footer {
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
	
	$('#confirm button').on('click',function(){
		flag = false;
		
		if($('tbody tr').length == 0){
			alert('주소를 먼저 추가하세요.');
			location.href='${pageContext.request.contextPath}/Order/addAddress.jsp';
			return false;
		}
		
		$('input:radio[name=select]').each(function(){
			if($(this).is(':checked')){
				var addr = $(this).parent().next().text();
				var shopId = -1;
				location.href='${pageContext.request.contextPath}/Order/payment.jsp?type=배달&addr='+addr+'&shopId='+shopId;
				flag = true;
			}
		})
		if(flag==false) alert('주소를 선택해주세요.');
		
	});
	
	$('.bottomBtn-remove').on('click',function(){
		$('input:radio[name=select]').each(function(){
			if($(this).is(':checked')){
				var address = $(this).parent().next().text();
				var form = document.createElement('form');
				  var objs1;
				  objs1 = document.createElement('input');
				  objs1.setAttribute('type','hidden');
				  objs1.setAttribute('name', 'address');
				  objs1.setAttribute('value', address);
				  form.appendChild(objs1);
				  form.setAttribute('method', 'post');
				  form.setAttribute('action', "${pageContext.request.contextPath}/deleteAddress.do"); 
				  document.body.appendChild(form);
				  form.submit();
				
			}
		})
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
<h1 style="margin-left:10%">배달 주소 선택</h1>
<div id="section">
	<button id="showList">주소 리스트</button>
	<button id="addList" onclick="location.href='${pageContext.request.contextPath}/Order/addAddress.jsp'">주소 추가</button><br/><br/>
	<table>
		<thead>
			<tr>
				<th width="10%">선택</th><th>주소</th>
			</tr>
		</thead>
		<tbody align="center">
		<!-- Get list of customer's saved addresses (use for loop) -->
			<c:forEach items="${DAList}" var="list">
				<tr>
					<td><input type="radio" name="select"></td><td>${list}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table><br/>
	<div class="bottomBtn">
	  <button class="bottomBtn-remove">선택 주소 삭제</button>
	</div><br/>
	<div id="confirm">
	  <button>주소 선택 완료</button>
	</div>
</div>

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