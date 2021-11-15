<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = request.getParameter("memberId");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.select(memberId);
%>


<%-- <jsp:include page="/template/header.jsp"></jsp:include>   --%>

<h2>회원 상세 정보</h2>

<table width="1100">
	<thead>
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>주민등록번호</th>
			<th>성별</th>
			<th>주소</th>
			<th>전화번호</th>
			<th>가입일</th>
			<th>등급</th>
		</tr>
	</thead>
	<tbody align="center">
			<tr>			
				<td><%=memberDto.getMemberId()%></td>
				<td><%=memberDto.getMemberPw()%></td>
				<td><%=memberDto.getMemberName()%></td>
				<td><%=memberDto.getMemberRrn()%></td>
				<td><%=memberDto.getMemberGender()%></td>
				<td><%=memberDto.getMemberAddress()%></td>
				<td><%=memberDto.getMemberPhone()%></td>
				<td><%=memberDto.getMemberJoin()%></td>
				<td><%=memberDto.getMemberRole()%></td>
			</tr>
	</tbody>
</table>


<%-- <jsp:include page="/template/footer.jsp"></jsp:include>     --%>