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
<style>
img{
	width:100%;
}
.button_base {
	position:absolute;
	bottom:100px;
	left:200px;
    font-weight: bold;
    font-size:17px;
    border: 0;
    position: relative;
    width: 200px;
    height: 50px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
}
.btn {
    color: #000000;
    background-color: #ffffff;
    border: rgb(53, 66, 68) solid 1px;
    padding:15px;
    transition: all 0.1s ease;
    -webkit-transition: all 0.1s ease;
    -moz-transition: all 0.1s ease;
}

.btn:hover {
    color: #ffffff;
    background-color:rgb(53, 66, 68);
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
</style>
<div class="container-900 container-center">
	
<%if(list.isEmpty()){%>
	<div class="row center">
		<img src="<%=request.getContextPath()%>/resource/image/empty_shot.png">
		<div class="button_base btn">
		백신 접종 예약하러 가기
    	</div>
	</div>
<%}else{ %>
	<div class="row center">
		<h2>접종 내역</h2>
	</div>
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