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
         //입력 : 아이디, 이름, 주민등록번호
    	 String memberId = req.getParameter("memberId");
    	 String memberName = req.getParameter("memberName");
    	 String memberRrn = req.getParameter("memberRrn");
         
         //처리
         MemberDao memberDao = new MemberDao();
         boolean randomPw = memberDao.randomPassword(memberId, memberName, memberRrn);
         String memberPw = memberDao.findPw(memberId, memberName, memberRrn);
         
         //출력
         if(randomPw) {
        	 resp.sendRedirect("find_pw.jsp?memberPw=" + memberPw);
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