<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:include page="/template/header.jsp"></jsp:include>    

<h2>1대1 문의</h2>

<form action="write.txt" method="post" enctype="multipart/form-data">

<table>
	<tbody>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="qnaTitle" required>
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="qnaContent" rows="10" cols="80" required></textarea>
			</td>
		</tr>
		
		<tr>
			<th>첨부</th>
			<td>
				<input type="file" name="attach">
			</td>
		</tr>
		
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="작성">
			</td>
		</tr>
	</tfoot>
</table>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>
