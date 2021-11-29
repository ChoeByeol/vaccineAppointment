<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String memberId = request.getParameter("memberId");
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(memberId);
%>

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
</style>
<jsp:include page="/template/header.jsp"></jsp:include>
<div class="container-900 container-center">
	<div class="row center">
		<h2>회원 상세 정보</h2>
	</div>
	<br>
	<div class="row">
		<table class="table table-stripe">
			<tbody>
				<tr>
					<th>아이디</th>
					<td><%=memberDto.getMemberId()%></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><%=memberDto.getMemberName()%></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><%=memberDto.getMemberRrn()%></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><%=memberDto.getMemberGender()%></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><%=memberDto.getMemberAddress()%></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=memberDto.getMemberPhone()%></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><%=memberDto.getMemberJoin()%></td>
				</tr>
				<tr>
					<th>등급</th>
					<td><%=memberDto.getMemberRole()%></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><%=memberDto.getAge()%></td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="right">
		<a href="list.jsp" class="btn button_base">목록</a>
	</div>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>    