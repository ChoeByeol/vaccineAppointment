package ncv.servlet.vaccine;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.VaccineDao;
import ncv.beans.VaccineDto;

@WebServlet(urlPatterns = "/vaccine/vaccineEdit.txt")
public class VaccineEditServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			req.setCharacterEncoding("UTF-8");
			VaccineDto vaccineDto = new VaccineDto();
			vaccineDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
			vaccineDto.setVaccinePlatform(req.getParameter("vaccinePlatform"));
			vaccineDto.setVaccineName(req.getParameter("vaccineName"));
			vaccineDto.setVaccineValue(req.getParameter("vaccineValue"));
			vaccineDto.setVaccineCompany(req.getParameter("vaccineCompany"));
			vaccineDto.setVaccineAge(Integer.parseInt(req.getParameter("vaccineAge")));
			vaccineDto.setVaccineComposition(req.getParameter("vaccineComposition"));
			vaccineDto.setVaccineShot(Integer.parseInt(req.getParameter("vaccineShot")));
			vaccineDto.setVaccineInterval(req.getParameter("vaccineInterval"));
			vaccineDto.setVaccineMethod(req.getParameter("vaccineMethod"));
			vaccineDto.setVaccineKeep(req.getParameter("vaccineKeep"));
			vaccineDto.setVaccineExpire(req.getParameter("vaccineExpire"));
			vaccineDto.setVaccineLife(req.getParameter("vaccineLife"));

			//처리
			VaccineDao vaccineDao = new VaccineDao();
			boolean success = vaccineDao.vaccineEdit(vaccineDto);

			//출력
			if(success) {
				resp.sendRedirect("vaccine_detail.jsp?vaccineNo="+vaccineDto.getVaccineNo());
			}
			else {
				resp.sendRedirect("vaccine_edit.jsp?error");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
