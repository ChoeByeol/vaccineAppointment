<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="ncv.servlet.notice.NoticeWriteServlet"%>

<html>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>

</style>
<form action="write.txt" method="post" enctype="multipart/form-data">
 
<div class="container-800 container-center">

 <div class="row center form-title-font">공지사항 </div>

   <!-- 제목 -->
   <div class="row center form-title-font">

   </div>

   <div class="row">
      <h3>제목</h3>
      <input type="text" name="noticeTitle" required class="form-input-title form-input" >
   </div>

   <div class="row">
      <h3>내용</h3>
      <textarea name="noticeContent" required rows="10" class="form-input-board form-input"></textarea>
   </div>

   <div class="row">
      <h4><label class="form-block">첨부파일</label></h4>
      <input type="file" name="attach" class="form-btn form-file-btn">
   </div>

   <div class="row right">
      <a href="list.jsp" class="form-link-btn">목록</a> 
      <input type="submit" value="등록" class="form-btn form-inline form-notice-btn">
   </div>

</div>

</form>


<jsp:include page="/template/header.jsp"></jsp:include>  
<head>
    <h2>공지사항 작성</h2>
    

</head>
<body>
 
    <br>
    <br>
    
    <form action="write.txt" method="post" enctype="multipart/form-data">
    <table width="700" border="3" bordercolor="lightgray" align="center">
        <tr>
            <td>작성자</td>
			<td>
              <input type="text" name="noticeWriter" required value=" 관리자                       
              ">

            </td>   
        </tr>
            <tr>
            <td>
                제 목
            </td>
            <td>
                <input type="text" name="noticeTitle" required size="70" maxlength="100" value=""/>
            </td>        
        </tr>
        <tr>
            <td>
                내 용
            </td>
            <td>
                <textarea name="noticeContent" cols="80" rows="20"></textarea>            
            </td>        
        </tr>
        <tr>
            <td>
                파일첨부
            </td>
            <td>
                <input type="file" name="attach">
            </td>    
        </tr>
 
        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="등록">
                <input type="button" value="목록" onClick="location.href='http://localhost:8061/ncv/notice/list.jsp'">            
            </td>
        </tr>
    </table>    
    </form>
    
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>

</html>

