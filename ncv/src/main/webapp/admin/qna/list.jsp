<%@page import="ncv.beans.QnaDao"%>
<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaPagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	//Pagination 모듈을 이용하여 계산을 처리하도록 위임
	QnaPagination pagination = new QnaPagination(request);
	//pagination.setPageSize(15);
	//pagination.setBlockSize(5);   
	pagination.calculate();
	
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
.sub_news, .sub_news th, .sub_news td {
	border: 0
}

.sub_news a {
	color: #383838;
	text-decoration: none
}

.sub_news {
	width: 100%;
	margin-top: 50px;
	border-bottom: 1px solid #999;
	color: #666;
	font-size: 14px;
	table-layout: fixed
}

.sub_news caption {
	display: none
}

.sub_news th {
	padding: 5px 0 6px;
	border-top: solid 1px #999;
	border-bottom: solid 1px #b2b2b2;
	background-color: #f1f1f4;
	color: #333;
	font-weight: bold;
	line-height: 20px;
	vertical-align: top
}

.sub_news td {
	padding: 8px 0 9px;
	border-bottom: solid 1px #d2d2d2;
	text-align: center;
	line-height: 18px;
}

.sub_news .title {
	text-align: left;
	padding-left: 15px;
	font-size: 13px;
}

.sub_news .title .pic, .sub_news .title .new {
	margin: 0 0 2px;
	vertical-align: middle
}

.sub_news .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold
}

ul.page {
	text-align: center;
	width: auto;
	height: 30px;
}

ul.page li {
	display: inline;
	vertical-align: middle;
}

ul.page li a {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 15px !important;
	color: #000;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}

ul.page li a.now {
	color: #fff;
	background-color: #999;
	border: 1px solid #999;
}

ul.page li a:hover {
	color: #fff;
	border: 1px solid #999;
	background-color: #999;
}
.button_base {
    position:absolute;
    font-size:17px;
    border: 0;
    position: relative;
    width: 60px;
    height: 30px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
    color: #000000;
    background-color:#dee2e6;
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn:hover {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}
.search-btn {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 60px !important;
	color: white;
	background-color: rgb(26, 44, 48);
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}

.search-btn :hover {
	color: #fff;
	border: 1px solid #999;
	background-color: #999;
}

.search-select {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 80px !important;
	color: #000;
	text-align: lefe;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}

.search-select:focus {
	border: none;
	outline: 2px solid rgb(49, 107, 152);
	border-radius: 2px;
}

.search-keyword {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 300px !important;
	color: #000;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
	line-height: 40px;
	height: 30px;
}


.border-spacing{
border-spacing:0px;
}

.search-keyword:focus {
	border: none;
	outline: 2px solid rgb(49, 107, 152);
	border-radius: 2px;
}
</style>

<div class="container-800 container-center">
	<div class="row center">
		<h2>1:1 문의 관리</h2>
	</div>
	<div class="row center">
		<h5>• 문의글은 24시간 이내로 답변드리며, 마이페이지 > 1:1 문의 내역에서도 조회 가능합니다.</h5>
		<h5>• 서비스 운영시간: 오전 9시 ~ 오후 6시 월 ~ 금 (토, 일, 공휴일 제외)</h5>
	</div>

	<div class="row">
		<table class="sub_news border-spacing" border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>상태</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(QnaDto qnaDto : pagination.getList()){ %>
				<tr>
					<td><%=qnaDto.getQnaNo()%></td>
					<td class="left">
					
						<a href="<%=request.getContextPath()%>/admin/qna/detail.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">
							<%=qnaDto.getQnaTitle()%>
						</a>
						
					</td>
					<td><%=qnaDto.getQnaState()%></td>
					<td><%=qnaDto.getQnaWriter()%></td>
					<td><%=qnaDto.getQnaDate()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
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
				<%if(pagination.columnIs("qna_title")){ %>
				<option value="qna_title" selected>제목</option>
				<%}else{ %>
				<option value="qna_title">제목</option>
				<%} %>
				
				<%if(pagination.columnIs("qna_content")){ %>
				<option value="qna_content" selected>내용</option>
				<%}else{ %>
				<option value="qna_content">내용</option>
				<%} %>
				
				<%if(pagination.columnIs("qna_writer")){ %>
				<option value="qna_writer" selected>작성자</option>
				<%}else{ %>
				<option value="qna_writer">작성자</option>
				<%} %>
			</select>
			
			<input type="search" name="keyword" placeholder="검색어 입력" required 
					value="<%=pagination.getKeywordString()%>" class="search-keyword">
			
			<input type="submit" value="검색" class="btn button_base">
			
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>