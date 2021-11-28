<%@page import="ncv.beans.NoticePagination"%>
<%@page import="ncv.beans.NoticeDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
NoticePagination pagination = new NoticePagination(request);
pagination.calculate();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

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
	color: #f00;
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

.title{
margin: 10px;
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


<br>
<br>
<div class="row center">
	<div class="row center form-title-font" >공지 및 안내사항</div>
	<table class="sub_news border-spacing" border="1"  summary="게시판의 글제목 리스트">

		

		<thead>
			<tr>
				<th style="width: 70px;">번호</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody align="center">

			<%
			for (NoticeDto noticeDto : pagination.getList()) {
			%>
			<tr>
				<td class="no" style="width: 70px;"><%=noticeDto.getNoticeNo()%></td>
				<td class="title"><a
					href="detail.jsp?noticeNo=<%=noticeDto.getNoticeNo()%>"> <%=noticeDto.getNoticeTitle()%></a>
				</td>
				<td class="writer"><%=noticeDto.getNoticeWriter()%></td>
				<td class="time"><%=noticeDto.getNoticeTime()%></td>
				<td class="hit"><%=noticeDto.getNoticeHit()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
	<br>
</div>
<div class="row right">
	<a href="write.jsp" class="link-btn">글쓰기</a>
</div>

<ul class="page">
	<div class="row pagination">
		<!-- 이전 버튼 -->
		<%
		if (pagination.isPreviousAvailable()) {
		%>
		<%
		if (pagination.isSearch()) {
		%>
		<!-- 검색용 링크 -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getPreviousBlock()%>">&lt;</a></li>
		<%
		} else {
		%>
		<!-- 목록용 링크 -->
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
			%> <!-- 페이지 네비게이터 --> <%
 for (int i = pagination.getStartBlock(); i <= pagination.getRealLastBlock(); i++) {
 %>
			<%
			if (pagination.isSearch()) {
			%> <!-- 검색용 링크 -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=i%>"><%=i%></a></li>
		<%
		} else {
		%>
		<!-- 목록용 링크 -->
		<li><a href="list.jsp?p=<%=i%>"><%=i%></a></li>
		<%
		}
		%>
		<%
		}
		%>


		<!-- 다음 -->
		<%
		if (pagination.isNextAvailable()) {
		%>
		<%
		if (pagination.isSearch()) {
		%>
		<!-- 검색용 링크 -->
		<li><a
			href="list.jsp?column=<%=pagination.getColumn()%>&keyword=<%=pagination.getKeyword()%>&p=<%=pagination.getNextBlock()%>">&gt;</a></li>
		<%
		} else {
		%>
		<!-- 목록용 링크 -->
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


<!-- 검색창 -->

<div class="row center">
	<form action="list.jsp" method="get">

		<select name="column" class="search-select">
			<%
			if (pagination.columnIs("notice_title")) {
			%>
			<option value="notice_title" selected>제목</option>
			<%
			} else {
			%>
			<option value="notice_title">제목</option>
			<%
			}
			%>

			<%
			if (pagination.columnIs("notice_content")) {
			%>
			<option value="notice_content" selected>내용</option>
			<%
			} else {
			%>
			<option value="notice_content">내용</option>
			<%
			}
			%>

			<%
			if (pagination.columnIs("notice_writer")) {
			%>
			<option value="notice_writer" selected>작성자</option>
			<%
			} else {
			%>
			<option value="notice_writer">작성자</option>
			<%
			}
			%>
		</select> <input type="search" name="keyword" placeholder="검색어 입력" required
			value="<%=pagination.getKeywordString()%>" class="search-keyword">

		<input type="submit" value="검색" class="btn button_base">
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>