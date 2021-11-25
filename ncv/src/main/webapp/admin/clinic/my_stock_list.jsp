<%@page import="ncv.beans.ClinicDto"%>
<%@page import="ncv.beans.ClinicDao"%>
<%@page import="ncv.beans.StockDao"%>
<%@page import="ncv.beans.StockVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int clinicNo = Integer.parseInt(request.getParameter("clinicNo"));
	StockDao stockDao = new StockDao();
	List<StockVo> list = stockDao.clinicStockList(clinicNo);
	ClinicDao clinicDao = new ClinicDao();
	ClinicDto clinicDto = clinicDao.select(clinicNo);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
	<div class="row center">
		<h2><%=clinicDto.getClinicName()%> 재고 상세 정보</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>백신</th>
					<th>입고개수</th>	
					<th>출고개수</th>
					<th>총개수</th>	
				</tr>
				<%for (StockVo stockVo : list){ %>
				<tr>
					<td><%=stockVo.getVaccineName()%></td>
					<td><%=stockVo.getStockInQty()%></td>
					<td><%=stockVo.getStockOutQty()%></td>
					<td><%=stockVo.getTotalStock()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>   