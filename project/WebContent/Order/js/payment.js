/**
 * 
 */
$(function(){
	loadPage();
	
	$('.checkout-cta').on('click',function(e){
	  //보낼것 -> menu String, shop_id, address
	  
	  /*var menuStr = [];
	  for(var i=0; i<$('.summary-list').length; i++){
	  	var name = $('.summary-list').eq(i).children().children('.summary-pizza').text();
	  	var size = $('.summary-list').eq(i).children().children('.summary-size').text();
	  	var quantity = $('.summary-list').eq(i).children().children('.summary-quantity').text();
	  	var subtotal = $('.summary-list').eq(i).children().children('#basket-subtotal').text().replace(',','');
	  	var menu = name+'/'+size+'/'+quantity+'/'+subtotal;
	  	menuStr.push(menu)
	  }
	  menuStr.join(',');*/
	  //alert(menuStr);
	  var custId = $('#custId').text();
	  var menuId = [];
	  for(var i=0; i<localStorage.length; i++){
	  	if(localStorage.getItem(localStorage.key(i)).endsWith(custId)){
	  	  var qty = parseInt(localStorage.getItem(localStorage.key(i)).split(",")[3]);
	  	  for(var j=0; j<qty; j++){
	  	    menuId.push(localStorage.key(i));
	  	  }
	  	}
	  }
	  menuId.join(',');
	  //alert(menuId);
	  /*var quantityList = [];
	  for(var key in localStorage){
		if(key=='length') break; 
		var data = localStorage.getItem(key).split(",");
		if(localStorage.getItem(key).endsWith(custId)){
			quantityList.push(data[3]);
		}
	  }
	  quantityList.join(',');*/
	  //alert(quantityList);
	  var address = $('#section table tr').eq(3).children().next().text();
	  //alert(address);
	  
	  var shopId = $('#shopId').text();
	  //alert(shopId);
	  e.preventDefault(); 
	  var form = document.createElement('form');
	  var objs1;
	  var objs2;
	  var objs3;
	  //var objs4;

	  objs1 = document.createElement('input');
	  objs2 = document.createElement('input');
	  objs3 = document.createElement('input');
	  //objs4 = document.createElement('input');

	  objs1.setAttribute('type','hidden');
	  objs1.setAttribute('name', 'menuId');
	  objs1.setAttribute('value', menuId);
	  objs2.setAttribute('type','hidden');
	  objs2.setAttribute('name', 'shopId');
	  objs2.setAttribute('value', shopId);
	  objs3.setAttribute('type','hidden');
	  objs3.setAttribute('name', 'address');
	  objs3.setAttribute('value', address);
	  //objs4.setAttribute('type','hidden');
	  //objs4.setAttribute('name', 'quantityList');
	  //objs4.setAttribute('value', quantityList);
	  
	  form.appendChild(objs1);
	  form.appendChild(objs2);
	  form.appendChild(objs3);
	  //form.appendChild(objs4);
	  
	  form.setAttribute('method', 'post');
	  form.setAttribute('action', "/project/makeOrder.do"); //
	  document.body.appendChild(form);
	  form.submit();
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
	$('#summaryList').append(html);
	$('#basket-total').children().html(totalPrice.toString().substr(0,totalPrice.toString().length-3)+","+totalPrice.toString().substr(-3,3));

	$('.summary-list').each(function() {
	  if($(this).is(':contains(NULL)')){
		$(this).find('.summary-size').text('\xa0');
	  }
	});
}