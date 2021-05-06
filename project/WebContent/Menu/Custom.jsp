<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
<title>Insert title here</title>
<script type="text/javascript">
 $(function(){ 
	//1. 기본 페이지 L사이즈를 디폴트
	 $("#dough_L").show();
	 $("#dough_M").hide();
	 
	//2.드레그 .. 이미지 복사 (http://jsfiddle.net/wJUHF/7/)
	 var counts = [0];
 	 var resizeOpts = { 
 	    handles: "all" ,autoHide:true
 	 }; 
 	 $(".side_img").draggable({
 	    helper: "clone",
 	    start: function() {counts[0]++;}
 	 });

    $("#article1").droppable({
	      drop: function(e, ui){
             if(ui.draggable.hasClass("side_img")) {
	        		var cost = counts[0]*2000;
	        		
            	 	refreshPositions: true
	        		
		            $(this).append($(ui.helper).clone());
		        	//Pointing to the dragImg class in dropHere and add new class.
		    	    $("#article1 .side_img").addClass("item-"+counts[0]);
		  	        $("#article1 .img").addClass("imgSize-"+counts[0]);	  	      	
		  	      	
		    	    //Remove the current class
		    	    $("#article1 .item-"+counts[0]).removeClass("side_img ui-draggable ui-draggable-dragging");
					
					$(".item-"+counts[0]).dblclick(function() {
					   	$(this).remove();
					   	counts[0] --;
					});
					
					make_draggable($(".item-"+counts[0])); 
			        $(".imgSize-"+counts[0]).resizable(resizeOpts);   
			        $("#costT").html(cost+"원 입니다.");
 	     	  }
        }
	  });

   	var zIndex = 0;
   	function make_draggable(elements){	
   		elements.draggable({
   			containment:'parent',
   			start:function(e,ui){ ui.helper.css('z-index',++zIndex); },
   			stop:function(e,ui){}
   			});
   		}      
	});

 
 //3.가격 계산하기
 function calc(){		
  	var pizzaL = 20000;
  	var pizzaR = 14000;
  	
  	var testString = $("#costT").html();	// 원래 문자열
  	console.log(testString);	
  	var sidecost = testString.replace(/[^0-9]/g,"");// 숫자가 아닌 문자열을 매칭하는 정규식			
  	console.log(sidecost);				
  	
  	
 	if(document.getElementById('btn_L').checked){
 		 //L을 클릭했을 때 dough_L를 보여줌
   	     $("#dough_L").show();
         $("#dough_M").hide();
         
      	 //가격 계산
         var costL = pizzaL+parseInt(sidecost);
 		 $("#cost").html(costL+"원 입니다.");
   		
   	}else if(document.getElementById('btn_R').checked){
   		 //M을 클릭했을 때 dough_M을 보여줌
   		 $("#dough_M").show();
         $("#dough_L").hide();
         
    	 //가격 계산
   		 var costR = pizzaR+parseInt(sidecost);
   		 $("#cost").html(costR+"원 입니다.");
  		
   	}else{q
   		 alert("피자 크기와 수량을 입력해주세요!");
   	}
 }; 
 
</script>
<link rel="stylesheet" type="text/css" href="Menu/css/Custom.css">
<link rel="shortcut icon" href="#">
</head>
<body>
	<!-- nav -->
	<nav class="navbar">
		<div class="navbar__logo">
			<i class="fas fa-pizza-slice"></i>
			<a href="Index.jsp">8자피자</a>
		</div>
		
		<ul class="navbar__menu">
			<li><a href="../pizzaMenu.do">메뉴</a></li>
			<li><a href="../showCustomer.do?id=${vo.id}">마이페이지</a></li>
			<li><a href="register.jsp">회원가입</a></li>
			<li><a href="basket.do">장바구니</a></li>
		</ul>
		
		<a href="#" class="navbar__toogleBtn">
			<i class="fas fa-book-open"></i>
		</a>
	</nav>
		
		
	<!-- 메뉴 -->
	<div class="menu_wrap">
		<div class="menu">
			<ul>
				<li><a href="pizzaMenu.do"><span>피자</span></a></li>
				<li><a href="sideMenu.do"><span>사이드/음료</span></a></li>
				<li><a href="customMenu.do"><span>나만의 피자</span></a></li>
			</ul>
		</div>
	</div>
			
			
	<section id="section" style="margin: 0 auto; width: 1300px; position: relative;">	
		<!-- 피자 이미지 -->
		<div id="article1" class="clearfix">
			<div class="imgcut">
				<img id="dough_L" alt="foodimage" src="Menu/img/dough_L.png">
				<img id="dough_M" alt="foodimage" src="Menu/img/dough_M.png">
			</div>	
		</div>
				
		<!-- 디테일 -->
		<div id="article2" class="clearfix">
			<!-- 피자 타이틀 -->
			<div class="title">
				<div class="name">나만의 피자</div>
				<p>토핑은 내맘대로, 나만의 피자를 만들어보세요!</p>
				<hr/>
			</div>
			
			<!-- 주문 버튼 -->
			<div class="size">
				<h2 align="left">사이즈 선택</h2>
				<!-- label안에 input을 넣으면 텍스트를 클릭해도 선택이 된다! -->
				<label class="radio"><input id="btn_L" type="radio" class="checks" name="size" value="L" checked="checked" onchange="calc()"><span>L 20000원</span></label>
				<label class="radio"><input id="btn_R" type="radio" class="checks" name="size" value="R" onchange="calc()"><span>R 14000원</span></label>
			</div>
			
			<!-- 토핑 -->
			<div class="side">
				<h2>토핑</h2><span style="color: #888888;">*토핑은 도우위에서 더블 클릭하여 취소할 수 있습니다!</span>
					<ul style="padding: 0px;">
						<c:forEach items="${list}" var="list">
						<li>
							<div class="side_img"><img id="foodimage" alt="foodimage" src="${list.pictureUrl}" draggable="true"  ondragstart="calc()"></div>
							<div class="side_name">${list.menuName}</div>
							<div class="side_cost">${list.menuPrice}원</div>
						</li>	
						</c:forEach>
					</ul>
					
			<!-- 결제 -->
			<div class="c">
				<div class="cost_box" style="width: 550px; height: 74px; inline-height: 74px; background-color: #f9f9f9;">
					<div class="cost_line">
					<span class="costall">총 금액</span><span id="cost">20000원 입니다.</span><br/>
				    <span class="topping">*토핑금액</span><span id="costT">0원 입니다.</span></div>
					<a href="basket.do" class="button" style="float: right; width: 150px; height: 50px; line-height: 50px; text-align: center; background-color: #ec4a4f; border: none; color: white; border-radius: 10px;"><span>담기</span></a>
				</div>
			</div>
		</div>
	</section>
</body>
</html>