package ncv.servlet.member;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;

@WebServlet("/member/find_id.txt")
public class MemberFindIdServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         //입력 : 이름, 주민등록번호
    	 String memberName = req.getParameter("memberName");
    	 String memberRrn = req.getParameter("memberRrn");
         
         //처리
         MemberDao memberDao = new MemberDao();
         String memberId = memberDao.findId(memberName, memberRrn);
         
         //출력
         if(memberId != null) {
            resp.sendRedirect("find_id_found.jsp");
         }
         else {
            resp.sendRedirect("find_id.jsp?error");
         }
      }
      catch(Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}