package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservationDao {

	//번호 생성 기능
		public int getSequence() throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select reservation_seq.nextval from dual";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs= ps.executeQuery();

			rs.next();
			int seq = rs.getInt(1);

			con.close();

			return seq;
		}
		
		// 예약하기 기능
		public void reserve(ReservationDto reservationDto) throws Exception{
			Connection con = JdbcUtils.connect();

			String sql = "insert into reservation values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, reservationDto.getResNo());
			ps.setString(2, reservationDto.getMemberId());
			ps.setInt(3, reservationDto.getClinicNo());
			ps.setInt(4, reservationDto.getVaccineNo());
			ps.setInt(5, reservationDto.getShotNo());
			ps.setString(6, reservationDto.getResDate());
			ps.setString(7, reservationDto.getResTime());
			ps.setString(8, reservationDto.getResName());
			ps.setString(9, reservationDto.getResRrn());
			ps.setString(10, reservationDto.getResPhone());
			ps.execute();

			con.close();
		}	
	
		// 예약 취소 기능
		public boolean cancel(int resNo) throws Exception{
			Connection con = JdbcUtils.connect();

			String sql = "delete reservation where vaccine_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, resNo);
			int result = ps.executeUpdate();

			con.close();

			return result > 0;
		}			
		
		//예약 조회 기능
		public List<ReservationDto> list() throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from reservation";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<ReservationDto> reservationList = new ArrayList<>();
			while(rs.next()) {
				ReservationDto reservationDto = new ReservationDto();

				reservationDto.setResNo(rs.getInt("res_no"));
				reservationDto.setMemberId(rs.getString("member_id"));;
				reservationDto.setClinicNo(rs.getInt("clinic_no"));
				reservationDto.setVaccineNo(rs.getInt("vaccine_no"));
				reservationDto.setShotNo(rs.getInt("shot_no"));
				reservationDto.setResDate(rs.getString("res_date"));
				reservationDto.setResTime(rs.getString("res_time"));
				reservationDto.setResName(rs.getString("res_name"));
				reservationDto.setResRrn(rs.getString("res_rnn"));
				reservationDto.setResPhone(rs.getString("res_phone"));
				
				reservationList.add(reservationDto);
			}

			con.close();

			return reservationList;
		}
		
		//예약 상세보기 기능
		public ReservationDto get(int resNo) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from reservation where res_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, resNo);
			ResultSet rs = ps.executeQuery();

			ReservationDto reservationDto;
			if(rs.next()) {
				reservationDto = new ReservationDto();

				reservationDto.setResNo(rs.getInt("res_no"));
				reservationDto.setMemberId(rs.getString("member_id"));;
				reservationDto.setClinicNo(rs.getInt("clinic_no"));
				reservationDto.setVaccineNo(rs.getInt("vaccine_no"));
				reservationDto.setShotNo(rs.getInt("shot_no"));
				reservationDto.setResDate(rs.getString("res_date"));
				reservationDto.setResTime(rs.getString("res_time"));
				reservationDto.setResName(rs.getString("res_name"));
				reservationDto.setResRrn(rs.getString("res_rnn"));
				reservationDto.setResPhone(rs.getString("res_phone"));

			}
			else {
				reservationDto = null;
			}

			con.close();

			return reservationDto;
		}
		
}
