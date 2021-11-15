package ncv.sevlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.MemberDao;

@WebServlet(urlPatterns = "/admin/member/quit.txt")
public class AdminMemberQuitServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String memberId = req.getParameter("memberId");
			
			MemberDao memberDao = new MemberDao();
			memberDao.quit(memberId);
			
			resp.sendRedirect("list.jsp");
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
