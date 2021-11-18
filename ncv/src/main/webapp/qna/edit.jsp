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

<h2>문의글 수정</h2>

<form action="edit.txt" method="post">
<input type="hidden" name="qnaNo" required width="600" value="<%=qnaDto.getQnaNo()%>">
	<table>
		<tbody align="left">
			<tr>
				<th>제목 : </th>
				<td><input type="text" name="qnaTitle" required width="600" value="<%=qnaDto.getQnaTitle()%>"></td>
			</tr>
			<tr>
				<th>내용 : </th>
				<td><textarea name="qnaContent" rows="10" cols="100" required ><%=qnaDto.getQnaContent()%></textarea></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</tfoot>
	</table>
</form>