package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncv.beans.MemberDto;
import ncv.beans.JdbcUtils;

public class MemberDao {

	// [1] 회원가입 메소드
	public void join(MemberDto memberDto) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "insert into member(member_id, member_pw, member_name, "
				+ "member_rrn, member_gender, member_phone, member_address, member_join) "
				+ "values(?, ?, ?, ?, ?, ?, ?, sysdate)";

		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());
		ps.setString(3, memberDto.getMemberName());
		ps.setString(4, memberDto.getMemberRrn());
		ps.setString(5, memberDto.getMemberGender());
		ps.setString(6, memberDto.getMemberPhone());
		ps.setString(7, memberDto.getMemberAddress());

		ps.execute();

		con.close();
	}

	// 관리자가 회원을 탈퇴시키는 기능
	public boolean quit(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "delete member where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 회원 탈퇴 기능
	public boolean quit(String memberId, String memberPw) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "delete member where member_id = ? and member_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ps.setString(2, memberPw);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}

	// 페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select count(*) from member";
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

		String sql = "select count(*) from member where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}

	public List<MemberDto> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from member order by member_id asc" + ")TMP" + ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> list = new ArrayList<>();
		while (rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));

			list.add(memberDto);
		}

		con.close();

		return list;
	}

	public List<MemberDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from member where instr(#1, ?) > 0 order by #1 asc" + ")TMP" + ") where rn between ? and ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> list = new ArrayList<>();
		while (rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));

			list.add(memberDto);
		}

		con.close();

		return list;
	}

	// 조회
	public List<MemberDto> select() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		// rs의 내용을 List에 복사
		List<MemberDto> list = new ArrayList<>();
		while (rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));

			list.add(memberDto);
		}

		con.close();

		return list;
	}

//	검색분류와 검색어를 입력받아 회원 검색
	public List<MemberDto> select(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from member where instr(#1, ?) > 0 order by #1 asc";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		List<MemberDto> list = new ArrayList<>();
		while (rs.next()) {
			MemberDto memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));

			list.add(memberDto);
		}

		con.close();

		return list;
	}

//	단일 조회
	public MemberDto get(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from member where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();

		MemberDto memberDto;
		if (rs.next()) {
			memberDto = new MemberDto();
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));
		} else {
			memberDto = null;
		}

		con.close();

		return memberDto;
	}
}