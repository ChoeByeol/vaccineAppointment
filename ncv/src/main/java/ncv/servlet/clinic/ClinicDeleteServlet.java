package ncv.servlet.clinic;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ClinicDao;

@WebServlet(urlPatterns="/admin/clinic/delete.txt")
public class ClinicDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));

			ClinicDao clinicDao = new ClinicDao();
			boolean success = clinicDao.delete(clinicNo);

			if(success) {
				resp.setContentType("text/html; charset=UTF-8");
                PrintWriter out = resp.getWriter();
                out.println("<script>alert('삭제가 완료되었습니다.'); location.href = 'list.jsp';</script>");
                out.flush();
			}
			else {
				resp.sendError(404);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}