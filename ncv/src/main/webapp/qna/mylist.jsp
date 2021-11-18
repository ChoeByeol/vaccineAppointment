
<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaPagination"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 --%>
<%
	//Pagination 모듈을 이용하여 계산을 처리하도록 위임
	QnaPagination pagination = new QnaPagination(request);
	pagination.calculate();
	
	String column = request.getParameter("column");
	String keyword = request.getParameter("keyword");
	
	boolean search = column != null && !column.equals("") && keyword != null && !keyword.equals("");
%>

<%
	//삼항 연산 : if문 축소버전 - (조건) ? 참 : 거짓
	String title = search ? "1:1 문의 검색" : "1:1 문의 게시판";
%>

<jsp:include page="/template/header.jsp"></jsp:include>    

<h2><%=title%></h2>

<%if(pagination.getList().isEmpty()){ %>
<h3>데이터가 존재하지 않습니다</h3>
<%}else{ %>
<table width="90%">
	<thead>
		<tr>
			<th>번호</th>
			<th width="45%">제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(QnaDto qnaDto : pagination.getList()){%>
			<tr>			
				<td><%=qnaDto.getQnaNo()%></td>
				<td align="left"><a href="detail.jsp?qnaNo=<%=qnaDto.getQnaNo()%>"><%=qnaDto.getQnaTitle()%></a></td>
				<td><%=qnaDto.getQnaWriter()%></td>
				<td><%=qnaDto.getQnaDate()%></td>
				<td><%=qnaDto.getQnaState()%></td>	
			</tr>
		<%}%>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="6" align="right">
				<h4><a href="write.jsp">글쓰기</a></h4>
			</td>
		</tr>
	</tfoot>
</table>
<%}%>

<!-- 페이지 네비게이터 -->
<br><br>
<%if(pagination.isPreviousAvailable()){%>
	<%if(pagination.isSearch()){%>
	<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>">[이전]</a>
	<%}else{ %>
	<a href="list.jsp?p=<%=pagination.getPreviousBlock()%>">[이전]</a>
	<%} %>
<%} %>

<%for(int i = pagination.getStartBlock() ; i <= pagination.getRealLastBlock() ; i++){ %>
	<%if(pagination.isSearch()) {%>
	<!-- 검색용 링크 -->
	<a href="list.jsp?column=<%=column%>&keyword=<%=keyword%>&p=<%=i%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="list.jsp?p=<%=i%>"><%=i%> </a>
	<%} %>
<%} %>

<%if(pagination.isNextAvailable()){ %>
	<%if(pagination.isSearch()){%>
	<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=keyword%>&p=<%=pagination.getNextBlock()%>">[다음]</a>
	<%}else{ %>
	<a href="list.jsp?p=<%=pagination.getNextBlock()%>">[다음]</a>
	<%} %>
<%} %>
<br><br>

<form action="list.jsp" method="get">
	<select name="column" required>
		<option value="">선택</option>
		<%if(column != null && column.equals("qna_title")){ %>
		<option value="qna_title" selected>제목</option>
		<%}else{%>
		<option value="qna_title">제목</option>
		<%} %>
		
		<%if(column != null && column.equals("qna_content")){ %>
		<option value="qna_content" selected>내용</option>
		<%}else{ %>
		<option value="qna_content">내용</option>
		<%} %>
		
		<%if(column != null && column.equals("qna_writer")){ %>
		<option value="qna_writer" selected>작성자</option>
		<%}else{ %>
		<option value="qna_writer">작성자</option>
		<%} %>
		
	</select>
	<input type="text" name="keyword" required value="<%=keyword == null ? "" : keyword%>" placeholder="검색어 입력">
	
	<input type="submit" value="검색">
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>