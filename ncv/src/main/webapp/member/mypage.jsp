<%@page import="ncv.beans.TotalHistoryDto"%>
<%@page import="home.beans.TotalHistoryDao"%>
<%@page import="java.text.Format"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="home.beans.HistoryDao"%>
<%@page import="home.beans.HistoryDto"%>
<%@page import="home.beans.MemberDto"%>
<%@page import="home.beans.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : 현재 로그인한 회원ID - String member_id--%>
<%
	String member_id = (String)session.getAttribute("ses");
%>

<%-- 처리 : 회원정보(MemberDto) --%>
<%
	MemberDao memberDao = new MemberDao();
	MemberDto memberDto = memberDao.get(member_id);
%>

 <%-- 처리 : 포인트 내역(HistoryDto) --%>
 
<%	
// 	아래와 같이 조회하면 취소 여부를 알 수 없다.
// 	HistoryDao historyDao = new HistoryDao();
// 	List<HistoryDto> historyList = historyDao.findByMemberId(memberId);

// 	새롭게 만든 뷰(total_history)를 이용하여 포인트 이력을 조회(취소여부가 붙어있느냐여부의 차이)
	TotalHistoryDao historyDao = new TotalHistoryDao();
	List<TotalHistoryDto> historyList = historyDao.findByMember_id(member_id);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
	.float-container >.float-item-left:nth-child(1){
		width:30%;
	}
	.float-container >.float-item-left:nth-child(2){
		width:70%;
	}
	.link-btn {
		width:100%
	}
	
</style>

<!-- 이 페이지를 2단으로 구현 -->
<div class="container-900 container-center">
	<div class="row">
		 <h2> 회원 상세 정보</h2>
	</div>
	<div class="row float-container">
	
		<!-- 1단 -->
		<div class="float-item-left">
			<!-- 회원 프로필 이미지 -->
			<div class="row">				
<%-- 			<%if(memberProfileDto == null){ %>
					<img src="https://via.placeholder.com/300x300?text=User" width="100%" class="image image-round image-border">
					<%}else{ %>
					<img src="profile.kh?memberProfileNo=<%=memberProfileDto.getMemberProfileNo()%>" width="100%" class="image image-round image-border">
					<%} %>
--%>
			</div>
			
			<!-- 회원 아이디 -->
			<div class="row center">
				<h2><%=memberDto.getMember_id()%></h2>
			</div>
			
			<!-- 각종 메뉴들 -->
			<div class="row center">
				<a href="password.jsp" class="link-btn-block">비밀번호 변경</a>
			</div>
			<div class="row center">
				<a href="edit.jsp" class="link-btn-block">개인정보 변경</a>
			</div>
			<div class="row center">
				<a href="check.jsp" class="link-btn-block">회원 탈퇴</a>
			</div>
	</div>
	
	<!-- 2단 -->
	<div class="float-item-left">
			<!-- 회원 정보 출력 -->
			<div class="row">
				<h2>회원 상세 정보</h2>
			</div>
			<div class="row">
				<table class="table table-stripe">
					<tbody>
						<tr>
							<th width="25%">아이디</th>
							<td><%=memberDto.getMember_id()%></td>
						</tr>
						<tr>
							<th>닉네임</th>
							<td><%=memberDto.getMember_Nick()%></td>
						</tr>
						<tr>
							<th>생년월일</th>
							<td><%=memberDto.getMember_Birth()%></td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><%=memberDto.getMember_emailString()%></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><%=memberDto.getMember_phoneString()%></td>
						</tr>
						<tr>
							<th>가입일시</th>
							<td><%=memberDto.getMember_join()%></td>
						</tr>
						<tr>
							<th>포인트</th>
							<td><%=memberDto.getMember_point()%></td>
						</tr>
						<tr>
							<th>회원등급</th>
							<td><%=memberDto.getMember_grade()%></td>
						</tr>
					</tbody>
				</table>			
			</div>
			
	<!-- 포인트 내역 출력 -->	
		<div class="row">
			<h2>포인트 상세 내역</h2>
		</div>
	
		<div class="row">
			<table class="table table-border table-hover">
				<thead>
					<tr>
						<th>일시</th>
						<th>금액</th>
						<th>메모</th>
						<th>cancel</th>
						<th>취소</th>
					</tr>
				</thead>
				<tbody>
					<%Format f = new DecimalFormat("#,##0"); %>
					<%for(TotalHistoryDto historyDto : historyList) { %>
					<tr>
						<td align="center"><%=historyDto.getHistory_time()%></td>
						<td align="right"><%=f.format(historyDto.getHistory_amount())%></td>
						<td align="left"><%=historyDto.getHistory_memo()%></td>
						<td><%=historyDto.getCancel()%></td>
						<td>
							<%if(historyDto.available()){%>
							<a href="../point/cancel.kh?history_no=<%=historyDto.getHistory_no()%>">취소</a>
							<a href="<%=request.getContextPath()%>/point/cancel.kh?history_no=<%=historyDto.getHistory_no()%>">취소</a>
							<%} %>
						</td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>
		
		<!-- 내가 작성한 게시글 출력 -->
 




<jsp:include page="/template/footer.jsp"></jsp:include>
