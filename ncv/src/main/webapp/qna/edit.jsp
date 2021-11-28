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

<form action="edit.txt" method="post">
<input type="hidden" name="qnaNo" required width="600" value="<%=qnaDto.getQnaNo()%>">
	<div class="container-800 container-center">
		<div class="row center form-title-font">1:1 문의글 수정</div>
		<div class="row">
			<h3>제목</h3>
			<input type="text" name="qnaTitle" required width="600" value="<%=qnaDto.getQnaTitle()%>" class="form-input-title form-input">
		</div>
		<div class="row right">
			<input type="submit" value="수정하기">
		</div>
	</div>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>
