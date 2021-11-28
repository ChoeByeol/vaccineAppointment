package ncv.servlet.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.AgreeDao;
import ncv.beans.AgreeDto;

@WebServlet(urlPatterns = "/admin/member/agreeEdit.txt")
public class AdminAgreeEditServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			AgreeDto agreeDto = new AgreeDto();
			agreeDto.setAgree1(req.getParameter("agree1"));
			agreeDto.setAgree2(req.getParameter("agree2"));
			agreeDto.setAgree3(req.getParameter("agree3"));
			agreeDto.setAgree4(req.getParameter("agree4"));
			
			AgreeDao agreeDao = new AgreeDao();
			agreeDao.edit(agreeDto);
			
			resp.sendRedirect(req.getContextPath()+"/member/agree.jsp");		
		}
		
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}

}
