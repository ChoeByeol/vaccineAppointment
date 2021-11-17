package ncv.servlet.admin;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;

@WebServlet(urlPatterns = "/admin/member/edit.txt")
public class AdminMemberEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력 : MemberDto()
			
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(req.getParameter("memberId"));
			memberDto.setMemberName(req.getParameter("memberName"));
			memberDto.setMemberRrn(req.getParameter("memberRrn"));
			memberDto.setMemberGender(req.getParameter("memberGender"));
			memberDto.setMemberPhone(req.getParameter("memberPhone"));
			memberDto.setMemberPostcode(req.getParameter("memberPostcode"));
			memberDto.setMemberAddress(req.getParameter("memberAddress"));
			memberDto.setMemberDetailAddress(req.getParameter("memberDetailAddress"));
			memberDto.setMemberRole(req.getParameter("memberRole"));
			
			//처리
			MemberDao memberDao = new MemberDao();
			boolean success = memberDao.editByAdmin(memberDto);
			
			//출력
			resp.sendRedirect("list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}