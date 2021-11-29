package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ShotDao {
	
	//회원 개인의 접종 내역 조회
	public List<ShotDto> select(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from shot where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		List<ShotDto> list = new ArrayList<>();
		while (rs.next()) {
			ShotDto shotDto = new ShotDto();
			shotDto.setShotNo(rs.getInt("shot_no"));
			shotDto.setMemberId(rs.getString("member_id"));
			shotDto.setResNo(rs.getInt("res_no"));
			shotDto.setClinicNo(rs.getInt("clinic_no"));
			shotDto.setShotMemberRrn(rs.getString("shot_member_rrn"));
			
			list.add(shotDto);
		}

		con.close();

		return list;
	}
	
	//관리자의 접종 내역 조회
		public List<ShotDto> list() throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select * from shot";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			List<ShotDto> list = new ArrayList<>();
			while (rs.next()) {
				ShotDto shotDto = new ShotDto();
				shotDto.setShotNo(rs.getInt("shot_no"));
				shotDto.setMemberId(rs.getString("member_id"));
				shotDto.setResNo(rs.getInt("res_no"));
				shotDto.setClinicNo(rs.getInt("clinic_no"));
				shotDto.setShotMemberRrn(rs.getString("shot_member_rrn"));
				
				list.add(shotDto);
			}

			con.close();

			return list;
		}
	
	//회원과 관리자의 접종 내역 상세 조회
	public ShotVo get(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select S.shot_no, S.res_no, C.clinic_no, S.shot_one, S.shot_two, S.shot_member_rrn, "
				+ "R.shot_count, R.res_date, R.res_time, R.res_name, R.res_rrn, R.res_phone, "
				+ "C.clinic_name, C.clinic_tel, C.clinic_time, C.clinic_postcode, C.clinic_address, C.clinic_detailaddress, "
				+ "C.clinic_sido, C.clinic_sigungu, C.clinic_bname, "
				+ "V.vaccine_no, V.vaccine_platform, V.vaccine_name, V.vaccine_value, V.vaccine_company, "
				+ "V.vaccine_age, V.vaccine_composition, V.vaccine_interval, "
				+ "V.vaccine_method, V.vaccine_keep, V.vaccine_expire, V.vaccine_life "
				+ "from shot S left outer join reservation R on S.res_no = R.res_no "
				+ "left outer join clinic C on R.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on R.vaccine_no = V.vaccine_no "
				+ "where S.member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		ShotVo shotVo;
		if(rs.next()){
			shotVo = new ShotVo();
			shotVo.setShotNo(rs.getInt(1));
			shotVo.setResNo(rs.getInt(2));
			shotVo.setClinicNo(rs.getInt(3));
			shotVo.setShotOne(rs.getString(4));
			shotVo.setShotTwo(rs.getString(5));
			shotVo.setShotMemberRrn(rs.getString(6));
			shotVo.setShotCount(rs.getInt(7));
			shotVo.setResDate(rs.getDate(8));
			shotVo.setResTime(rs.getString(9));
			shotVo.setResName(rs.getString(10));
			shotVo.setResRrn(rs.getString(11));
			shotVo.setResPhone(rs.getString(12));
			shotVo.setClinicName(rs.getString(13));
			shotVo.setClinicTel(rs.getString(14));
			shotVo.setClinicTime(rs.getString(15));
			shotVo.setClinicPostcode(rs.getString(16));
			shotVo.setClinicAddress(rs.getString(17));
			shotVo.setClinicDetailAddress(rs.getString(18));
			shotVo.setClinicSido(rs.getString(19));
			shotVo.setClinicSigungu(rs.getString(20));
			shotVo.setClinicBname(rs.getString(21));
			shotVo.setVaccineNo(rs.getInt(22));
			shotVo.setVaccinePlatform(rs.getString(23));
			shotVo.setVaccineName(rs.getString(24));
			shotVo.setVaccineValue(rs.getString(25));
			shotVo.setVaccineCompany(rs.getString(26));
			shotVo.setVaccineAge(rs.getString(27));
			shotVo.setVaccineComposition(rs.getString(28));
			shotVo.setVaccineInterval(rs.getString(29));
			shotVo.setVaccineMethod(rs.getString(30));
			shotVo.setVaccineKeep(rs.getString(31));
			shotVo.setVaccineExpire(rs.getString(32));
			shotVo.setVaccinLife(rs.getString(33));
		}
		else {
			shotVo = null;
		}
		
		con.close();
		
		return shotVo;
	}
	
	// 페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select count(*) from shot";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}
	
	// 페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(검색)
	public int count(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select count(*) from shot where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}
	
	public List<ShotDto> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from shot order by shot_no asc" + ")TMP" + ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<ShotDto> list = new ArrayList<>();
		while (rs.next()) {
			ShotDto shotDto = new ShotDto();
			shotDto.setShotNo(rs.getInt("shot_no"));
			shotDto.setMemberId(rs.getString("member_id"));
			shotDto.setResNo(rs.getInt("res_no"));
			shotDto.setClinicNo(rs.getInt("clinic_no"));
			shotDto.setShotMemberRrn(rs.getString("shot_member_rrn"));
			
			list.add(shotDto);
		}

		con.close();

		return list;
	}

	public List<ShotDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from shot where instr(#1, ?) > 0 order by #1 asc" + ")TMP" + ") where rn between ? and ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();

		List<ShotDto> list = new ArrayList<>();
		while (rs.next()) {
			ShotDto shotDto = new ShotDto();
			shotDto.setShotNo(rs.getInt("shot_no"));
			shotDto.setMemberId(rs.getString("member_id"));
			shotDto.setResNo(rs.getInt("res_no"));
			shotDto.setClinicNo(rs.getInt("clinic_no"));
			shotDto.setShotMemberRrn(rs.getString("shot_member_rrn"));
			
			list.add(shotDto);
		}

		con.close();

		return list;
	}
}
