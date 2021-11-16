<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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

<h2>회원 정보 수정</h2>

<form action="edit.txt" method="post">
	
	<table border="0">
		<tbody>
			<tr>
				<td>
					<input type="hidden" name="memberId" required value="<%=memberDto.getMemberId()%>">
					<input type= "hidden" name= "memberRrn" required value= "<%=memberDto.getMemberRrn()%>">
					<input type= "hidden" name= "memberGender" required value= "<%=memberDto.getMemberGender()%>">
					<input type= "hidden" name= "memberName" required value= "<%=memberDto.getMemberName()%>">			
				</td>
			</tr>
				
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="memberPw" required value="<%=memberDto.getMemberPw()%>">
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" name="memberAddress" required value="<%=memberDto.getMemberAddress()%>">
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type= "tel" name= "memberPhone"	required value="<%=memberDto.getMemberPhone()%>">
					</td>
			</tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정">
				</td>
			</tr>
		</tbody>
	</table>
	
</form>

<%if(request.getParameter("error") != null){%>
<h4><font color="red">비밀번호가 일치하지 않습니다</font></h4>
<%} %>

<jsp:include page="/template/footer.jsp"></jsp:include>