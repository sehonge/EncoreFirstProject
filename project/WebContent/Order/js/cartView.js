/**
 * 
 */

var fadeTime = 200;

/* Assign actions */

$(function() {
	
	refreshPage();
	
	$('.quantity input').change(function() { 
	  updateQuantity(this);
	});
	
	$('.bottomBtn-remove').click(function() {
	  removeItem();
	});
	
	$('.checkout-cta').on('click',function(){

	  if($('.basket-product').length == 0){
	  	alert('메뉴를 먼저 선택하세요.');
	  	location.href='/project/pizzaMenu.do';/*"/project/pizzaMenu.do"*/
	  	return false;
	  }
	  
	  saveCheckout();
      location.href='orderType.jsp';
	});
});

/* refreshPage */
function refreshPage(){
	//localStorage.setItem('P004-L', 'Menu/img/pizza_blackking.jpg,블랙킹 피자,L,2,24000,48000,date');
	//localStorage.setItem('S002', 'Menu/img/tomato_spaghetti.jpg,토마토 스파게티,NULL,2,5000,10000,date');
	var basketItems = "";
	var summaryItems = "";
	var totalPrice = 0;
	var custId = $('#custId').text();
	for(var key in localStorage){
		if(key=='length') break; 
		var data = localStorage.getItem(key).split(",");
		if(localStorage.getItem(key).endsWith(custId)){
			basketItems += 
			'<div class=basket-product>'+
	      	  '<div class=select>'+
	      	    '<input type=checkbox name=deleteCart value='+key+'>'+
	      	  '</div>'+
	          '<div class=item>'+
	            '<div class=product-image>'+
	              '<img src=../'+data[0]+' class=product-frame>'+
	            '</div>'+
	            '<div class=product-details>'+
	              '<p><strong>'+data[1]+'</strong></p>'+
	              '<p id=size>사이즈 - '+data[2]+'</p>'+
	            '</div>'+
	          '</div>'+
	          '<div class=hide>'+data[4]+'</div>'+
	          '<div class=quantity>'+
	            '<input type=number value='+data[3]+' min=1 max=9 class=quantity-field>'+
	          '</div>'+
	          '<div class=subtotal><font color=red size=5em>'+(data[5].substr(0,data[5].length-3)+','+data[5].substr(-3,3))+'</font></div>'+
	        '</div>';
			
			summaryItems +=
			'<div class=summary-list>'+
			  '<ul>'+
	            '<li class=summary-pizza>'+data[1]+'</li>'+
	            '<li class=summary-size>'+data[2]+'</li>'+
	            '<li class=summary-quantity>'+data[3]+'</li>'+
	            '<li class=summary-subtotal id=basket-subtotal>'+(data[5].substr(0,data[5].length-3)+','+data[5].substr(-3,3))+'</li>'+
	          '</ul>'+
			'</div><br/>';
			
			totalPrice += parseInt(data[5]);
		}
	}

	$('#basketList').append(basketItems);
	$('#summaryList').append(summaryItems);
	$('#basket-total').children().html(totalPrice.toString().substr(0,totalPrice.toString().length-3)+","+totalPrice.toString().substr(-3,3));

    $('.basket-product').each(function() {
	  if($(this).is(':contains(NULL)')){
		//var text = $(this).find('#size').text();
		//alert(text);
		$(this).find('#size').text('');
	  }
	});
	$('.summary-list').each(function() {
	  if($(this).is(':contains(NULL)')){
		$(this).find('.summary-size').text('\xa0');
	  }
	});
}

/* Recalculate cart */
function recalculateCart(index) {
  var total = 0;
  
  $('.summary-list').eq(index).find('.summary-quantity').text($('.basket-product').eq(index).find('.quantity input').val());
  $('.summary-list').eq(index).find('#basket-subtotal').text($('.basket-product').eq(index).find('.subtotal').children().text());

  /* Sum up row totals */
  $('.basket-product').each(function() {
    total += parseInt($(this).children('.subtotal').text().replace(',',''));
    
  });


  /* Calculate totals */
  var totalStr = total.toString();

  
    /* Update summary display. */
    $('.final-value').fadeOut(fadeTime, function() {
      $('#basket-total').children().html(totalStr.substr(0,totalStr.length-3)+","+totalStr.substr(-3,3));
      if (total == 0) {
        $('.checkout-cta').fadeOut(fadeTime);
      } else {
        $('.checkout-cta').fadeIn(fadeTime);
      }
      $('.final-value').fadeIn(fadeTime);
    });
}

/* Update quantity */
function updateQuantity(quantityInput) {
  /* Calculate line price */
  var price = parseInt(($(quantityInput).parent().prev().text().replace(',','')));
  var quantity = $(quantityInput).val();
  var linePrice = price * quantity;
  var linePriceStr = linePrice.toString();
  //alert(quantity);
  //alert(price);
  //alert(linePrice);
  //alert(typeof(linePrice));//number
  //alert(typeof(linePriceStr));//string
 
 var index = $(quantityInput).parent().parent().index();
 //alert(index);

  /* Update line price display and recalc cart totals */
 $(quantityInput).parent().next().children().each(function() {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePriceStr.substr(0,linePriceStr.length-3)+","+linePriceStr.substr(-3,3));
	  recalculateCart(index);
      $(this).fadeIn(fadeTime);
    });
  });
  
}

/* Remove item from cart */
function removeItem() {

  var check = document.getElementsByName("deleteCart");
		
	for(var i=0; i<check.length; i++){
		if(check[i].checked == true){
			localStorage.removeItem(check[i].value);
			location.reload();
		}
	}
}

/* Checking the checkbox on the label(top) checks all checkboxes */
$(function() {	
	$('#selectAll').click(function() {
        var checked = this.checked;
        $('input[type="checkbox"]').each(function() {
        	this.checked = checked;
    	});
    })
});

function saveCheckout(){
	var custId = $('#custId').text();
	for(var key in localStorage){
		if(key=='length') break;
		var data = localStorage.getItem(key).split(",");
		for(var i=0; i<$('.basket-product').length; i++){
			if($('.basket-product').eq(i).find('.select input').val() == key){
				//alert(key);
				localStorage.setItem(key, data[0]+','+data[1]+','+data[2]+','+
				$('.basket-product').eq(i).find('.quantity input').val()+','+data[4]+','+
				$('.basket-product').eq(i).find('.subtotal').children().text().replace(',','')+','+
				data[6]);
			}
		}
	}
}