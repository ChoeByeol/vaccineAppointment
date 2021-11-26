<%@page import="ncv.beans.Shot2Vo"%>
<%@page import="ncv.beans.Shot2Dao"%>
<%@page import="ncv.beans.ReservationVo"%>
<%@page import="ncv.beans.ReservationDao"%>
<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String memberId = (String) session.getAttribute("ses");
%>

<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

<%
	Shot2Dao shotDao = new Shot2Dao();
	List<Shot2Vo> myShotList  = shotDao.myShotList(memberId);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
	.link-btn {
		width:100%;
	}
	.flex-item{
		width:450px;
	}
	.quit-btn{
		border:none;
		padding:0.5rem;
		text-decoration:none;
		color:gray;
		font-family:NotoSans;
		font-size:12px;
	}
	.quit-btn:hover{
		color:red;
	}
	.table-title{
		font-family:Apple;
		font-size:20px;
		margin-bottom:10px;
		color:rgb(26, 44, 48);
	}
	.page-title{
		color:rgb(26, 44, 48);
	}
	.warning-img{
		width:70%;
	}
</style>
<%if(myShotList.size() > 0) {%>
<div class="container-900 container-center">
	<div class="row">
		<br><br>
			<!-- 1단 : 예약자 정보 -->
			<div class="row">
				<div>
					<a class="table-title">접종자정보</a>
				</div>
				<table class="table table-stripe">
					<tbody>
						<tr class="table-line">
							<th width="30%">아이디</th>
							<td><%=memberDto.getMemberId()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">이름</th>
							<td><%=memberDto.getMemberName()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">주민등록번호</th>
 							<td><%=memberDto.getMemberRrn()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%">핸드폰번호</th>
							<td><%=memberDto.getMemberPhone()%></td>
						</tr>					
					</tbody>
				</table>
			</div>
			<br><br><br>
		<!-- 2단 -->
			<!-- 예약 정보 -->
			<div class="row">
				<div class="table-title">
					<a class="table-title">접종정보</a>
				</div>
				<table class="table table-stripe">
					<tbody>
					
					<% for (Shot2Vo shotVo : myShotList) { %>
						<tr class="table-line">
							<th width="30%"><%=shotVo.getShotCount()%>차 예약번호</th>
							<td><%=shotVo.getShotNo()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=shotVo.getShotCount()%>차 의료기관</th>
							<td><%=shotVo.getClinicName()%></td>
						</tr>
						<tr class="table-line">
							<th width="30%"><%=shotVo.getShotCount()%>차 접종일시</th>
							<td><%=shotVo.getShotDateDay()%></td>
						</tr>
						<%} %>
						<tr>						
					</tbody>
				</table>
			</div>
		</div>
	</div>
<%} else {%>
		<img class="warning-img" src="<%=request.getContextPath()%>/resource/image/not_shot.png">
<%} %>
 <jsp:include page="/template/footer.jsp"></jsp:include>