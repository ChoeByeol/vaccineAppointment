<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form action="<%=request.getContextPath()%>/member/find_id.txt" method="post">
      <table border="0">
         <tbody>
            <tr>
               <th>이름</th>
               <td>
                  <input type="text" name="memberName" required>
               </td>
            </tr>
            <tr>
               <th>주민등록번호</th>
               <td>
                  <input type="text" name="memberRrn" required>
               </td>
            </tr>
         </tbody>
         <tfoot>
            <tr>
               <td align="center" colspan="2">
                  <input type="submit" value="찾기">
               </td>
            </tr>
         </tfoot>
      </table>
   </form>
   
   
   <!-- error에 대한 처리 -->
   <%if(request.getParameter("error") != null){ %>
   <h4 class="error">존재하지 않는 회원입니다.</h4>
   <%} %>