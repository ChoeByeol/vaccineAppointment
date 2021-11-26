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
		<h2>1:1 문의 관리</h2>
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
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<%for(QnaDto qnaDto : pagination.getList()){ %>
				<tr>
					<td><%=qnaDto.getQnaNo()%></td>
					<td class="left">
					
						<a href="<%=request.getContextPath()%>/qna/detail.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">
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

	<div class="row pagination">
		<!-- 이전 버튼 -->
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
	
		<!-- 페이지 네비게이터 -->
		<%for(int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++){ %>
			<%if(pagination.isSearch()){ %>
			<!-- 검색용 링크 -->
			<a href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i%></a>
			<%}else{ %>
			<!-- 목록용 링크 -->
			<a href="list.jsp?p=<%=i%>"><%=i%></a>
			<%} %>
		<%} %>
		
		<!-- 다음 -->
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
	</div>
	
	<!-- 검색창 -->
	<div class="row center">
		<form action="list.jsp" method="get">
	
			<select name="column" class="form-input form-inline">
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
					value="<%=pagination.getKeywordString()%>" class="form-input form-inline">
			
			<input type="submit" value="검색" class="form-btn form-inline">
			
		</form>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>