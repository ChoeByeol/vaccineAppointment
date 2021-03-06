<%@page import="ncv.beans.NoticePagination"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@page import="ncv.beans.MemberDao"%>
<%@page import="ncv.beans.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
NoticePagination pagination = new NoticePagination(request);
pagination.calculate();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<head>
<style type="text/css"> 
a { text-decoration:none } 
</style> 
</head>

<style>
.sub_news, .sub_news th, .sub_news td {
	border: 0
}
.sub_news a {
	color: #383838;
	text-decoration: none
}
.sub_news {
	width: 100%;
	margin-top: 50px;
	border-bottom: 1px solid #999;
	color: #666;
	font-size: 14px;
	table-layout: fixed
}
.sub_news caption {
	display: none
}
.sub_news th {
	padding: 5px 0 6px;
	border-top: solid 1px #999;
	border-bottom: solid 1px #b2b2b2;
	background-color: #f1f1f4;
	color: #333;
	font-weight: bold;
	line-height: 20px;
	vertical-align: top
}
.sub_news td {
	padding: 8px 0 9px;
	border-bottom: solid 1px #d2d2d2;
	text-align: center;
	line-height: 18px;
}
.sub_news .title {
	text-align: left;
	padding-left: 15px;
	font-size: 13px;
}
.sub_news .title .pic, .sub_news .title .new {
	margin: 0 0 2px;
	vertical-align: middle
}
.sub_news .title a.comment {
	padding: 0;
	background: none;
	color: #000;
	font-size: 12px;
	font-weight: bold
}
ul.page {
	text-align: center;
	width: auto;
	height: 30px;
}
ul.page li {
	display: inline;
	vertical-align: middle;
}
ul.page li a {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 15px !important;
	color: #000;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}
ul.page li a.now {
	color: #fff;
	background-color: #999;
	border: 1px solid #999;
}
ul.page li a:hover {
	color: #fff;
	border: 1px solid #999;
	background-color: #999;
}
.button_base {
    position:absolute;
    font-size:17px;
    border: 0;
    position: relative;
    width: 60px;
    height: 30px;
    text-align: center;
    box-sizing: border-box;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-user-select: none;
    cursor: default;
    border-radius: 2px;
}
.btn {
    color: #000000;
    background-color:#dee2e6;
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
.search-btn {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 60px !important;
	color: white;
	background-color: rgb(26, 44, 48);
	font-weight: bold;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}
.search-btn :hover {
	color: #fff;
	border: 1px solid #999;
	background-color: #999;
}
.search-select {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 80px !important;
	color: #000;
	text-align: lefe;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
}
.search-select:focus {
	border: none;
	outline: 2px solid rgb(49, 107, 152);
	border-radius: 2px;
}
.search-keyword {
	display: -moz-inline-stack; /*FF2*/
	display: inline-block;
	vertical-align: top;
	padding: 4px;
	margin-right: 3px;
	width: 300px !important;
	color: #000;
	text-align: center;
	text-decoration: none;
	width /**/: 26px; /*IE 5.5*/
	line-height: 40px;
	height: 30px;
}
.border-spacing{
border-spacing:0px;
}
.search-keyword:focus {
	border: none;
	outline: 2px solid rgb(49, 107, 152);
	border-radius: 2px;
}
</style>

<%
//?????????... ????????? owner?????? ????????? ?????????????????? ???????????? ???????????? ???????????? ???????????? ??????????????? ????????? ????????? ?????? ??????...


String memberRole = (String)session.getAttribute("ses"); 

MemberDao memberDao = new MemberDao();
MemberDto memberDto = memberDao.get(memberRole);

boolean owner = memberDto != null && memberDto.getMemberRole().equals("?????????");

%>

<br>
<br>
<div class="row center">
	<div class="row center form-title-font" >?????? ??? ????????????</div>
	<table class="sub_news border-spacing" border="1"  summary="???????????? ????????? ?????????">

		

		<thead>
			<tr>
				<th style="width: 70px;">??????</th>
				<th width="40%">??????</th>
				<th>?????????</th>
				<th>?????????</th>
				<th>?????????</th>
			</tr>
		</thead>
<tbody align="center">
		<%for(NoticeDto noticeDto : pagination.getList()){ %>
		<tr>
			<td><%=noticeDto.getNoticeNo()%></td>
			
				
				<%-- 
					????????? 1????????? ????????? ????????? ???????????????. ????????? ???????????? ????????????.
					????????? 0????????? ?????? ???????????????. ???????????????????????????. 
				--%>
				<%
					if(noticeDto.getNoticeDepth()==1){%>
					<td class="title" style="font-size:15px; font-weight: bold; color: #003663" >
					<img src="<%=request.getContextPath()%>/resource/image/notice.jpg" width="15" height="15">
					<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">
					<%=noticeDto.getNoticeTitle()%>
					</a>
					</td>
				
				<%} %>
						
				<%if(noticeDto.getNoticeDepth()==0){%>
				<td class="title">
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>">
					<%=noticeDto.getNoticeTitle()%>
					</a>
					</td>
					<%} %>
													


			</td>
			<td><%=noticeDto.getNoticeWriter()%></td>
			<td><%=noticeDto.getNoticeTime()%></td>
			<td><%=noticeDto.getNoticeHit()%></td>

		</tr>
		<%} %>
	</tbody>
	</table>
	
	
	<br>
</div>
<div class="row right">

		<!-- ???????????? ???????????? ????????? ?????? ???????????? ?????? -->
<%if(owner){%>
	<a href="write.jsp" class="form-link-btn">?????????</a>
		<%} %>

</div>

<ul class="page">
	<div class="row pagination">
		<!-- ?????? ?????? -->
		<%
		if (pagination.isPreviousAvailable()) {
		%>
		<%
		if (pagination.isSearch()) {
		%>
		<!-- ????????? ?????? -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
		<%
		} else {
		%>
		<!-- ????????? ?????? -->
		<li><a href="list.jsp?p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
		<%
		}
		%>
		<%
		} else {
		%>
		<li><a>&lt;</a>
		<li>
			<%
			}
			%> <!-- ????????? ??????????????? --> <%
 for (int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++) {
 %>
			<%
			if (pagination.isSearch()) {
			%> <!-- ????????? ?????? -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i%></a></li>
		<%
		} else {
		%>
		<!-- ????????? ?????? -->
		<li><a href="list.jsp?p=<%=i%>"><%=i%></a></li>
		<%
		}
		%>
		<%
		}
		%>


		<!-- ?????? -->
		<%
		if (pagination.isNextAvailable()) {
		%>
		<%
		if (pagination.isSearch()) {
		%>
		<!-- ????????? ?????? -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;</a></li>
		<%
		} else {
		%>
		<!-- ????????? ?????? -->
		<li><a href="list.jsp?p=<%=pagination.getNextBlock()%>">&gt;</a></li>
		<%
		}
		%>
		<%
		} else {
		%>
		<li><a>&gt;</a></li>
		<%
		}
		%>
	</div>
</ul>


<!-- ????????? -->

<div class="row center">
	<form action="list.jsp" method="get">

		<select name="column" class="search-select">
			<%
			if (pagination.columnIs("notice_title")) {
			%>
			<option value="notice_title" selected>??????</option>
			<%
			} else {
			%>
			<option value="notice_title">??????</option>
			<%
			}
			%>

			<%
			if (pagination.columnIs("notice_content")) {
			%>
			<option value="notice_content" selected>??????</option>
			<%
			} else {
			%>
			<option value="notice_content">??????</option>
			<%
			}
			%>

			<%
			if (pagination.columnIs("notice_writer")) {
			%>
			<option value="notice_writer" selected>?????????</option>
			<%
			} else {
			%>
			<option value="notice_writer">?????????</option>
			<%
			}
			%>
		</select> <input type="search" name="keyword" placeholder="????????? ??????" required
			value="<%=pagination.getKeywordString()%>" class="search-keyword">

		<input type="submit" value="??????" class="btn button_base">
	</form>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>