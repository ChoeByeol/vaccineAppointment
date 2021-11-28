/*
 * 멤버 회원가입 주소 검색 모듈
 * 
 *  .find-address-btn을 누르면 자동으로 주소검색창이 나옴
 *  
 *  - input[name=memberPostcode] 에 우편번호 작성
 *  - input[name=memberAddress] 에 기본주소 작성
 *  - input[name=memberDetailAddress] 에 커서 이동
 * 
 * 
 */
 $(function(){
	$(".find-address-btn").click(function(){
    	findAddress();
    });
    function findAddress(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ""; // 주소 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === "R") { // 사용자가 도로명 주소를 선택했을 경우
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== "" && /[동|로|가]$/g.test(data.bname)){
                        addr = data.roadAddress + " (" + data.bname + ")";
                    }
                    else{
                        addr = data.roadAddress;
                    }
                } 
                else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.querySelector("input[name=memberPostcode]").value = data.zonecode;
                //$("input[name=postcode]").val(data.zonecode);
                document.querySelector("input[name=memberAddress]").value = addr;
                //$("input[name=address]").val(addr);
                
                //원래 써있던 값지우기
            	document.querySelector("input[name=memberDetailAddress]").value = null;
                // 커서를 상세주소 필드로 이동한다.
                document.querySelector("input[name=memberDetailAddress]").focus();
                //$("input[name=detailAddress]").focus();
            }
        }).open();
    };
 });