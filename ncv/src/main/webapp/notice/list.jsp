<%@page import="ncv.beans.NoticePagination"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

NoticePagination pagination = new NoticePagination(request);
pagination.calculate();

%>


<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.link-btn {
	display: inline-block;
	padding: 0.5rem;
	border: 1px solid gray;
	text-decoration: none;
	color: gray;
}

.link-btn:hover {
	border-color: black;
	color: black;
}
ul.page {
	text-align:center;
	width: auto;
    height: 30px;
}
 ul.page li {
	display:inline;
	vertical-align:middle;
}
 ul.page li a {
	display:-moz-inline-stack;
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:15px !important;
	color:#000;
	text-align:center;
	text-decoration:none;
	width:26px;
}
 ul.page li a.now {
	color:#fff;
	background-color:#999;
	border:1px solid #999;
}
 ul.page li a:hover {
	color:#fff;
	border:1px solid #999;
	background-color:#999;
}
.search-select{
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:80px !important;
	color:#000;
	text-align:lefe;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/
}
.search-keyword{
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:300px !important;
	color:#000;
	text-align:center;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/
}
</style>
<div class="container-800 container-center">
	<div class="row center">
		<h2>공지 및 안내사항</h2>
	</div>

<div class="row right">
	<a href="write.jsp">글쓰기</a>
</div>
<br>
<br>
<div class="row">
	<table class="table table-border table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody align="center">
			<%for (NoticeDto noticeDto : pagination.getList()) {%>
			<tr>
				<td><%=noticeDto.getNoticeNo()%></td>
				<td class="left">
					<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>"> <%=noticeDto.getNoticeTitle()%></a>
				</td>
				<td><%=noticeDto.getNoticeWriter()%></td>
				<td><%=noticeDto.getNoticeTime()%></td>
				<td><%=noticeDto.getNoticeHit()%></td>
			</tr>
			<%}%>
		</tbody>
	</table>
	<br>
</div>
	<div class="row right">
		<a href="write.jsp" class="link-btn">글쓰기</a>
	</div>
	<ul class="page">
	<div class="row pagination">
		<!-- 이전 버튼 -->
		<%if(pagination.isPreviousAvailable()){ %>
			<%if(pagination.isSearch()){ %>
				<!-- 검색용 링크 -->
				<li><a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>"></a></li>
			<%} else { %>
				<!-- 목록용 링크 -->
				<li><a href="list.jsp?p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
			<%} %>
		<%} else { %>
			 <li><a>&lt;</a></li>
		<%} %> 
	
		<!-- 페이지 네비게이터 -->
		<%for(int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++){ %>
			<%if(pagination.isSearch()){ %>
			<!-- 검색용 링크 -->
			<li><a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i%></a></li>
			<%}else{ %>
			<!-- 목록용 링크 -->
			<li><a href="list.jsp?p=<%=i%>"><%=i%></a></li>
			<%} %>
		<%} %>
		
		<!-- 다음 -->
		<%if(pagination.isNextAvailable()){ %>
			<%if(pagination.isSearch()){ %>
				<!-- 검색용 링크 -->
				<li><a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;</a></li>
			<%} else { %>
				<!-- 목록용 링크 -->
				<li><a href="list.jsp?p=<%=pagination.getNextBlock()%>">&gt;</a></li>
			<%} %> 
		<%} else {%>
			<li><a>&gt;</a></li>
		<%} %>
	</div>
	</ul>
	
	
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="list.jsp" method="get">
	
			<select name="column" class="search-select">
				<%if(pagination.columnIs("notice_title")){ %>
				<option value="notice_title" selected>제목</option>
				<%}else{ %>
				<option value="notice_title">제목</option>
				<%} %>
				
				<%if(pagination.columnIs("notice_content")){ %>
				<option value="notice_content" selected>내용</option>
				<%}else{ %>
				<option value="notice_content">내용</option>
				<%} %>
				
				<%if(pagination.columnIs("notice_writer")){ %>
				<option value="notice_writer" selected>작성자</option>
				<%}else{ %>
				<option value="notice_writer">작성자</option>
				<%} %>
			</select>
			<input type="search" name="keyword" placeholder="검색어 입력" required 
					value="<%=pagination.getKeywordString()%>" class="search-keyword">
			<div class="row">
				<input type="submit" value="검색" class="link-btn">
			</div>
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>