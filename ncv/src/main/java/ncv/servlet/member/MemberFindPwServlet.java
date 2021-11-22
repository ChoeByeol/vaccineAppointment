package ncv.servlet.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;

@WebServlet("/member/find_pw.txt")
public class MemberFindPwServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
         //입력 : 아이디
    	 String memberId = req.getParameter("memberId");
         
         //처리
         MemberDao memberDao = new MemberDao();
         String memberPw = memberDao.findPw(memberId);
         
         //출력
         if(memberPw != null) {
            resp.getWriter().println("임시 비밀번호는 "+memberPw);
         }
         else {
        	 resp.sendRedirect("find_pw.jsp?error");
         }
      }
      catch(Exception e) {
         e.printStackTrace();
         resp.sendError(500);
      }
   }
}