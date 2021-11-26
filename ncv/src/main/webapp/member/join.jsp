<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 주소 검색 모듈 -->
<script src="<%=request.getContextPath()%>/resource/js/member_address.js"></script>

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
