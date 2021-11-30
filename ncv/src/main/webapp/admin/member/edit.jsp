<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- 주소 검색 모듈 -->
<script src="<%=request.getContextPath()%>/resource/js/member_address.js"></script>
<style>
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
		.quit-btn{
		border:none;
		padding:0.5rem;
		text-decoration:none;
		color:gray;
		font-family:NotoSans;
		font-size:16px;
	}
	.quit-btn:hover{
		color:red;
	}
</style>
<%-- 입력 : memberId (session) --%>
<%
	String memberId = request.getParameter("memberId");
%>

<%-- 처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<form action="edit.txt" method="post">
    <div class="container-400 container-center">
    	<div class="row center">
    		<h2>관리자용 회원 정보 수정</h2>
    	</div>
    	<div class="row">
    		<label class="label-text">이름</label>
    		<input type="hidden" class="form-input" name="memberName" value="<%=memberDto.getMemberName()%>">
    		<p class="edit-text"><%=memberDto.getMemberName()%></p>
    	</div>
    	<div class="row">
    		<label class="label-text">아이디</label>
            <input type="hidden" class="form-input" name="memberId" value="<%=memberDto.getMemberId()%>">
            <p class="edit-text"><%=memberDto.getMemberId()%></p>
    	</div>
            <input type="hidden" class="form-input"  name="memberPw" required value="<%=memberDto.getMemberPw()%>">
    	<div class="row">
    		<label class="label-text">주민등록번호</label>
            <input type="hidden" class="form-input"  name="memberRrn" value="<%=memberDto.getMemberRrn()%>">
            <p class="edit-text"><%=memberDto.getMemberRrn()%></p>
    	</div>
    	<div class="row">
    		<label class="label-text">성별</label>
            <input type="hidden" class="form-input" name="memberGender" value="<%=memberDto.getMemberGender()%>">
            <p class="edit-text"><%=memberDto.getMemberGender()%></p>
    	</div>
    	<div class="row">
    		<label class="label-text">우편번호</label>
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
    		<label class="label-text">전화번호</label>
			<input type= "tel" class="form-input" name="memberPhone" required value="<%=memberDto.getMemberPhone()%>">
    	</div>
    	<div class="row">
    		<label class="label-text">회원등급</label>
			<select class="form-input" name="memberRole" required>
				<option selected>일반회원</option>
				<option>관리자</option>
			</select>
    	</div>
    	<div class="row">
    		<input type="submit" value="수정" class="form-btn">
    	</div>
    </div>
</form>
<div class="quit-btn right">
	<a class="quit-btn" href="<%=request.getContextPath()%>/admin/member/quit.txt?memberId=<%=memberDto.getMemberId()%>">회원 탈퇴</a>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>