package ncv.servlet.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.SHA256;
import ncv.beans.TemporaryPassword;

@WebServlet("/member/find_pw.txt")
public class MemberFindPwServlet extends HttpServlet{
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      try {
<<<<<<< HEAD
         //입력 : 아이디
=======
         //입력 : 아이디, 이름, 주민등록번호
    	 
    	 String tmpPw = TemporaryPassword.create(); //임시비밀번호 생성
    	 System.out.println("임시비밀번호 = " + tmpPw);
    	 String encryptPw = SHA256.encrypt(tmpPw); //임시비밀번호 암호화
    	 System.out.println("암호화된 임시비밀번호 = " + encryptPw);
>>>>>>> refs/remotes/origin/main
    	 String memberId = req.getParameter("memberId");
         
         //처리
         MemberDao memberDao = new MemberDao();
<<<<<<< HEAD
         String memberPw = memberDao.findPw(memberId);
=======
         boolean success = memberDao.editPassword(encryptPw, memberId, memberName, memberRrn);
         System.out.println("성공(true)? 실패(false)? : " + success);
         //String memberPw = memberDao.findPw(memberId, memberName, memberRrn);
>>>>>>> refs/remotes/origin/main
         
         //출력
<<<<<<< HEAD
         if(memberPw != null) {
            resp.getWriter().println("임시 비밀번호는 "+memberPw);
=======
         if(success) {
        	 resp.sendRedirect("find_pw.jsp?tmpPw=" + tmpPw);
>>>>>>> refs/remotes/origin/main
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