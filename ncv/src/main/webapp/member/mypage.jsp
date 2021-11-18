<%@page import="java.util.List"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- 입력 : 현재 로그인한 회원ID - String member_id--%>
<%
	String memberId = (String)session.getAttribute("ses");
%>
    
<%-- 처리 : 회원정보(MemberDto) --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.float-container > .float-item-left:nth-child(1) {
		width:25%;	
		padding:0.5rem;
	}
	.float-container > .float-item-left:nth-child(2) {
		width:75%;
		padding:0.5rem;
	}
	
	.link-btn {
		width:100%;
	}
</style>

<div class="container-900 container-center">
	
	<div class="row float-container">	
		<!-- 1단 -->
		<div class="float-item-left">
			
			<!-- 아이디 -->
			<div class="row center">
				<h2><%=memberDto.getMemberId()%></h2>
			</div>
			
			<!-- 메뉴들 -->
			<div class="row center">
				<a href="password.jsp" class="link-btn-block">비밀번호 변경</a>
			</div>
			<div class="row center">
				<a href="edit.jsp" class="link-btn-block">개인정보 변경</a>
			</div>
			<div class="row center">
				<a href="check.jsp" class="link-btn-block">회원 탈퇴</a>
			</div>
			
		</div>
		
		<!-- 2단 -->
		<div class="float-item-left">
		
			<!-- 회원 정보 -->
			<div class="row">
				<h2>회원 상세 정보</h2>
			</div>
			<div class="row">
				<table class="table table-stripe">
					<tbody>
						<tr>
							<th width="25%">아이디</th>
							<td><%=memberDto.getMemberId()%></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><%=memberDto.getMemberName()%></td>
						</tr>
						<tr>
							<th>주민등록번호</th>
							<td><%=memberDto.getMemberRrn()%></td>
						</tr>
						<tr>
							<th>핸드폰번호</th>
							<td><%=memberDto.getMemberPhone()%></td>
						</tr>
						<tr>
							<th>주소</th>
							<td><%=memberDto.getMemberAddress()%></td>
						</tr>
						<tr>
							<th>가입일</th>
							<td><%=memberDto.getMemberJoin()%></td>
						</tr>
						<tr>
							<th>회원구분</th>
							<td><%=memberDto.getMemberRole()%></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

 <jsp:include page="/template/footer.jsp"></jsp:include>