<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <style>
        .notice {
            color:red;
        }
        .address-input{
        	width:392.95px;
    		font-size: 20px;
    		padding:10px;
    		margin-top:10px;
			margin-bottom:15px;
    		border:1px solid rgb(0, 0, 0);
        }
        .address-input:focus{
			border:none;
    		outline:2px solid rgb(0, 55, 100);
    		border-radius: 2px;
		}
		div	{
			height:auto;
			width: 100%;
			border-bottom:1px solid gold;
		}
		.edit-text{
			margin-top:10px;
			margin-bottom:15px;
    		line-height:50px;
    		height:50px;
		}
		.label-text{
			font-family:Apple;
		}
    </style>
	 <script>	 
	    $(function(){        
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
	</script>

<%-- 입력 : memberId (session) --%>
<%
	String memberId = (String)session.getAttribute("ses");
%>

<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>


<form action="edit.txt" method="post">
   	<div class="container-500 container-center">
   		<div class="row center">
		 		<h1>회원정보수정</h1>
		</div>
		<div class="row">
		 		<label class="label-text">아이디</label>
		 		<input type="hidden" class="form-input" name="memberId" value="<%=memberDto.getMemberId()%>">
                <p class="edit-text"><%=memberDto.getMemberId()%></p>
		 </div>
		 <div class="row">
		 		<label class="label-text">이름</label>
		 		<input type="hidden" name="memberName" value="<%=memberDto.getMemberName()%>">
                <p class="edit-text"><%=memberDto.getMemberName()%></p>
		 </div>
		 <div class="row">
		 		<label class="label-text">전화번호</label>
		 		<input type= "tel" class="form-input" name= "memberPhone"	required value="<%=memberDto.getMemberPhone()%>">
		 </div>
		 <div class="row">
		 		<label class="label-text">우편번호</label><br>
		 		<input type="text" name="memberPostcode" value="<%=memberDto.getMemberPostcode()%>" readonly class="address-input">
		 		<button type="button" class="find-address-btn form-btn form-inline">주소 찾기</button>
		 </div>
		 <div class="row">
		 		<label class="label-text">주소</label>
		 		<input type="text" class="form-input" name="memberAddress" required value="<%=memberDto.getMemberAddress()%>">
		 </div>
		 <div class="row">
		 		<label class="label-text">상세주소</label>
		 		<input type="text" class="form-input" name="memberDetailAddress" required value="<%=memberDto.getMemberDetailAddress()%>">
		 </div>
		 <div class="row">
				<input type="submit" value="수정" class="form-btn">
			</div>
   	</div>
</form>

<%if(request.getParameter("error") != null){%>
	<h4>비밀번호가 일치하지 않습니다.</h4>
<%} %>
<jsp:include page="/template/footer.jsp"></jsp:include>