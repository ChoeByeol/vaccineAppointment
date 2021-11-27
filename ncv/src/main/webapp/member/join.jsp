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
	        
	        //아이디 정규식, 중복 검사
 			$("input[name=memberId]").on("blur",function(){
 				idCheck();
 				console.log(idCheck());
 			});
 			function idCheck(){
 				var input = $("input[name=memberId]").val();
 				var notice = $("input[name=memberId]").next();
 				var regex = /^[a-z][a-z0-9-_]{7,19}$/;
 				
 				if(regex.test(input)){//정규식 통과하면 중복검사
				    $.ajax({
				        url:"http://localhost:8080/ncv/member/ajax_id_check.txt",
				        type:"get",//전송방식
				        data:{
				            memberId: input
				        },
				        //완료 처리
				        success:function(resp){//통신이 성공
				            if(resp == "YYY"){
				                notice.text("");
				            }
				            else if(resp == "NNN"){
				                notice.text("이미 사용중인 아이디입니다.");
				            }
				        },
				        error:function(err){//통신이 실패
				
				        }
				    });
 					return true;
 				}
 				else{//정규식 통과 실패
 					notice.text("아이디는 8~20자 영문+숫자로 작성하세요");
 					return false;
 				} 
 			}
 				
 			// 비밀번호 정규식
 			$("input[name=memberPw]").on("blur",function(){
 				pwCheck();
 				console.log(pwCheck());
 			});
 			function pwCheck(){
 				var input = $("input[name=memberPw]").val();
 				var notice = $("input[name=memberPw]").next();
 				var regex = /^[A-Za-z0-9!@#$\s_-]{8,16}$/;
 				
 				if(regex.test(input)){//정규식 통과하면 중복검사
 					notice.text("");
 					return true;
 				}
 				else{//정규식 통과 실패
 					notice.text("비밀번호는 8~16자 이내의 영문,숫자,특수문자로 작성하세요");	
 					return false;
 				} 
 			}
 			//비밀번호 확인 검사
 			$("input[name=memberPw2]").on("blur",function(){
 				pw2Check();
 				console.log("함수 실행 결과" + pw2Check());
 			});
	        function pw2Check(){
	            var pwInput = $("input[name=memberPw]").val();
	            console.log("비밀번호 값 = "+pwInput);
	            var pw2Input = $("input[name=memberPw2]").val();
	            console.log("비밀번호 확인 값"+pw2Input);
	            console.log("둘이 같나? = "+pw2Input == pwInput);
	            var notice = $("input[name=memberPw2]").next();
	            if(pwInput.length > 0 && pwInput == pw2Input){
	                notice.text("");
	                return true;
	            }
	            else{
	            	notice.text("비밀번호가 일치하지 않습니다");
	                return false;
	            }
	        }
	        
 			// 이름 정규식
 			$("input[name=memberName]").on("blur",function(){
 				nameCheck();
 				console.log(nameCheck());
 			});
 			function nameCheck(){
 				var input = $("input[name=memberName]").val();
 				var notice = $("input[name=memberName]").next();
 				var regex = /^[가-힣]{2,17}$/;
 				
 				if(regex.test(input)){//정규식 통과
 					notice.text("");
 					return true;
 				}
 				else{//정규식 통과 실패
 					notice.text("이름은 한글 2~7자 내외로 작성하세요");	
 					return false;
 				} 
 			}

 			//주민번호 정규식, 중복 검사, 성별 판별
 			$("input[name=memberRrn]").on("blur",function(){
 				rrnCheck();
 				console.log(rrnCheck());
 				//성별 판별
	            var genderCode = $("input[name=memberRrn]").val().substring(6,7);
	            if(genderCode == "1" || genderCode =="3"){
	                $("input[name=memberGender]").val("남");
	            }
	            else if(genderCode == "2" || genderCode =="4"){
	                $("input[name=memberGender]").val("여");
	            }
 			});
 			function rrnCheck(){
 				var input = $("input[name=memberRrn]").val();
 				var notice = $("input[name=memberRrn]").next();
 				var regex = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))[1-4][0-9]{6}$/; 				
 				if(regex.test(input)){//정규식 통과하면 중복검사
				    $.ajax({
				        url:"http://localhost:8080/ncv/member/ajax_rrn_check.txt",
				        type:"get",//전송방식
				        data:{
				            memberRrn: input
				        },
				        //완료 처리
				        success:function(resp){//통신이 성공
				            if(resp == "YYY"){
				                notice.text("");
				            }
				            else if(resp == "NNN"){
				                notice.text("이미 사용중인 주민번호입니다.");
				            }
				        },
				        error:function(err){//통신이 실패
				
				        }
				    });
 					return true;
 				}
 				else{//정규식 통과 실패
 					notice.text("주민번호 형식이 올바르지 않습니다");	
 					return false;
 				} 
 			}
 			
 			//전화번호 정규식, 중복 검사
 			$("input[name=memberPhone]").on("blur",function(){
 				phoneCheck();
 				console.log(phoneCheck());
 			});
 			function phoneCheck(){
 				var input = $("input[name=memberPhone]").val();
 				var notice = $("input[name=memberPhone]").next();
 				var regex = /^01[016789][1-9][0-9]{3}[0-9]{4}$/;
 				
 				if(regex.test(input)){//정규식 통과하면 중복검사
				    $.ajax({
				        url:"http://localhost:8080/ncv/member/ajax_phone_check.txt",
				        type:"get",//전송방식
				        data:{
				            memberPhone: input
				        },
				        //완료 처리
				        success:function(resp){//통신이 성공
				            if(resp == "YYY"){
				                notice.text("");
				            }
				            else if(resp == "NNN"){
				                notice.text("이미 사용중인 핸드폰 번호입니다.");
				            }
				        },
				        error:function(err){//통신이 실패
				
				        }
				    });
 					return true;
 				}
 				else{//정규식 통과 실패
 					notice.text("핸드폰 번호 형식이 올바르지 않습니다");	
 					return false;
 				} 
 			} 
 			

	        $("form").submit(function(){
	        	return idCheck() && pwCheck() && pw2Check() && nameCheck() && rrnCheck() && phoneCheck();
	        });
	    }); 
    </script>
