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

		String sql = "insert into shot values(?, ?, systimestamp, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, shot2Dto.getShotNo());
		ps.setInt(2, shot2Dto.getResOkNo());
		ps.setInt(3, shot2Dto.getShotCount());
		ps.execute();

		con.close();
	}	
	
	//관리자의 접종 내역 리스트 조회 기능 - 조인 o
	public List<Shot2Vo> list() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select a.shot_no, a.resOk_no, b.member_id, c.clinic_name, b.res_name, b.res_rrn, b.res_phone, d.vaccine_name, a. shot_date, a.shot_count from shot a inner join reservation  b on a.resOk_no = b.res_no inner join clinic c on b.clinic_no = c.clinic_no inner join vaccine d on b.vaccine_no = d. vaccine_no";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<Shot2Vo> list = new ArrayList<>();
		while (rs.next()) {
			Shot2Vo shotVo = new Shot2Vo();

			shotVo.setShotNo(rs.getInt("shot_no"));
			shotVo.setResOkNo(rs.getInt("resOk_no"));
			shotVo.setMemberId(rs.getString("member_id"));
			shotVo.setMemberName(rs.getString("res_name"));
			shotVo.setResRrn(rs.getString("res_rrn"));
			shotVo.setResPhone(rs.getString("res_phone"));
			shotVo.setVaccineName(rs.getString("vaccine_name"));
			shotVo.setClinicName(rs.getString("clinic_name"));
			shotVo.setShotDate(rs.getString("shot_date"));
			shotVo.setShotCount(rs.getInt("shot_count"));
			
			list.add(shotVo);
		}

		con.close();

		return list;
	}	
	
	//나의 접종 완료 리스트 조회 기능 ( 조인o )
		public List<Shot2Vo> myShotList(String memberId) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select a.shot_no, a.resOk_no, b.member_id, c.clinic_name, b.res_name, b.res_rrn, b.res_phone, d.vaccine_name, a. shot_date, a.shot_count from shot a inner join reservation  b on a.resOk_no = b.res_no inner join clinic c on b.clinic_no = c.clinic_no inner join vaccine d on b.vaccine_no = d. vaccine_no where member_id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberId);
			ResultSet rs = ps.executeQuery();

			List<Shot2Vo> myShotList = new ArrayList<>();
			while (rs.next()) {
				Shot2Vo shotVo = new Shot2Vo();

				shotVo.setShotNo(rs.getInt("shot_no"));
				shotVo.setResOkNo(rs.getInt("resOk_no"));
				shotVo.setMemberId(rs.getString("member_id"));
				shotVo.setMemberName(rs.getString("res_name"));
				shotVo.setResRrn(rs.getString("res_rrn"));
				shotVo.setResPhone(rs.getString("res_phone"));
				shotVo.setVaccineName(rs.getString("vaccine_name"));
				shotVo.setClinicName(rs.getString("clinic_name"));
				shotVo.setShotDate(rs.getString("shot_date"));
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

	    String sql = "select d.vaccine_no, d.vaccine_name from shot a inner join reservation  b on a.resOk_no = b.res_no inner join clinic c on b.clinic_no = c.clinic_no inner join vaccine d on b.vaccine_no = d. vaccine_no where member_id = ?";
	    PreparedStatement ps = con.prepareStatement(sql);
	    ps.setString(1, memberId);
	    ResultSet rs = ps.executeQuery();

	    List<Shot2Vo> myVaccineList = new ArrayList<>();
	    while (rs.next()) {
	        Shot2Vo shotVo = new Shot2Vo();

	        shotVo.setVaccineNo(rs.getInt("vaccine_no"));
	        shotVo.setVaccineName(rs.getString("vaccine_name"));

	        myVaccineList.add(shotVo);
	    }

	    con.close();

	    return myVaccineList;
	}
}
