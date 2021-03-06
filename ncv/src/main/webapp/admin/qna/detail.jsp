<%@page import="ncv.beans.QnaDto"%>
<%@page import="ncv.beans.QnaFileDto"%>
<%@page import="java.util.List"%>
<%@page import="ncv.beans.QnaFileDao"%>
<%@page import="ncv.beans.QnaDao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 입력 : 게시글 번호 --%>
<%
    int qnaNo = Integer.parseInt(request.getParameter("qnaNo"));
%>

<%
    String memberId = (String)session.getAttribute("ses");
    String grade = (String) session.getAttribute("grade");
    
    QnaDao qnaDao = new QnaDao();
    QnaDto qnaDto = qnaDao.get(qnaNo);
    
    //본인 글인지 아닌지 판정
    boolean writer = memberId.equals(qnaDto.getQnaWriter());
    //관리자 판정
    boolean admin = grade != null && grade.equals("관리자");
%>

<%
    //현재 게시글에 대한 파일 정보를 조회
    QnaFileDao qnaFileDao = new QnaFileDao();
    //List<QnaFileDto> fileList = qnaFileDao.find(qnaNo);
    List<QnaFileDto> qnaFileList = qnaFileDao.find(qnaNo);//파일이 여러 개일 경우
    //QnaFileDto qnaFileDto = qnaFileDao.find(qnaNo);//파일이 한 개일 경우
%>

<%-- 출력 --%>

<jsp:include page="/template/header.jsp"></jsp:include>    
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#cancel-btn").click(function() {
			return confirm("정말 삭제하시겠습니까?");
		});
	});
</script>

<div class="container-800 container-center" style="border:2px solid rgb(148, 161, 172); width : 100%; padding:20px; ">

    <div class="row" style="font-size:25px; font-weight: bold;">
        <%=qnaDto.getQnaTitle()%>
        </div>
                <div class="row right" style="font-size: 13px;">
        No.<%=qnaDto.getQnaNo()%>
        |
        등록일 : <%=qnaDto.getQnaDate()%>
        |
        작성자 : <%=qnaDto.getQnaWriter()%>
    </div>
    
    <hr>
            <tbody>
            <!-- 답답해 보이지 않도록 기본높이를 부여 -->
            <!-- 
                pre 태그를 사용하여 내용을 있는 그대로 표시되도록 설정
                (주의) 태그 사이에 쓸데없는 엔터, 띄어쓰기 등이 들어가지 않도록 해야 한다.(모두 표시된다)
             -->
                <div class="row" style="min-height:250px; font-size: 15px;">
        <pre><%=qnaDto.getQnaContent()%></pre>
    </div>
                <%-- 첨부 파일이 있다면 첨부파일을 다운받을 수 있는 링크를 제공 --%>
                <%if(!qnaFileList.isEmpty()){ %>
                <tr>
                    <%for(QnaFileDto boardFileDto : qnaFileList){ %>
                        <td>첨부파일</td>
                        <td>
                            <%=boardFileDto.getQnaFileUploadName()%> 
                            (<%=boardFileDto.getQnaFileSize()%> bytes)
                            <a href="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>" class="link-btn">다운로드</a>
                            <img src="<%=request.getContextPath()%>/qna/file/download.txt?qnaFileNo=<%=boardFileDto.getQnaFileNo()%>" width="50" height="50">
                        <td>
                    <%} %>
                </tr>
                <%} %>    
                    <hr>
                    
                <%if(!qnaDto.getQnaAnswer().isEmpty()){ %>

    <div class="row1" style=" font-size:25px; font-weight: bold;">답변</div>
    
                        <hr>
                    <div class="row" style="min-height:250px; font-size: 15px;">
                    <td colspan="4"><pre><%=qnaDto.getQnaAnswer()%></pre></td>
                </div>
                
                <%} %>
            </tbody>
            <tr><td colspan="4"><td></tr>
            <tfoot>
                <tr align="right">
                    <td colspan="4">
                    <div class= "row right">
                            <hr>
                            <a class="link-btn" href="<%=request.getContextPath()%>/admin/qna/list.jsp">목록</a>
                            <%if(qnaDto.getQnaAnswer().length()==0){%>
                            <a class="link-btn" href="<%=request.getContextPath()%>/admin/qna/answer.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">답변달기</a>
                            <%} else { %>
                            <a class="link-btn" href="<%=request.getContextPath()%>/admin/qna/answer.jsp?qnaNo=<%=qnaDto.getQnaNo()%>">수정하기</a>
                            <%} %>
                            <a class="link-btn" id="cancel-btn" href="<%=request.getContextPath()%>/admin/qna/delete.txt?qnaNo=<%=qnaDto.getQnaNo()%>">삭제</a>
                    </div>
                    </td>
            </tfoot>
        </table>
    </div>
    
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>