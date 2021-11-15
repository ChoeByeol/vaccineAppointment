package ncv.servlet.member;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns = "/member/edit.txt")
public class MemberEditServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            //입력 : MemberDto
            MemberDto memberDto = new MemberDto();

            memberDto.setMemberAddress(req.getParameter("memberAddress"));
            memberDto.setMemberPhone(req.getParameter("memberPhone"));
            memberDto.setMemberId(req.getParameter("memberId"));
            memberDto.setMemberPw(req.getParameter("memberPw"));

            //처리
            MemberDao memberDao = new MemberDao();
            boolean success = memberDao.edit(memberDto);

            //출력
            if(success) {
                resp.sendRedirect("edit_success.jsp");
            }
            else {
                resp.sendRedirect("edit.jsp?error");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
            resp.sendError(500);
        }
    }
}