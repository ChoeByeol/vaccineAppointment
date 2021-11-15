<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--입력 : member_id(session) --%>
<%
	String member_id = (String)session.getAttribute("ses");
%>

<%--처리 --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(member_id);
%>

<%--출력 --%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h2>회원 정보 수정</h2>

<form action="edit.kh" method="post">

<table border = "0" width="300">
	<tbody>
		<tr>
			<th>비밀번호 확인</th>
			<td><input type="password" name="member_Pw" required></td>
		</tr>
		<tr>
			<th>닉네임</th>
				<td><input type="text" name="member_Nick" required
			 	value="<%=memberDto.getMember_Nick()%>"></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="date" name="member_Birth" required 
				value="<%=memberDto.getMemberBirthDay()%>"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="email" name="member_email" 
			value= "<%=memberDto.getMember_emailString()%>"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="tel" name="member_phone" 
			value= "<%=memberDto.getMember_phoneString()%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
		 	 	<input type="submit" value="수정">
		 	</td>
		 </tr>
		 </tbody>
 	</table>
</form>

<%if(request.getParameter("error") != null){ %>
	<h4><font color = "red">입력 정보가 일치하지 않습니다</font></h4>
<%} %>

 <jsp:include page="/template/footer.jsp"></jsp:include>