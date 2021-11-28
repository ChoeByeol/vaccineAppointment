<%@page import="java.util.List"%>
<%@page import="ncv.beans.QnaDao"%>
<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaPagination"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String qnaWriter = (String)session.getAttribute("ses");
QnaDao qnaDao = new QnaDao();
List<QnaDto> mylist = qnaDao.mylist(qnaWriter);
%>

<%-- 출력 --%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
		
.sub_news,.sub_news th,.sub_news td{border:0}
.sub_news a{color:#383838;text-decoration:none}
.sub_news{width:100%;border-bottom:1px solid #999;color:#666;font-size:14px;table-layout:fixed}
.sub_news caption{display:none}
.sub_news th{padding:5px 0 6px;border-top:solid 1px #999;border-bottom:solid 1px #b2b2b2;background-color:#f1f1f4;color:#333;font-weight:bold;line-height:20px;vertical-align:top;}
.sub_news td{padding:8px 0 9px;border-bottom:solid 1px #d2d2d2;text-align:center;line-height:18px;}
.sub_news .title{text-align:left; padding-left:15px; font-size:13px;}
.sub_news .title .pic,.sub_news .title .new{margin:0 0 2px;vertical-align:middle}
.sub_news .title a.comment{padding:0;background:none;color:#f00;font-size:12px;font-weight:bold}
	
.border-spacing{
	border-spacing:0px;
}

</style>

<div class="container-800 container-center">

	<div class="row center">
		<h2 class="row center" >나의 1:1문의</h2>
	</div>
	
	<div class="row center">
		<h5>• 문의글은 24시간 이내로 답변드리며, 마이페이지 > 1:1 문의 내역에서도 조회 가능합니다.</h5>
		<h5>• 서비스 운영시간: 오전 9시 ~ 오후 6시 월 ~ 금 (토, 일, 공휴일 제외)</h5>
	</div>
	
	<div class="row">
		<table class="sub_news border-spacing" border="1" cellspacing="0" >
			<thead>
				<tr>
					<th>번호</th>
					<th width="40%">제목</th>
					<th>상태</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody align="center">
				<%for(QnaDto qnaDto : mylist){ %>
				<tr>
					<td><%=qnaDto.getQnaNo()%></td>
					<td class="left">
					
						<a href="detail.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">
							<%=qnaDto.getQnaTitle()%>
						</a>
						
					</td>
					<td><%=qnaDto.getQnaState()%></td>
					<td><%=qnaDto.getQnaDate()%></td>
				</tr>
				<%} %>
			</tbody>
		</table>
	</div>
	
	<div class="row right">
		<a href="write.jsp" class="link-btn">문의하기</a>
	</div>
	
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>