<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = request.getParameter("memberId");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>


<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
	<div class="row center">
		<h2>회원 상세 정보</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><%=memberDto.getMemberId()%></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><%=memberDto.getMemberPw()%></td>
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
					<th>성별</th>
					<td><%=memberDto.getMemberGender()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=memberDto.getMemberAddress()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=memberDto.getMemberPhone()%></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=memberDto.getMemberJoin()%></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%=memberDto.getMemberRole()%></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><%=memberDto.getAge()%></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>    