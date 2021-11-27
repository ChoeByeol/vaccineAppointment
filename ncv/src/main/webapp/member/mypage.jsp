<<<<<<< HEAD
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
	.link-btn {
		width:100%;
	}
	.flex-item{
		width:450px;
	}
	.quit-btn{
		border:none;
		padding:0.5rem;
		text-decoration:none;
		color:gray;
		font-family:NotoSans;
		font-size:12px;
	}
	.quit-btn:hover{
		color:red;
	}
</style>

<div class="container-900 container-center">
	
	<div class="row flex-container">
			<!-- 1단 -->
			<!-- 회원 정보 -->
			<div class="row flex-item">
				<table class="table table-stripe">
					<tbody>
						<tr>
							<th width="50%">아이디</th>
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

		<!-- 2단 -->
			<!-- 메뉴들 -->
			<div class="flex-item center">
				<h2><%=memberDto.getMemberId()%></h2>
				<br>
					<div class="link-btn">
						<a href="password.jsp" class="link-btn">비밀번호 변경</a>
					</div>
					<div class="link-btn">
						<a href="edit.jsp" class="link-btn">개인정보 변경</a>
					</div>
					<div class="link-btn">
						<a href="<%=request.getContextPath()%>/qna/mylist.jsp" class="link-btn">1:1 문의</a>
					</div>
			</div>
		</div>
	</div>

<div class="quit-btn right">
	<a class="quit-btn" href="check.jsp">회원 탈퇴</a>
</div>
 <jsp:include page="/template/footer.jsp"></jsp:include>