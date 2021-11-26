<%@page import="java.util.List"%>
<%@page import="ncv.beans.QnaDao"%>
<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaPagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String qnaWriter = (String)session.getAttribute("ses");
QnaDao qnaDao = new QnaDao();
List<QnaDto> mylist = qnaDao.mylist(qnaWriter);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
	/* 링크를 버튼으로 만드는 스타일 */
	.link-btn {
		display: inline-block;
		padding:0.5rem;
		border:1px solid gray;
		text-decoration: none;
		color:gray;
	}
	.link-btn:hover {
		border-color:black;
		color:black;
	}
</style>

<div class="container-800 container-center">

	<div class="row center">
		<h2>나의 1:1문의</h2>
	</div>
	
	<div class="row center">
		<h5>• 문의글은 24시간 이내로 답변드리며, 마이페이지 > 1:1 문의 내역에서도 조회 가능합니다.</h5>
		<h5>• 서비스 운영시간: 오전 9시 ~ 오후 6시 월 ~ 금 (토, 일, 공휴일 제외)</h5>
	</div>
	
	<div class="row">
		<table class="table table-border table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>상태</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(QnaDto qnaDto : mylist){ %>
				<tr>
					<td><%=qnaDto.getQnaNo()%></td>
					<td class="left">
					
						<a href="detail.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">
							<%=qnaDto.getQnaTitle()%>
						</a>
						
					</td>
					<td><%=qnaDto.getQnaState()%></td>
					<td><%=qnaDto.getQnaDate()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link-btn">문의하기</a>
	</div>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>