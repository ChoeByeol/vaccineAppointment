<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<jsp:include page="/template/header.jsp"></jsp:include>
<head>
    <style>
        .notice {
            color:red;
        }
    </style>
	 <script>	 
	 	//주민등록번호 성별 추출
	    $(function(){
	        $("input[name=memberRrn]").blur(function(){
	            var genderCode = $("input[name=memberRrn]").val().substring(6,7);
	            if(genderCode == "1" || genderCode =="3"){
	                $("input[name=memberGender]").val("남");
	            }
	            else if(genderCode == "2" || genderCode =="4"){
	                $("input[name=memberGender]").val("여");
	            }
	        });
	        
		//주소 찾기   	
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

        function idCheck(){
            var regex = /^[a-z][a-z0-9-_]{7,19}$/;
            var input = document.querySelector("input[name=memberId]");
            var notice = input.nextElementSibling;

            if(regex.test(input.value)){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "아이디는 8~20자 영문+숫자로 작성하세요";
                return false;
            }
        }

        function pwCheck(){
            var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
            var input = document.querySelector("input[name=memberPw]");
            var notice = input.nextElementSibling;

            if(regex.test(input.value)){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요";
                return false;
            }
        }
        function pw2Check(){
            var pwInput = document.querySelector("input[name=memberPw]");
            var pw2Input = document.querySelector("input[name=memberPw2]");
            var notice = pw2Input.nextElementSibling;

            if(pwInput.value.length > 0 && pwInput.value == pw2Input.value){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "비밀번호가 일치하지 않습니다";
                return false;
            }
        }
        function nameCheck(){
            var regex =  /^[가-힣]{2,17}$/;
            var input = document.querySelector("input[name=memberName]");
            var notice = input.nextElementSibling;

            if(regex.test(input.value)){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "이름은 한글 2~17자 내외로 작성하세요";
                return false;
            }
        }
        function rrnCheck(){
            var regex = /^[0-9]{6}[0-9]{7}$/;
            var input = document.querySelector("input[name=memberRrn]");
            var notice = input.nextElementSibling;

            if(input.value.length == 0 || regex.test(input.value)){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "주민번호 형식이 올바르지 않습니다";
                return false;
            }
        }
        function phoneCheck(){
            var regex = /^01[016789][1-9][0-9]{3}[0-9]{4}$/;
            var input = document.querySelector("input[name=memberPhone]");
            var notice = input.nextElementSibling;

            if(input.value.length == 0 || regex.test(input.value)){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "핸드폰 번호는 - 없이 11자리로 작성하세요";
                return false;
            }
        }
        function addressCheck(){
            var input = document.querySelector("input[name=memberDetailAddress]");
            var notice = input.nextElementSibling;

            if(input.value.length > 0){
                notice.textContent = "";
                return true;
            }
            else{
                notice.textContent = "상세주소를 입력해주세요";
                return false;
            }
        }

        function formCheck(){
            return idCheck() && pwCheck() && pw2Check() && nameCheck() && rrnCheck()
                            phoneCheck()&& addressCheck();
        }
        
    </script>
</head>
	 <form action="join.txt" name="form" method="post" onsubmit="return formCheck();" autocomplete="off">
		 <div class="container-500 container-center">	 
		 	<div class="row center">
		 		<h1>회원가입</h1>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">아이디</label>
		 		<input type="text" name="memberId" placeholder="아이디" class="form-input" onblur="idCheck();">
		 		<div class="notice"></div>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">비밀번호</label>
		 		<input type="password" name="memberPw" placeholder="비밀번호" class="form-input" onblur="pwCheck();">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">비밀번호 확인</label>
		 		<input type="password" name="memberPw2" placeholder="비밀번호 확인" class="form-input" onblur="pw2Check();">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">이름</label>
		 		<input type="text" name="memberName" placeholder="이름" class="form-input" onblur="nameCheck();">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="form-block lable-text">주민등록번호</label>
		        <input type="text" name="memberRrn" class="form-input" placeholder="-제외" maxlength="13" onblur="rrnCheck();">
		        <div class="notice"></div>
		 	</div>
		 	<%--성별 --%>
		 	 <div class="row">
		 		<input type="hidden" name="memberGender">
		 	</div>
			<div class="row">
		 		<label class="label-text">핸드폰 번호</label>
		 		<input type="tel" name="memberPhone" placeholder="-제외" class="form-input" maxlength="11" onblur="phoneCheck();">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">우편번호</label><br>
		 		<input type="text" name="memberPostcode" placeholder="우편번호"  readonly class="address-input">
		 		<button type="button" class="find-address-btn form-btn form-inline">주소 찾기</button>
		 		<div class="notice"></div>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">주소</label>
		 		<input type="text" name="memberAddress" placeholder="주소" readonly class="form-input">
		 		<div class="notice"></div>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">상세 주소</label>
		 		<input type="text" name="memberDetailAddress" placeholder="상세 주소" class="form-input" onblur="addressCheck();">
		 		<div class="notice"></div>
		 	</div>
			<div class="row">
				<input type="submit" value="가입" class="form-btn">
			</div>
		</div>
	</form>
</body>
	 
<jsp:include page="/template/footer.jsp"></jsp:include>
