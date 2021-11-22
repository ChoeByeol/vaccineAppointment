<%@page import="ncv.beans.ShotPagination"%>
<%@page import="ncv.beans.ShotDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ShotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	ShotPagination shotPgn = new ShotPagination(request);
	
	shotPgn.calculate();
	
	
	//삼항 연산 : if문 축소버전 - (조건) ? 참 : 거짓
	String title = shotPgn.isSearch() ? "접종 내역 검색" : "접종 내역 목록";
%>

<%=shotPgn.toString() %>

<jsp:include page="/template/header.jsp"></jsp:include>    

<h2><%=title%></h2>

<%if(shotPgn.getList().isEmpty()){ %>
<h3>데이터가 존재하지 않습니다</h3>
<%}else{ %>
<table width="1100">
	<thead>
		<tr>
			<th>접종 번호</th>
			<th>예약 번호</th>
			<th>아이디</th>
			<th>1차 접종 완료 여부</th>
			<th>2차 접종 완료 여부</th>
			<th>주민등록번호</th>
			<th>메뉴</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(ShotDto shotDto : shotPgn.getList()){%>
			<tr>
				<td><%=shotDto.getShotNo()%></td>
				<td><%=shotDto.getResNo()%></td>
				<td><%=shotDto.getMemberId()%></td>
				<td><%=shotDto.getShotOne()%></td>
				<td><%=shotDto.getShotTwo()%></td>
				<td><%=shotDto.getShotMemberRrn()%></td>	
				<td>
					<a href="shot_detail.jsp?memberId=<%=shotDto.getMemberId()%>">상세</a>
				</td>	
			</tr>
		<%}%>
	</tbody>
</table>
<%}%>

<!-- 페이지 네비게이터 -->
<br><br>
<%if(shotPgn.isPreviousAvailable()){ %>
	<%if(shotPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="shot.jsp?column=<%=shotPgn.getColumn()%>&keyword=<%=shotPgn.getKeyword()%>&p=<%=shotPgn.getPreviousBlock()%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="shot.jsp?p=<%=shotPgn.getPreviousBlock()%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int i = shotPgn.getStartBlock(); i <= shotPgn.getRealLastBlock(); i++){ %>
	<%if(shotPgn.isSearch()){ %>
	<!-- 검색용 링크 -->
	<a href="shot.jsp?column=<%=shotPgn.getColumn()%>&keyword=<%=shotPgn.getKeyword()%>&p=<%=i%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="shot.jsp?p=<%=i%>"><%=i%></a>
	<%} %>
<%} %>

<%if(shotPgn.isNextAvailable()){ %>
	<%if(shotPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="shot.jsp?column=<%=shotPgn.getColumn()%>&keyword=<%=shotPgn.getKeyword()%>&p=<%=shotPgn.getNextBlock()%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="shot.jsp?p=<%=shotPgn.getNextBlock()%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>

<br><br>

<!-- 검색창 -->
<form action="shot.jsp" method="get">
	<select name="column" required>
		<option value="">선택</option>
		<option value="member_id">아이디</option>
		<option value="shot_member_rrn">주민등록번호</option>
	</select>
	<input type="text" name="keyword" required value="<%=shotPgn.getKeywordString()%>">
	
	<input type="submit" value="검색">
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>