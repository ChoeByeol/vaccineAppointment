<%@page import="java.util.List"%>
<%-- <%@page import="ncv.beans.HistoryDao"%>
<%@page import="ncv.beans.HistoryDto"%> --%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : 현재 로그인한 회원ID - String member_id--%>
<%
	String member_id = (String)session.getAttribute("ses");
%>

<%-- 처리 : 회원정보(MemberDto) --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(member_id);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
 
 <h2> 회원 상세 정보</h2>
 

<table border = "1" width="300">
	<tbody>
		<tr>
			<th>아이디</th>
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
			<td><%=memberDto.getMemberPhone()%></td>
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

<h3><a href="password.jsp">비밀번호 변경</a></h3>
<h3><a href="edit.jsp">개인정보 변경</a></h3>
<h3><a href="check.jsp">회원 탈퇴</a></h3>

<hr>

 <jsp:include page="/template/footer.jsp"></jsp:include>