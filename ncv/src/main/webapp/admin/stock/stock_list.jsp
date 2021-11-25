
입고목록과 출고목록을 같이 조회해야하며 페이지네이션까지 가능해야됌

밑은 멤버리스트 일단 긁어온거임

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberPagination memPgn = new MemberPagination(request);
	
	memPgn.calculate();
	
	
	//삼항 연산 : if문 축소버전 - (조건) ? 참 : 거짓
	String title = memPgn.isSearch() ? "회원 검색" : "회원 목록";
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
<div class="row center">
	<h2><%=title%></h2>
</div>

<%if(memPgn.getList().isEmpty()){ %>
<div class="row center">
	<h3>데이터가 존재하지 않습니다</h3>
</div>
<%}else{ %>
<table class="table table-stripe">
	<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>성별</th>
			<th>등급</th>
			<th>메뉴</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(MemberDto memberDto : memPgn.getList()){%>
			<tr>
				<td><%=memberDto.getMemberId()%></td>
				<td><%=memberDto.getMemberName()%></td>
				<td><%=memberDto.getMemberGender()%></td>
				<td><%=memberDto.getMemberRole()%></td>
				<td>
					<a href="detail.jsp?memberId=<%=memberDto.getMemberId()%>">상세</a>
					<a href="edit.jsp?memberId=<%=memberDto.getMemberId()%>">수정</a>
					<a href="quit.txt?memberId=<%=memberDto.getMemberId()%>">탈퇴</a>
				</td>	
			</tr>
		<%}%>
	</tbody>
</table>
<%}%>
</div>

<!-- 페이지 네비게이터 -->
<br><br>
<%if(memPgn.isPreviousAvailable()){ %>
	<%if(memPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=memPgn.getColumn()%>&keyword=<%=memPgn.getKeyword()%>&p=<%=memPgn.getPreviousBlock()%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=memPgn.getPreviousBlock()%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int i = memPgn.getStartBlock(); i <= memPgn.getRealLastBlock(); i++){ %>
	<%if(memPgn.isSearch()){ %>
	<!-- 검색용 링크 -->
	<a href="list.jsp?column=<%=memPgn.getColumn()%>&keyword=<%=memPgn.getKeyword()%>&p=<%=i%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="list.jsp?p=<%=i%>"><%=i%></a>
	<%} %>
<%} %>

<%if(memPgn.isNextAvailable()){ %>
	<%if(memPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="list.jsp?column=<%=memPgn.getColumn()%>&keyword=<%=memPgn.getKeyword()%>&p=<%=memPgn.getNextBlock()%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="list.jsp?p=<%=memPgn.getNextBlock()%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>

<br><br>

<!-- 검색창 -->
<form action="list.jsp" method="get">
	<select name="column" required>
		<option value="">선택</option>
		<option value="member_id">아이디</option>
		<option value="member_name">이름</option>
		<option value="member_gender">성별</option>
		<option value="member_grade">등급</option>
	</select>
	<input type="text" name="keyword" required value="<%=memPgn.getKeywordString()%>">
	
	<input type="submit" value="검색">
</form>


<jsp:include page="/template/footer.jsp"></jsp:include>