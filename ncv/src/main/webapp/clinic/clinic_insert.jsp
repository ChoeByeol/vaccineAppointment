<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
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
                    document.querySelector("input[name=clinicPostcode]").value = data.zonecode;
                    //$("input[name=postcode]").val(data.zonecode);
                    document.querySelector("input[name=clinicAddress]").value = addr;
                    //$("input[name=address]").val(addr);
                    
                    //시도
                    document.querySelector("input[name=clinicSido]").value = data.sido;
                    //시군구 (세종시는 sigungu에 null이 들어가서 따로 처리)
                    if(document.querySelector("input[name=clinicSido]").value == "세종특별자치시"){
                    	document.querySelector("input[name=clinicSigungu]").value = "세종시";
                    }
                    else{
	                    document.querySelector("input[name=clinicSigungu]").value = data.sigungu;
                    }
                    //읍면동
                    document.querySelector("input[name=clinicBname]").value = data.bname;
               
                    
                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("input[name=clinicDetailAddress]").focus();
                    //$("input[name=detailAddress]").focus();
                }
            }).open();
        };
    });
</script>

<form action="clinicInsert.txt" method="post">
	<input type="text" name="clinicName" placeholder="병원 이름">
	<br>
	<input type="text" name="clinicTel" placeholder="병원 전화번호">
	<br>
	<textarea name="clinicTime" placeholder="병원 운영시간" rows="10" cols="60"></textarea>
	<br>
    <input type="text" name="clinicPostcode" placeholder="우편번호">
    <button type="button" class="find-address-btn">주소 찾기</button><br>
    <input type="text" name="clinicAddress" placeholder="주소">
    <br>
	<input type="text" name="clinicDetailAddress" placeholder="상세주소">
	<br>
	<!-- 히든으로 타입바꿔서 넣어야함 플레이스홀더도 지우고 -->
	<input type="text" name="clinicSido" placeholder="광역시도">
	<input type="text" name="clinicSigungu" placeholder="시군구">
	<input type="text" name="clinicBname" placeholder="읍면동">
	<br>
	<input type="submit" value="병원 등록">
</form>
