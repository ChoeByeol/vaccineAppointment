
<%@page import="ncv.beans.Stock3Vo"%>
<%@page import="ncv.beans.StockDto"%>
<%@page import="ncv.beans.StockPagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	StockPagination stockPgn = new StockPagination(request);
	
	stockPgn.calculate();
	
	
	//삼항 연산 : if문 축소버전 - (조건) ? 참 : 거짓
	String title = stockPgn.isSearch() ? "재고 검색" : "재고 목록";
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#cancel-btn").click(function() {
			return confirm("정말 취소하시겠습니까?");
		});
	});
	
</script>
<style>
	.cancel-btn{
		border:none;
		padding:0.5rem;
		text-decoration:none;
		color:gray;
		font-family:NotoSans;
	}
	.cancel-btn:hover{
		color:red;
	}
</style>
<div class="container-900 container-center">
<div class="row center">
	<h2><%=title%></h2>
</div>

<%if(stockPgn.getList().isEmpty()){ %>
<div class="row center">
	<h3>데이터가 존재하지 않습니다</h3>
</div>
<%}else{ %>
<table class="table table-stripe">
	<thead>
		<tr>
			<th>재고 번호</th>
			<th>병원 이름</th>
			<th>백신 이름</th>
			<th>입고 수량</th>
			<th>출고 수량</th>
			<th>입/출고 일자</th>
			<th>메뉴</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(Stock3Vo stock3Vo : stockPgn.getList()){%>
			<tr>
				<td><%=stock3Vo.getStockNo()%></td>
				<td><%=stock3Vo.getClinicName()%></td>
				<td><%=stock3Vo.getVaccineName()%></td>
				<td><%=stock3Vo.getStockInQty()%></td>
				<td><%=stock3Vo.getStockOutQty()%></td>
				<td><%=stock3Vo.getUpdateTime()%></td>
				<td>
					<a id="cancel-btn" class="link-btn cancel-btn" href="cancel.txt?stockNo=<%=stock3Vo.getStockNo()%>">취소</a>
				</td>	
			</tr>
		<%}%>
	</tbody>
</table>
<%}%>
</div>

<!-- 페이지 네비게이터 -->
<br><br><ul class="page">
	<div class="row pagination">
<%if(stockPgn.isPreviousAvailable()){ %>
	<%if(stockPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="stock_list.jsp?column=<%=stockPgn.getColumn()%>&keyword=<%=stockPgn.getKeyword()%>&p=<%=stockPgn.getPreviousBlock()%>">&lt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="stock_list.jsp?p=<%=stockPgn.getPreviousBlock()%>">&lt;</a>
	<%} %>
<%} else { %>
	 <a>&lt;</a>
<%} %> 

<%for(int i = stockPgn.getStartBlock(); i <= stockPgn.getRealLastBlock(); i++){ %>
	<%if(stockPgn.isSearch()){ %>
	<!-- 검색용 링크 -->
	<a href="stock_list.jsp?column=<%=stockPgn.getColumn()%>&keyword=<%=stockPgn.getKeyword()%>&p=<%=i%>"><%=i%></a>
	<%}else{ %>
	<!-- 목록용 링크 -->
	<a href="stock_list.jsp?p=<%=i%>"><%=i%></a>
	<%} %>
<%} %>

<%if(stockPgn.isNextAvailable()){ %>
	<%if(stockPgn.isSearch()){ %>
		<!-- 검색용 링크 -->
		<a href="stock_list.jsp?column=<%=stockPgn.getColumn()%>&keyword=<%=stockPgn.getKeyword()%>&p=<%=stockPgn.getNextBlock()%>">&gt;</a>
	<%} else { %>
		<!-- 목록용 링크 -->
		<a href="stock_list.jsp?p=<%=stockPgn.getNextBlock()%>">&gt;</a>
	<%} %> 
<%} else {%>
	<a>&gt;</a>
<%} %>

<br><br>
</div>

<!-- 검색창 -->
<div class="row center">
<form action="stock_list.jsp" method="get">
	<select name="column" required>
		<option value="">선택</option>
		<option value="stock_no">재고번호</option>
		<option value="vaccine_name">백신이름</option>
		<option value="clinic_name">병원이름</option>
	</select>
	<input type="text" name="keyword" required value="<%=stockPgn.getKeywordString()%>">
	
	<input type="submit" value="검색">
</form>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>