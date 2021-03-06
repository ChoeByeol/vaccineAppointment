package ncv.servlet.clinic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ClinicDao;
import ncv.beans.ClinicDto;

@WebServlet(urlPatterns = "/clinic/clinicInsert.txt")
public class ClinicInsertServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//입력
			ClinicDto clinicDto = new ClinicDto();
			clinicDto.setClinicName(req.getParameter("clinicName"));
			clinicDto.setClinicTel(req.getParameter("clinicTel"));
			clinicDto.setClinicTime(req.getParameter("clinicTime"));
			clinicDto.setClinicPostcode(req.getParameter("clinicPostcode"));
			clinicDto.setClinicAddress(req.getParameter("clinicAddress"));
			clinicDto.setClinicDetailAddress(req.getParameter("clinicDetailAddress"));
			clinicDto.setClinicSido(req.getParameter("clinicSido"));
			clinicDto.setClinicSigungu(req.getParameter("clinicSigungu"));
			clinicDto.setClinicBname(req.getParameter("clinicBname"));
			
			//처리
			ClinicDao clinicDao = new ClinicDao();
			int clinicNo = clinicDao.getSequence();
			clinicDto.setClinicNo(clinicNo);
			clinicDao.insert(clinicDto);
			
			//리다이렉트
			resp.sendRedirect(req.getContextPath()+"/admin/clinic/select.jsp?clinicNo="+clinicNo);

			
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendError(500);
		}
	}
}
