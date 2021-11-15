package ncv.servlet.clinic;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ClinicDao;

@WebServlet(urlPatterns = "/clinic/clinicDelete.txt")

public class ClinicDeleteServlet extends HttpServlet{ @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    try {

        int clinicNo = Integer.parseInt(req.getParameter("clinicNo"));


        ClinicDao clinicDao = new ClinicDao();
        boolean success = clinicDao.delete(clinicNo);


        if(success) {
            resp.sendRedirect("delete_success.html");
        }
        else {
            resp.sendRedirect("delete_fail.html");

        }
    }
    catch(Exception e) {
        e.printStackTrace();
        resp.getWriter().println("error occured");
    }
}
	

}
