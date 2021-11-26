<%@page import="ncv.beans.MemberPagination"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	MemberPagination memPgn = new MemberPagination(request);
	
	memPgn.calculate();
	
	
	//삼항 연산 : if문 축소버전 - (조건) ? 참 : 거짓
	String title = memPgn.isSearch() ? "회원 검색" : "회원 목록";
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>

 .button_base {
    position:absolute;
    bottom:10%;
    font-weight: bold;
    font-size:16px;
    border: 0;
    position: relative;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
	text-decoration:none;
    color: #000000;
 	padding:2px; 
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn:hover {
    color: #dee2e6;
    animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -webkit-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    -moz-animation: b09_electric_blinkIn 0.1s step-end 0 2;
    transition: all 0.2s ease 0.2s;
    -webkit-transition: all 0.2s ease 0.2s;
    -moz-transition: all 0.2s ease 0.2s;
}

@-webkit-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}

@-moz-keyframes btn {
    from,
    to {
        background-color: #f8f8f8;
        color: #080808;
    }
    50% {
        background-color: #ffffff;
        color: #000000;
    }
}
table > tbody > tr > td{
	height:15px;
	padding:2px;
}
</style>
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
					<a href="detail.jsp?memberId=<%=memberDto.getMemberId()%>" class="btn button_base">상세</a>
					<a href="edit.jsp?memberId=<%=memberDto.getMemberId()%>" class="btn button_base">수정</a>
					<a href="quit.txt?memberId=<%=memberDto.getMemberId()%>" class="btn button_base">탈퇴</a>
				</td>	
			</tr>
		<%}%>
	</tbody>
</table>
<%}%>
</div>

<div class="center">
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
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>