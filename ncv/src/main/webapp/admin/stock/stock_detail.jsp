<%@page import="ncv.beans.StockOutDao"%>
<%@page import="ncv.beans.StockVo"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.StockInDto"%>
<%@page import="ncv.beans.StockInDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));
	StockInDao stockInDao = new StockInDao();
	List<StockVo> inList = stockInDao.myInStockList(clinicNo);
	StockOutDao stockOutDao = new StockOutDao();
	List<StockVo> outList = stockOutDao.myOutStockList(clinicNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
	<div class="row center">
		<h2>입고 상세 정보</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>백신</th>
					<th>입고개수</th>			
				</tr>
				<%for (StockVo stockVo : inList){ %>
				<tr>
					<td><%=stockVo.getVaccineName()%></td>
					<td><%=stockVo.getStockInQty()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	<br>
	<br>
	<div class="row center">
		<h2>출고 상세 정보</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>백신</th>
					<th>출고개수</th>			
				</tr>
				<%for (StockVo stockVo : outList){ %>
				<tr>
					<td><%=stockVo.getVaccineName()%></td>
					<td><%=stockVo.getStockOutQty()%></td>
				</tr>
			<%} %>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>   