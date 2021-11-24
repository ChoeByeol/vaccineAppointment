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

.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}

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
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:15px !important;
	color:#000;
	text-align:center;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/

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
.search-btn{
	display:-moz-inline-stack;	/*FF2*/
	display:inline-block;
	vertical-align:top;
	padding:4px;
	margin-right:3px;
	width:60px !important;
	color:#000;
	text-align:center;
	text-decoration:none;
	width /**/:26px;	/*IE 5.5*/
}
.search-btn :hover  {
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


<br>
<br>
<div class="row center">

				<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
					<div class="row left">
						<h2>공지 및 안내사항</h2>
					</div>
				<caption>나의 예약 리스트</caption>
				
					<thead>
						<tr>
							<th style="width: 70px;">번호</th>
							<th width="40%">제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody align="center">
					
						<%for (NoticeDto noticeDto : pagination.getList()) {%>
						<tr>
							<td class="no" style="width: 70px;"><%=noticeDto.getNoticeNo()%></td>
							<td class="title" >
								<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>"> <%=noticeDto.getNoticeTitle()%></a>
							</td>
							<td class="writer"><%=noticeDto.getNoticeWriter()%></td>
							<td class="time"><%=noticeDto.getNoticeTime()%></td>
							<td class="hit"><%=noticeDto.getNoticeHit()%></td>
						</tr>
						<%}%>
					</tbody>
				</table>
	<br>
</div>
	<div class="row right">
		<a href="write.jsp" class="link_btn">글쓰기</a>
	</div>
	
	<ul class="page">
	<div class="row pagination">
		<!-- 이전 버튼 -->
		<%if(pagination.isPreviousAvailable()){ %>
			<%if(pagination.isSearch()){ %>
				<!-- 검색용 링크 -->
				<li><a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
			<%} else { %>
				<!-- 목록용 링크 -->
				<li><a href="list.jsp?p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
			<%} %>
		<%} else { %>
			 <li><a>&lt;</a><li>
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
			
			<input type="submit" value="검색" class="search-btn">
		</form>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>