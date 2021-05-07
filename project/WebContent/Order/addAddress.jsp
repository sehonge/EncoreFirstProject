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

<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/sidebar.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/Order/css/addAddress.css"> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/Main/css/footer.css">

<style>
	body{
    	margin: 0 auto;
    	width: 100%;
	}
	#section{
	  margin-left:10%; 
	  width:70%;
	}	
	
	#showList,#addList{
	  border-radius:0;
	  border: 1px solid #666;
	  padding:6px 0;
	  width:120px;
	  margin-left: 0px;
	     margin-right: 0px; 
	     margin-bottom:15px;
	     float: left;
	     cursor:pointer;
	     
	}
	
	#addList{
	  background-color: #666;
	  color: #fff;	
	}
	
	#showList:hover{
	  background-color: #666;
	  color: #fff;		  
	}
	
	table{
	  border-top: 2px solid darkgray;
	  border-bottom: 1px solid #ccc;
	  width:100%;
	  border-collapse: collapse;
	}	
	
	tr{
	  height:40px;
	}
	
	tr td font{
	  font-weight:bold;
	}
	
	
	#addrTb{
	   width:10%; 
	   background-color:#F8F8F8;
	   padding-left:10px;
	}
	
	#addrTbIn{
	  width:90%;
	}
	
	tr td input{
	  width:95%;
	  margin:0 10px;
	  padding:5px 5px;
	  border-radius:5px;
	  border:1px solid #ccc;
	}
	
	#confirm{
	  float:right;
	 
	}
	
	#confirm button{
	  cursor:pointer;
	  font-size: 1rem;
	  font-weight:bold;
	  background-color: #666;
	  color: #fff;	
	  border-radius:5px;
	  border: 1px solid #666;
	  padding: 0.625rem 0;
	  width:250px;
	}
	
	#confirm button:hover{
	  background-color:#91F8D0;
	  color:black;
	}	
    #footer {
	  position:absolute;
	  left:0;
	  right:0;
	  bottom:0;
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
		
		$('#inputAddr').on('click', function(){
			if($(this).val() == '주소를 입력해주세요.'){
				$(this).val('');
			}
		});
		
		$('#confirm button').on('click', function(){
			if($('#inputAddr').val() == '주소를 입력해주세요.'){
				alert('주소를 입력하세요.');
				$('#inputAddr').val('');
				$('#inputAddr').focus();
				return false;
			}
			  var address = $('#inputAddr').val();
			  var form = document.createElement('form');
			  var objs1;
			  objs1 = document.createElement('input');
			  objs1.setAttribute('type','hidden');
			  objs1.setAttribute('name', 'address');
			  objs1.setAttribute('value', address);
			  form.appendChild(objs1);
			  form.setAttribute('method', 'post');
			  form.setAttribute('action', "${pageContext.request.contextPath}/addAddress.do"); //use /project/project 
			  document.body.appendChild(form);
			  form.submit();
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
			<li><a href="${pageContext.request.contextPath}/pizzaMenu.do">메뉴</a></li>

			<c:choose>
				<c:when test="${!empty rvo}">
					<li><a href="${pageContext.request.contextPath}/showCustomer.do?id=${rvo.custId}">마이페이지</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath}/showCustomer.do">마이페이지</a></li>
				</c:otherwise>
			</c:choose>
			
			<li><a href="${pageContext.request.contextPath}/basket.do">장바구니</a></li>

		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
	
	 <div id="quick">
		 <ul>
		 	<li><h2>퀵메뉴</h2></li>
		 <c:choose>
		 	<c:when test="${!empty rvo}">
		 		<li><i class="fas fa-trophy">${rvo.custName} 님</i></li>
			 	<li><a href="${pageContext.request.contextPath}/showCustomer.do"><i class="fas fa-info-circle">마이페이지</i></a></li>
			 	<li><a href="${pageContext.request.contextPath}/logout.do"><i class="fas fa-sign-out-alt">로그아웃</i></a></li>
			 </c:when>
			 <c:otherwise>	
		 		<li><a href="${pageContext.request.contextPath}/Main/login.jsp"><i class="fas fa-sign-in-alt">로그인</i></a></li>
		 		<li><a href="${pageContext.request.contextPath}/Main/register.jsp"><i class="fas fa-registered">회원가입</i></a></li>
		 	</c:otherwise>
		 </c:choose>
		 
		 </ul>	
	 </div>

 
<!-- main -->
<h1 style="margin-left:10%">배달 주소 추가</h1>
<div id="section">
	<button id="showList" onclick="location.href='${pageContext.request.contextPath}/deliveryAddress.do'">주소 리스트</button>
	<button id="addList">주소 추가</button><br/><br/>
	<table>
		<tbody>
			<tr>
				<td id="addrTb"><font>주소</font></td><td id="addrTbIn"><input id="inputAddr" type="text" value="주소를 입력해주세요."></td>
			</tr>
		</tbody>
	</table><br/>
	<div id="confirm">
		<button>주소 추가하기</button><!-- addAddress.do로 입력한 address를 가지고 이동 -->
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