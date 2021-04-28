/**
 * 피자 커스텀 페이지
 * 1. 도우 선택 : 도우 사이즈 M/L 선택시 이미지 M/L 변경
 * 2. 토핑 선택 : 토핑 선택시 도우에 적용
 * 4. 수량 선택 : 수량에 따라 총 금액*n 계산
 * 3. 계산 : 총 금액 = (도우+토핑(종류*개수))*수량
 */

//1. 도우선택시 이미지 변경
$(document).ready(function(){
        /*웹페이지 열었을 때*/
        $("#dough_L").show();
        $("#dough_M").hide();
 
        /*L을 클릭했을 때 dough_L를 보여줌*/
        $("#L").click(function(){
            $("#dough_L").show();
            $("#dough_M").hide();
            });
 
        /*M을 클릭했을 때 dough_M을 보여줌*/
        $("#M").click(function(){
            $("#dough_M").show();
            $("#dough_L").hide();
        });
    });


//2. 토핑선택