</head>
	 <form action="join.txt" name="form" method="post">
		 <div class="container-500 container-center">	 
		 	<div class="row center">
		 		<h1>회원가입</h1>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">아이디</label>
		 		<input type="text" name="memberId" placeholder="아이디" class="form-input">
		 		<div class="notice"></div>
		 	</div>
		 	<div class="row">
		 		<label class="label-text">비밀번호</label>
		 		<input type="password" name="memberPw" placeholder="비밀번호" class="form-input">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">비밀번호 확인</label>
		 		<input type="password" name="memberPw2" placeholder="비밀번호 확인" class="form-input">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">이름</label>
		 		<input type="text" name="memberName" placeholder="이름" class="form-input">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="form-block lable-text">주민등록번호</label>
		        <input type="text" name="memberRrn" class="form-input" placeholder="-제외" maxlength="13">
		        <div class="notice"></div>
		 	</div>
		 	<%--성별 --%>
		 	 <div class="row">
		 		<input type="hidden" name="memberGender">
		 	</div>
			<div class="row">
		 		<label class="label-text">핸드폰 번호</label>
		 		<input type="tel" name="memberPhone" placeholder="-제외" class="form-input" maxlength="11">
		 		<div class="notice"></div>
		 	</div>
		 	 <div class="row">
		 		<label class="label-text">우편번호</label><br>
		 		<input type="text" name="memberPostcode" placeholder="우편번호"  readonly class="address-input" readonly>
		 		<button type="button" class="find-address-btn form-btn form-inline">주소 찾기</button>
		 		<div class="notice"></div>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">주소</label>
		 		<input type="text" name="memberAddress" placeholder="주소" readonly class="form-input" readonly>
		 		<div class="notice"></div>
		 	</div>
		  	 <div class="row">
		 		<label class="label-text">상세 주소</label>
		 		<input type="text" name="memberDetailAddress" placeholder="상세 주소" class="form-input">
		 		<div class="notice"></div>
		 	</div>
			<div class="row">
				<input type="submit" value="가입" class="form-btn">
			</div>
		</div>
	</form>
</body>
	 
<jsp:include page="/template/footer.jsp"></jsp:include>
