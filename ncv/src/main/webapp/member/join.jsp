<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <jsp:include page="/template/header.jsp"></jsp:include>
 <script>
 <!--
 // 주민등록입력시 생년월일 자동입력
 function inputbirth(str) {
  var temp1,temp2,temp3;
  temp1=document.form.memberFrontRrn.value.substring(0,2);
  temp2=document.form.memberFrontRrn.value.substring(2,4);
  temp3=document.form.memberFrontRrn.value.substring(4,6);
  document.form.byy.value=str+temp1;
  document.form.bmm.value=temp2;
  document.form.bdd.value=temp3;
 }
 
 // 주민등록입력시 성별 자동입력
 function inputgen() {
  var temp1;
  temp1=document.form.memberGender.value.substring(0,1);
  if (temp1 == "1" || temp1 == "3"||temp1 == "5" || temp1 == "7"||temp1 == "9"){
   document.form.memberGender[0].checked = true;
  }
  else{
   document.form.memberGender[1].checked = true;
  }
  goJump('memberGender', 7, 'byy')
 }

 function goJump(fname, len, goname)
 {
  isNumber(fname);
  if (document.all[fname].value.length == len) document.all[goname].focus();
 }

 function isNumber( str ) {
  var temp = document.all[str].value;
  if( temp.length > 0 ){
   for(var i=0; i<temp.length; i++) {
    if(temp.charAt(i)<'0' || temp.charAt(i)>'9'){
     alert("숫자만 입력이 가능합니다.")
      document.all[str].value ="";
      document.all[str].focus();
      break;
    }
   }
  }
  return;
 }
	 
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
                    // 커서를 상세주소 필드로 이동한다.
                    document.querySelector("input[name=memberDetailAddress]").focus();
                    //$("input[name=detailAddress]").focus();
                }
            }).open();
        };
    });
</script>
 
 <form action="join.kh" name="form" method="post">
 
 <div class="container-400 container-center">
 
 	<div class="row center">
 		<h1>회원가입</h1>
 	</div>
 	<div class="row">
 		<label>아이디</label>
 		<input type="text" name="memberId" placeholder="아이디"required class="form-input">
 	</div>
 	<div class="row">
 		<label>비밀번호</label>
 		<input type="password" name="memberPw" placeholder="비밀번호"required class="form-input">
 	</div>
 	 <div class="row">
 		<label>이름</label>
 		<input type="text" name="memberName" placeholder="이름"required class="form-input">
 	</div>
 	 <div class="row">
 		<label class="form-block">주민등록번호</label>
 		<input type="text" name="memberRrn" placeholder="주민번호 앞자리"required class="form-input" maxlength="6"  size="6" onkeypress="goJump('memberFrontRrn', 6, 'memberBackRrn')">
 	</div>
 	 <div class="row">
 		<label class="form-block">성별</label>
 		<input type="radio" name="memberGender" value="0" checked > 남
		<input type="radio" name="memberGender" value= "1" > 여
 	</div>
	<div class="row">
 		<label>전화번호</label>
 		<input type="text" name="memberPhone" placeholder="-도 적어주세요"required class="form-input" maxlength="13">
 	</div>
 	 <div class="row">
 		<label>우편번호</label>
 		<input type="text" name="memberPostcode" placeholder="우편번호" required class="form-input">
 	</div>
 	<button type="button" class="find-address-btn">주소 찾기</button><br>
  	 <div class="row">
 		<label>주소</label>
 		<input type="text" name="memberAddress" placeholder="주소"required class="form-input">
 	</div>
  	 <div class="row">
 		<label>상세 주소</label>
 		<input type="text" name="memberDetailAddress" placeholder="상세 주소"required class="form-input">
 	</div>
	<div class="row">
		<input type="submit" value="가입" class="form-btn">
	</div>
</div>
</form>
 
 <jsp:include page="/template/footer.jsp"></jsp:include>