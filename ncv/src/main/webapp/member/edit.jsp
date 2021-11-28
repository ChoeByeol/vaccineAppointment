<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 주소 검색 모듈 -->
<script src="<%=request.getContextPath()%>/resource/js/member_address.js"></script>

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
		 		<input type="text" class="form-input" name="memberAddress" value="<%=memberDto.getMemberAddress()%>" readonly>
		 </div>
		 <div class="row">
		 		<label class="label-text">상세주소</label>
		 		<input type="text" class="form-input" name="memberDetailAddress" value="<%=memberDto.getMemberDetailAddress()%>">
		 </div>
		 <div class="row">
				<input type="submit" value="수정" class="form-btn">
			</div>
   	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>