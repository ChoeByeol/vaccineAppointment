<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<html>
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
                <input type="submit" value="등록" >
                <input type="button" value="목록" >            
            </td>
        </tr>
    </table>    
    </form>
    
</body>
<jsp:include page="/template/footer.jsp"></jsp:include>
</html>


