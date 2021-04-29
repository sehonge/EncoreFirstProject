/**
 * 피자 상세페이지]
 * 1. 사이즈 선택 : 둘 중 하나만 클릭
 * 2. 수량선택 : +- 수량 증가 감소
 */

//1. 사이즈 선택  (출처 https://bbbootstrap.com/snippets/select-course-radio-options-card-59736723)
$(document).ready(function () {
	$('.radio-group .radio').click(function () {
		$('.selected .fa').removeClass('fa-check');
		$('.radio').removeClass('selected');
		$(this).addClass('selected');
	});
});

