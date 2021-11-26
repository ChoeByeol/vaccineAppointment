<%@page import="ncv.beans.NoticeDto"%>
<%@page import="ncv.beans.NoticeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	int noticeNo = Integer.parseInt(request.getParameter("noticeNo"));
%>

<%
	NoticeDao noticeDao = new NoticeDao();
	NoticeDto noticeDto = noticeDao.get(noticeNo);
%>



<html>
<jsp:include page="/template/header.jsp"></jsp:include>

<head>
<h2>공지사항 수정</h2>
</head>


<body>

    <br>
    <br>
   <form action="edit.txt" method="post">
 
 <input type="hidden" name="noticeNo" value="<%=noticeDto.getNoticeNo()%>">
 
    <table width="700" border="3" bordercolor="lightgray" align="center">
            <tr>
            <td>
                제 목
            </td>
            <td>
               <td><input type="text" name="noticeTitle" required value="<%=noticeDto.getNoticeTitle()%>"></td>
            </td>        
        </tr>
        <tr>
            <td>
                내 용
            </td>
            <td>
                <textarea name="noticeContent" required cols="80" rows="20">
      <%=noticeDto.getNoticeContent()%></textarea>       
            </td>        
        </tr>

 
            <tr>
                <td id="title">
                    기존 파일
                </td>
                <td>
                    &nbsp;&nbsp; ${notice.notice_file}
                </td>    
            </tr>
            <tr>
                <td id="title">
                    첨부파일
                </td>
                <td>
                    <input type="file" name="notice_file"/>
                </td>    
            </tr>
        
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="수정" >
                <input type="button" value="목록" onclick="changeView()" >            
            </td>
        </tr>
    </table>    
    </form>
    
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>
</html>