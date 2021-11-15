package ncv.servlet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;
import ncv.beans.MemberDto;


@WebServlet(urlPatterns = "/member/join.kh")
public class memberJoinServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			req.setCharacterEncoding("UTF-8");
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(req.getParameter("member_id"));
			memberDto.setMemberPw(req.getParameter("member_Pw"));
			memberDto.setMemberPw2(req.getParameter("member_Pw2"));
			memberDto.setMemberName(req.getParameter("member_Nick"));
			memberDto.setMemberRrn(req.getParameter("memberRrn"));
			memberDto.setMember_email(req.getParameter("member_email"));
			memberDto.setMember_phone(req.getParameter("member_phone"));
			ps.setString(1, memberDto.getMemberId());
			ps.setString(2, memberDto.getMemberPw());
			ps.setString(3, memberDto.getMemberPw2());
			ps.setString(4, memberDto.getMemberName());
			ps.setString(5, memberDto.getMemberRrn());
			ps.setString(6, memberDto.getMemberPhone());
			ps.setString(7, memberDto.getMemberAddress());
			
			조인
			System.out.println(memberDto);
			
			//처리 : MemberDao
			MemberDao memberDao = new MemberDao();
			memberDao.join(memberDto);
			
			//출력 : 리다이렉트
			resp.sendRedirect("join_success.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);//사용자에게 500번 상태값을 전송(500은 internal server error)
		}
	}

}
