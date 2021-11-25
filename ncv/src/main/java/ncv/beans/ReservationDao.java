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
			ps.setInt(5, reservationDto.getResShot());
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

			String sql = "delete reservation where res_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, resNo);
			int result = ps.executeUpdate();

			con.close();

			return result > 0;
		}			
		
		//예약 조회 기능 ( 조인x )
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
				reservationDto.setResShot(rs.getInt("res_shot"));
				reservationDto.setResDate(rs.getString("res_date"));
				reservationDto.setResTime(rs.getString("res_time"));
				reservationDto.setResName(rs.getString("res_name"));
				reservationDto.setResRrn(rs.getString("res_rrn"));
				reservationDto.setResPhone(rs.getString("res_phone"));
				
				reservationList.add(reservationDto);
			}

			con.close();

			return reservationList;
		}
		
		//예약 조회 기능 ( 조인o )
		public List<ReservationVo> list2() throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select a.res_no, a.member_id, b.vaccine_name, c.clinic_name, a.res_shot, a.res_name, a.res_rrn, a.res_phone, a.res_date, a.res_time from reservation a inner join vaccine b on a.vaccine_no = b.vaccine_no inner join clinic c on a.clinic_no = c.clinic_no  inner join member d on a.member_id = d.member_id";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<ReservationVo> reservationList = new ArrayList<>();
			while(rs.next()) {
				ReservationVo reservationVo = new ReservationVo();

				reservationVo.setResNo(rs.getInt("res_no"));
				reservationVo.setMemberId(rs.getString("member_id"));
				reservationVo.setClinicName(rs.getString("clinic_name"));
				reservationVo.setVaccineName(rs.getString("vaccine_name"));
				reservationVo.setResShot(rs.getInt("res_shot"));
				reservationVo.setResDate(rs.getString("res_date"));
				reservationVo.setResTime(rs.getString("res_time"));
				reservationVo.setResName(rs.getString("res_name"));
				reservationVo.setResRrn(rs.getString("res_rrn"));
				reservationVo.setResPhone(rs.getString("res_phone"));
				
				reservationList.add(reservationVo);
			}

			con.close();

			return reservationList;
		}		
		
		//나의 예약 리스트 조회 기능 ( 조인o )
		public List<ReservationVo> myResList(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select a.res_no, a.member_id, b.vaccine_name, c.clinic_name, a.res_shot, a.res_name, a.res_rrn, a.res_phone, a.res_date, a.res_time from reservation a inner join vaccine b on a.vaccine_no = b.vaccine_no inner join clinic c on a.clinic_no = c.clinic_no  inner join member d on a.member_id = d.member_id where d.member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();

			List<ReservationVo> myResList = new ArrayList<>();
			while(rs.next()) {
				ReservationVo reservationVo = new ReservationVo();

				reservationVo.setResNo(rs.getInt("res_no"));
				reservationVo.setMemberId(rs.getString("member_id"));
				reservationVo.setClinicName(rs.getString("clinic_name"));
				reservationVo.setVaccineName(rs.getString("vaccine_name"));
				reservationVo.setResShot(rs.getInt("res_shot"));
				reservationVo.setResDate(rs.getString("res_date"));
				reservationVo.setResTime(rs.getString("res_time"));
				reservationVo.setResName(rs.getString("res_name"));
				reservationVo.setResRrn(rs.getString("res_rrn"));
				reservationVo.setResPhone(rs.getString("res_phone"));
				
				myResList.add(reservationVo);
			}

			con.close();

			return myResList;
		}				
		
		//예약 상세보기 기능 ( 조인o )
		public ReservationVo get(int resNo) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select a.res_no, a.member_id, b.vaccine_name, c.clinic_name, a.res_shot, a.res_name, a.res_rrn, a.res_phone, a.res_date, a.res_time from reservation a inner join vaccine b on a.vaccine_no = b.vaccine_no inner join clinic c on a.clinic_no = c.clinic_no  inner join member d on a.member_id = d.member_id where res_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, resNo);
			ResultSet rs = ps.executeQuery();

			ReservationVo reservationVo;
			if(rs.next()) {
				reservationVo = new ReservationVo();

				reservationVo.setResNo(rs.getInt("res_no"));
				reservationVo.setMemberId(rs.getString("member_id"));
				reservationVo.setClinicName(rs.getString("clinic_name"));
				reservationVo.setVaccineName(rs.getString("vaccine_name"));
				reservationVo.setResShot(rs.getInt("res_shot"));
				reservationVo.setResDate(rs.getString("res_date"));
				reservationVo.setResTime(rs.getString("res_time"));
				reservationVo.setResName(rs.getString("res_name"));
				reservationVo.setResRrn(rs.getString("res_rrn"));
				reservationVo.setResPhone(rs.getString("res_phone"));

			}
			else {
				reservationVo = null;
			}

			con.close();

			return reservationVo;
		}
		
		
		//예약 변경 상세보기 기능 ( 조인x )
		public ReservationDto editGet(int resNo) throws Exception {
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
				reservationDto.setResShot(rs.getInt("res_shot"));
				reservationDto.setResDate(rs.getString("res_date"));
				reservationDto.setResTime(rs.getString("res_time"));
				reservationDto.setResName(rs.getString("res_name"));
				reservationDto.setResRrn(rs.getString("res_rrn"));
				reservationDto.setResPhone(rs.getString("res_phone"));

			}
			else {
				reservationDto = null;
			}

			con.close();

			return reservationDto;
		}
		
		//예약 조회 기능
		public List<ReservationDto> listbyClinic(int clinicNo) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from reservation where clinic_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, clinicNo);
			ResultSet rs = ps.executeQuery();

			List<ReservationDto> reservationList = new ArrayList<>();
			while(rs.next()) {
				ReservationDto reservationDto = new ReservationDto();

				reservationDto.setResNo(rs.getInt("res_no"));
				reservationDto.setMemberId(rs.getString("member_id"));;
				reservationDto.setClinicNo(rs.getInt("clinic_no"));
				reservationDto.setVaccineNo(rs.getInt("vaccine_no"));
				reservationDto.setResShot(rs.getInt("res_shot"));
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
	
		//예약 변경 기능
		public boolean  edit(ReservationDto reservationDto) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "update reservation set member_id = ?, clinic_no = ?, vaccine_no = ?, res_shot = ?, res_date =  ?, res_time = ?, res_name = ? , res_rrn = ?, res_phone = ? where res_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, reservationDto.getMemberId());
			ps.setInt(2, reservationDto.getClinicNo());
			ps.setInt(3, reservationDto.getVaccineNo());
			ps.setInt(4, reservationDto.getResShot());
			ps.setString(5, reservationDto.getResDate());
			ps.setString(6, reservationDto.getResTime());
			ps.setString(7, reservationDto.getResName());
			ps.setString(8, reservationDto.getResRrn());    
			ps.setString(9, reservationDto.getResPhone());
			ps.setInt(10, reservationDto.getResNo());
			int result = ps.executeUpdate();

			con.close();

			return result > 0;		
		}
		
		//예약 백신 확인 기능
		public ReservationDto vaccineCheck(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();
			String sql = "select vaccine_no from reservation where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();

			ReservationDto reservationDto;
			if(rs.next()) {
				reservationDto = new ReservationDto();
				reservationDto.setVaccineNo(rs.getInt("vaccine_no"));
			}
			else {
				
				reservationDto = null;
				
			}

			con.close();
			return reservationDto;
			
		}		
		
		//?번 병원에 대한 ?번 백신 재고 리스트 = 리스트 합계로 해결 ^^
		public List<ReservationVo> clinicVacCheck(int clinicNo, int vaccineNo) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from stock where clinic_no = ? and vaccine_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, clinicNo);
			ps.setInt(2, vaccineNo);
			ResultSet rs = ps.executeQuery();

			List<ReservationVo> clinicVacCheck = new ArrayList<>();
			while(rs.next()) {
				ReservationVo reservationVo = new ReservationVo();

				reservationVo.setClinicNo(rs.getInt("clinic_no"));
				reservationVo.setVaccineNo(rs.getInt("vaccine_no"));
				reservationVo.setQuantity(rs.getInt("quantity"));
			
				clinicVacCheck.add(reservationVo);
			}

			con.close();

			return clinicVacCheck;
			
			
		}
		//?번 병원에 대한 ?번 백신 예약 건수 = 카운트로 해결 ^^
		public int resVacCheck(int clinicNo, int vaccineNo) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select count(*) from reservation where clinic_no = ? and vaccine_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, clinicNo);
			ps.setInt(2, vaccineNo);
			ResultSet rs = ps.executeQuery();

			rs.next();
	
			int count = rs.getInt("count(*)");

			System.out.println("카운트 = " + count);
			con.close();

			return count;
			
			
		}				
		
		
}
