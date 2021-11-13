package ncv.servlet.vaccine;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.VaccineDao;


@WebServlet(urlPatterns = "/vaccine/vaccineDelete.txt")
public class VaccineDeleteServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			int vaccineNo = Integer.parseInt(req.getParameter("vaccineNo"));

			VaccineDao vaccineDao = new VaccineDao();
			boolean success = vaccineDao.delete(vaccineNo);

			if(success) {
				resp.sendRedirect("vaccine.jsp");
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
