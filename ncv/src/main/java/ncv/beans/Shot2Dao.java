package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Shot2Dao {
	
	//접종번호 생성 기능
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select shot_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}
	
	// 접종 완료 기능
	public void shotComplete(Shot2Dto shot2Dto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into shot values(?, ?, systimestamp, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, shot2Dto.getShotNo());
		ps.setInt(2, shot2Dto.getResOkNo());
		ps.setInt(3, shot2Dto.getShotCount());
		ps.setInt(4, shot2Dto.getVaccineNo());
		ps.setString(5, shot2Dto.getShotRrn());
		ps.setString(6, shot2Dto.getShotMemberName());
		ps.setString(7, shot2Dto.getMemberId());
		
		ps.execute();

		con.close();
	}	
	
	//관리자의 접종 내역 리스트 조회 기능 - 조인 o
	public List<Shot3Vo> list() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select S.shot_no, S.shot_date, S.shot_count, S.shot_vaccine_no, S.shot_rrn, S.shot_member_name, S.shot_member_id, V.vaccine_name from shot S left outer join vaccine V on S.shot_vaccine_no = V.vaccine_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<Shot3Vo> list = new ArrayList<>();
		while (rs.next()) {
			Shot3Vo shotVo = new Shot3Vo();

			shotVo.setShotNo(rs.getInt("shot_no"));
			shotVo.setShotDate(rs.getDate("shot_date"));
			shotVo.setShotCount(rs.getInt("shot_count"));
			shotVo.setVaccineNo(rs.getInt("shot_vaccine_no"));
			shotVo.setShotRrn(rs.getString("shot_rrn"));
			shotVo.setVaccineName(rs.getString("vaccine_name"));
			shotVo.setShotMemberName(rs.getString("shot_member_name"));
			shotVo.setMemberId(rs.getString("shot_member_id"));
			
		
			list.add(shotVo);
		}

		con.close();

		return list;
	}	
	
	//나의 접종 완료 리스트 조회 기능 ( 조인o )
		public List<Shot3Vo> myShotList(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select S.shot_no, S.shot_member_id, S.shot_date, S.shot_count, S.shot_vaccine_no, S.shot_rrn, S.shot_member_name, V.vaccine_name from shot S left outer join vaccine V on S.shot_vaccine_no = V.vaccine_no where S.shot_member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();

			List<Shot3Vo> myShotList = new ArrayList<>();
			while (rs.next()) {
				Shot3Vo shotVo = new Shot3Vo();

				shotVo.setShotNo(rs.getInt("shot_no"));
				shotVo.setMemberId(rs.getString("shot_member_id"));
				shotVo.setShotMemberName(rs.getString("shot_member_name"));
				shotVo.setVaccineNo(rs.getInt("shot_vaccine_no"));
				shotVo.setVaccineName(rs.getString("vaccine_name"));
				shotVo.setShotRrn(rs.getString("shot_rrn"));
				shotVo.setShotDate(rs.getDate("shot_date"));
				shotVo.setShotCount(rs.getInt("shot_count"));
				
				myShotList.add(shotVo);
			}

			con.close();

			return myShotList;
	}

	//접종 완료 상세 보기 기능 - 회원 ( 조인o )
	public Shot2Vo get(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select a.shot_no, a.resOk_no, b.member_id, c.clinic_name, b.res_name, b.res_rrn, b.res_phone, d.vaccine_name, a. shot_date, a.shot_count from shot a inner join reservation  b on a.resOk_no = b.res_no inner join clinic c on b.clinic_no = c.clinic_no inner join vaccine d on b.vaccine_no = d. vaccine_no where member_id= ? ";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();

		Shot2Vo shotVo;
		if(rs.next()) {
			shotVo = new Shot2Vo();
		
			shotVo.setShotNo(rs.getInt("shot_no"));
			shotVo.setResOkNo(rs.getInt("resOk_no"));
			shotVo.setMemberId(rs.getString("member_id"));
			shotVo.setClinicName(rs.getString("clinic_name"));
			shotVo.setResRrn(rs.getString("res_rrn"));
			shotVo.setResPhone(rs.getString("res_phone"));
			shotVo.setShotDate(rs.getString("shot_date"));
			shotVo.setShotCount(rs.getInt("shot_count"));
			
		}
		else {
			shotVo = null;
		}

		con.close();

		return shotVo;
	}	
	
	public List<Shot2Vo> myVaccineList(String memberId) throws Exception {
	    Connection con = JdbcUtils.connect();

	    String sql = "select s.shot_vaccine_no, v.vaccine_name, s.shot_count from shot s inner join vaccine v on v.vaccine_no = s.shot_vaccine_no where s.shot_member_id = ? ";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setString(1, memberId);
	    ResultSet rs = ps.executeQuery();

	    List<Shot2Vo> myVaccineList = new ArrayList<>();
	    while (rs.next()) {
	        Shot2Vo shotVo = new Shot2Vo();

	        shotVo.setVaccineNo(rs.getInt("shot_vaccine_no"));
	        shotVo.setVaccineName(rs.getString("vaccine_name"));
	        shotVo.setShotCount(rs.getInt("shot_count"));

	        myVaccineList.add(shotVo);
	    }

	    con.close();

	    return myVaccineList;
	}

	//예약번호로 접종내역 조회하기
	public boolean listByResNo(int resNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) "
				+ "from shot a "
				+ "inner join reservation  b on a.resOk_no = b.res_no "
				+ "where resOk_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, resNo);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int result = rs.getInt(1);
		
		con.close();
		
		return result > 0;
	}
	
	public int getResNum(String memberId) throws Exception {
	Connection con = JdbcUtils.connect();

	String sql = "select count(*) from shot where shot_member_id = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	ps.setString(1, memberId);
	ResultSet rs= ps.executeQuery();

	rs.next();
	int count = rs.getInt(1);

	con.close();

	return count;
	}

	//예약 백신 확인 기능
	public Shot2Dto vaccineCheck(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		String sql = "select shot_vaccine_no from shot where shot_member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();

		Shot2Dto shotDto;
		if(rs.next()) {
			shotDto = new Shot2Dto();
			shotDto.setVaccineNo(rs.getInt("shot_vaccine_no"));
		}
		else {
			
			shotDto = null;
			
		}

		con.close();
		return shotDto;
		
	}			
	
}
