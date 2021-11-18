<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : --%>
<%
	int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
%>
<%-- 처리 --%>
<%
	QnaDao qnaDao = new QnaDao();
	QnaDto qnaDto = qnaDao.get(qnaNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h2>문의글 답변</h2>

<form action="answer.txt" method="post">
<input type="hidden" name="qnaNo" required width="600" value="<%=qnaDto.getQnaNo()%>">
<select name="qnaState">
	<option>답변완료</option>
	<option>답변대기</option>
</select>
	<table>
		<tbody align="left">
			<tr>
				<th>제목 : </th>
				<td><input type="text" width="600" value="<%=qnaDto.getQnaTitle()%>"></td>
			</tr>
			<tr>
				<th>내용 : </th>
				<td><textarea rows="10" cols="100"><%=qnaDto.getQnaContent()%></textarea></td>
			</tr>
			<tr>
				<th>답변 : </th>
				<td><textarea name="qnaAnswer" rows="10" cols="100" required ><%=qnaDto.getQnaAnswer()%></textarea></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="답변하기">
				</td>
			</tr>
		</tfoot>
	</table>
</form>