<%@page import="java.util.List"%>
<%@page import="home.beans.HistoryDao"%>
<%@page import="home.beans.HistoryDto"%>
<%@page import="home.beans.MemberDto"%>
<%@page import="home.beans.MemberDao"%>
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

 <%-- 처리 : 포인트 내역(HistoryDto) --%>
 
 <%
 	HistoryDao historyDao = new HistoryDao();
 	List<HistoryDto> list = historyDao.findByMember_id(member_id);
 %>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
 
 <h2> 회원 상세 정보</h2>
 

<table border = "1" width="300">
	<tbody>
		<tr>
			<th>아이디</th>
			<td><%=memberDto.getMember_id()%></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><%=memberDto.getMember_Nick()%></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%=memberDto.getMember_Birth()%></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=memberDto.getMember_emailString()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=memberDto.getMember_phoneString()%></td>
		</tr>
		<tr>
			<th>가입일시</th>
			<td><%=memberDto.getMember_join()%></td>
		</tr>
		<tr>
			<th>포인트</th>
			<td><%=memberDto.getMember_point()%></td>
		</tr>
		<tr>
			<th>회원등급</th>
			<td><%=memberDto.getMember_grade()%></td>
		</tr>
	</tbody>
</table>

<%-- <h3><a href="<%=request.getContextPath()%>/member/password.jsp">비밀번호 변경</a></h3> --%>
<h3><a href="password.jsp">비밀번호 변경</a></h3>
<h3><a href="edit.jsp">개인정보 변경</a></h3>
<h3><a href="check.jsp">회원 탈퇴</a></h3>
<!--  -->

<hr>

<!-- 포인트 내역 출력 -->
<h2>포인트 상세 내역</h2>

<%-- 동적 include를 수행할 때에는 jsp:param 태그를 이용하여 불러올 페이지에 파라미터를 전달할 수 있다. --%>

<jsp:include page="/point/list.jsp">
	<jsp:param value = "<%=member_id %>" name = "member_id"/>
</jsp:include>

 <jsp:include page="/template/footer.jsp"></jsp:include>