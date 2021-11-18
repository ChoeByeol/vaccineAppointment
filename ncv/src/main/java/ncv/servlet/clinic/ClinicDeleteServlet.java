package ncv.servlet.clinic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ClinicDao;

@WebServlet(urlPatterns="/clinic/delete.txt")
public class ClinicDeleteServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));

			ClinicDao clinicDao = new ClinicDao();
			boolean success = clinicDao.delete(clinicNo);

			if(success) {
				resp.sendRedirect("list.jsp");
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