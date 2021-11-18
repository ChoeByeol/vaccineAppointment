<%@page import="ncv.beans.Pagination"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.NoticeDao2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	Pagination pagination = new Pagination(request);

	pagination.calculate(); 
%>

<%=pagination.toString()%>

<%-- 헤더 --%>


<h2>공지 및 안내사항</h2>


<a href="write.jsp">글쓰기</a>
<br><br>

<table border="1" width="90%">
	<thead>
		<tr>
			<th>글번호</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>상위글</th>
			<th>그룹</th>
			<th>차수</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(NoticeDto noticeDto : pagination.getList()){ %>
		<tr>
			<td><%=noticeDto.getNoticeNo()%></td>
			<td align="left">
				

				<%

				if(noticeDto.getNoticeDepth() > 0){
				%>
					<%for(int i=0; i < noticeDto.getNoticeDepth(); i++){ %>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<%} %>
				
					<img src="<%=request.getContextPath()%>/resource/image/reply.png" width="15" height="15">
				<%} %>
			
				<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">
					<%=noticeDto.getNoticeTitle()%>
				</a>
				
			
		</tr>
		<%} %>
	</tbody>
</table>

<br>
<a href="write.jsp">글쓰기</a>

<!-- 페이지 네비게이터 -->
<br><br>
<%if(pagination.isPreviousAvailable()){ %>
	<%if(pagination.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=pagination.getPreviousBlock()%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++){ %>
	<%if(pagination.isSearch()){ %>
	<!-- 검색용 링크 -->
	<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="list.jsp?p=<%=i%>"><%=i%></a>
	<%} %>
<%} %>

<%if(pagination.isNextAvailable()){ %>
	<%if(pagination.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=pagination.getNextBlock()%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>

<br><br>

<!-- 검색창 -->
<form action="list.jsp" method="get">
	
	<select name="column">
		<%if(pagination.columnIs("board_title")){ %>
		<option value="board_title" selected>제목</option>
		<%}else{ %>
		<option value="board_title">제목</option>
		<%} %>
		
		<%if(pagination.columnIs("board_content")){ %>
		<option value="board_content" selected>내용</option>
		<%}else{ %>
		<option value="board_content">내용</option>
		<%} %>
		
		<%if(pagination.columnIs("board_writer")){ %>
		<option value="board_writer" selected>작성자</option>
		<%}else{ %>
		<option value="board_writer">작성자</option>
		<%} %>
		
	</select>
	
	<input type="search" name="keyword" placeholder="검색어 입력" required value="<%=pagination.getKeywordString()%>">
	
	<input type="submit" value="검색">
	
</form>


<%--푸터--%>
