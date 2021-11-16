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
			shotDto.setShotStCom(rs.getString("shot_st_com"));
			shotDto.setShotEndCom(rs.getString("shot_end_com"));
			shotDto.setShotMemberNo(rs.getString("shot_member_no"));
			
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
				shotDto.setShotStCom(rs.getString("shot_st_com"));
				shotDto.setShotEndCom(rs.getString("shot_end_com"));
				shotDto.setShotMemberNo(rs.getString("shot_member_no"));
				
				list.add(shotDto);
			}

			con.close();

			return list;
		}
	
	//회원과 관리자의 접종 내역 상세 조회
	public ShotVo get(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select S.shot_no, S.res_no, S.shot_st_com, "
				+ "S.shot_end_com, S.shot_member_no, R.res_shot_no, "
				+ "R.res_date, R.res_time, R.res_name, R.res_rrn, R.res_phone from shot S "
				+ "left outer join reservation R on S.res_no = R.res_no where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		ShotVo shotVo;
		if(rs.next()){
			shotVo = new ShotVo();
			shotVo.setShotNo(rs.getInt(1));
			shotVo.setResNo(rs.getInt(2));
			shotVo.setShotStCom(rs.getString(3));
			shotVo.setShotEndCom(rs.getString(4));
			shotVo.setShotMemberNo(rs.getString(5));
			shotVo.setResShotNo(rs.getInt(6));
			shotVo.setResDate(rs.getDate(7));
			shotVo.setResTime(rs.getString(8));
			shotVo.setResName(rs.getString(9));
			shotVo.setResRrn(rs.getString(10));
			shotVo.setResPhone(rs.getString(11));
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
			shotDto.setShotStCom(rs.getString("shot_st_com"));
			shotDto.setShotEndCom(rs.getString("shot_end_com"));
			shotDto.setShotMemberNo(rs.getString("shot_member_no"));
			
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
			shotDto.setShotStCom(rs.getString("shot_st_com"));
			shotDto.setShotEndCom(rs.getString("shot_end_com"));
			shotDto.setShotMemberNo(rs.getString("shot_member_no"));
			
			list.add(shotDto);
		}

		con.close();

		return list;
	}
}
