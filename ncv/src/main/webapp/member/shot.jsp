<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="ncv.beans.ShotDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.ShotDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//	String memberId = (String)session.getAttribute("ses");
	String memberId = request.getParameter("memberId");
	ShotDao shotDao = new ShotDao();
	List<ShotDto> list = shotDao.select(memberId);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<h2>접종 내역</h2>

<%if(list.isEmpty()){%>
<h3>접종 내역이 존재하지 않습니다</h3>
<%}else{ %>
<table width="1100">
	<thead>
		<tr>
			<th>접종 번호</th>
			<th>예약 번호</th>
			<th>1차 접종 완료 여부</th>
			<th>최종 접종 완료 여부</th>
			<th>주민등록번호</th>
			<th>메뉴</th>
		</tr>
	</thead>
	<tbody align="center">
		<%for(ShotDto shotDto : list){%>
			<tr>			
				<td><%=shotDto.getShotNo()%></td>
				<td><%=shotDto.getResNo()%></td>
				<td><%=shotDto.getShotStCom()%></td>
				<td><%=shotDto.getShotEndCom()%></td>
				<td><%=shotDto.getShotMemberNo()%></td>	
				<td>
					<a href="shot_detail.jsp?memberId=<%=memberId%>">상세</a>
				</td>	
			</tr>
		<%}%>
	</tbody>
</table>
<%} %>
<jsp:include page="/template/footer.jsp"></jsp:include>