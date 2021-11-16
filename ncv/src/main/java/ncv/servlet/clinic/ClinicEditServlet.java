package ncv.servlet.clinic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ClinicDao;
import ncv.beans.ClinicDto;

@WebServlet(urlPatterns = "/clinic/edit.txt")
public class ClinicEditServlet extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            ClinicDto clinicDto = new ClinicDto();

            clinicDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
            clinicDto.setClinicName(req.getParameter("clinicName"));
            clinicDto.setClinicTel(req.getParameter("clinicTel"));
            clinicDto.setClinicTime(req.getParameter("clinicTime"));
            clinicDto.setClinicPostcode(req.getParameter("clinicPostcode"));
            clinicDto.setClinicAddress(req.getParameter("clinicAddress"));
            clinicDto.setClinicDetailAddress(req.getParameter("clinicDetailAddress"));

            ClinicDao clinicDao = new ClinicDao();
            boolean success = clinicDao.edit(clinicDto);

            if(success) {
                resp.sendRedirect("select.jsp?clinicNo="+clinicDto.getClinicNo());
            }
            else {
                resp.sendRedirect("edit.jsp?error");
            }
        }
        catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500);
        }
    }
}