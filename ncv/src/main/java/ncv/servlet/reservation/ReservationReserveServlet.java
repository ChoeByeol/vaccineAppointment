package ncv.servlet.reservation;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ncv.beans.ReservationDao;
import ncv.beans.ReservationDto;
import ncv.beans.Stock4Vo;
import ncv.beans.StockDao;

@WebServlet(urlPatterns = "/reservation/reserve.txt")
public class ReservationReserveServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            req.setCharacterEncoding("UTF-8");
            ReservationDto reservationDto = new ReservationDto();
            
            reservationDto.setMemberId((String)req.getSession().getAttribute("ses"));
            reservationDto.setClinicNo(Integer.parseInt(req.getParameter("clinicNo")));
            reservationDto.setVaccineNo(Integer.parseInt(req.getParameter("vaccineNo")));
            reservationDto.setResShot(Integer.parseInt(req.getParameter("resShot")));
            reservationDto.setResDate(req.getParameter("resDate"));
            reservationDto.setResTime(req.getParameter("resTime"));
            reservationDto.setResName(req.getParameter("resName"));
            reservationDto.setResRrn(req.getParameter("resRrn"));
            reservationDto.setResPhone(req.getParameter("resPhone"));
            
            //입고 개수랑 예약 정보 개수랑 비교
            //병원의 특정 백신 입고 총 개수
            StockDao stockDao = new StockDao();
            int count = stockDao.getStockInTotalQty(reservationDto.getClinicNo(), reservationDto.getVaccineNo());//입고 총 개수
            
            //stockInTotal = stock4Vo.getStockInTotalQty();
            System.out.println(count);
            //Integer stockInTotal = stock4Vo.getStockInTotalQty();
            
            //예약한 개수(접종 완료 X)
            ReservationDao reservationDao = new ReservationDao();
            int countRes = 0;
            countRes = reservationDao.countRes(reservationDto.getVaccineNo(), reservationDto.getClinicNo());
            
            if(count == countRes || count == 0) {
                resp.sendRedirect("reservation_fail.jsp");
            }
            else if(count > countRes){
                int resNo = reservationDao.getSequence();
                reservationDto.setResNo(resNo);
                reservationDao.reserve(reservationDto); //예약
                
                resp.sendRedirect("reservation_detail.jsp?resNo="+resNo);
            }
            else {
                resp.sendRedirect("reservation_fail.jsp");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendError(500);
        }
    }
}