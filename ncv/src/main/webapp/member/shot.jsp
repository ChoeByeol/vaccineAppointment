<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.ShotDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ShotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String memberId = (String)session.getAttribute("ses");
	ShotDao shotDao = new ShotDao();
	List<ShotDto> list = shotDao.select(memberId);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="container-900 container-center">
	<div class="row center">
		<h2>접종 내역</h2>
	</div>
<%if(list.isEmpty()){%>
	<div class="row center">
		<h2>접종 내역이 존재하지 않습니다</h2>
	</div>
<%}else{ %>
	<div class="row">
		<table class="table table-stripe">
			<thead>
				<tr>
					<th>접종 번호</th>
					<th>예약 번호</th>
					<th>1차 접종 완료 여부</th>
					<th>2차 접종 완료 여부</th>
					<th>주민등록번호</th>
					<th>메뉴</th>
				</tr>
			</thead>
			<tbody>
				<%for(ShotDto shotDto : list){%>
					<tr>			
						<td><%=shotDto.getShotNo()%></td>
						<td><%=shotDto.getResNo()%></td>
						<td><%=shotDto.getShotOne()%></td>
						<td><%=shotDto.getShotTwo()%></td>
						<td><%=shotDto.getShotMemberRrn()%></td>	
						<td>
							<a href="shot_detail.jsp?memberId=<%=memberId%>">상세</a>
						</td>
					</tr>
				<%}%>
			</tbody>
		</table>
	</div>
<%} %>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>