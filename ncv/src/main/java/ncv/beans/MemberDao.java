package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncv.beans.JdbcUtils;

public class MemberDao {
	
	//[1] 회원가입 메소드
	public void join(MemberDto memberDto) throws Exception {
		
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into member("
				+ "member_id, member_pw, member_name, "
				+ "member_Rrn, member_gender, "
				+ "member_address, member_phone, member_join,"
				+ "member_DetailAddress, member_postcode"
				+ ") "
				+ "values(?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?)";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberDto.getMemberId());
		ps.setString(2, memberDto.getMemberPw());
		ps.setString(3, memberDto.getMemberName());
		ps.setString(4, memberDto.getMemberRrn());
		ps.setString(5, memberDto.getMemberGender());
		ps.setString(6, memberDto.getMemberAddress());
		ps.setString(7, memberDto.getMemberPhone());
		ps.setString(8, memberDto.getMemberDetailAddress());	
		ps.setString(9, memberDto.getMemberPostcode());
		ps.execute();
		
		con.close();
	}
	
//	회원상세 기능	
	public MemberDto get(String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from member where member_id = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, memberId);
		ResultSet rs = ps.executeQuery();
		
		MemberDto memberDto;
		
		if(rs.next()) {
			memberDto = new MemberDto();
			
			//copy
			memberDto.setMemberId(rs.getString("member_id"));
			memberDto.setMemberPw(rs.getString("member_pw"));
			memberDto.setMemberName(rs.getString("member_name"));
			memberDto.setMemberRrn(rs.getString("member_rrn"));
			memberDto.setMemberGender(rs.getString("member_gender"));
			memberDto.setMemberPhone(rs.getString("member_phone"));
			memberDto.setMemberPostcode(rs.getString("member_postcode"));
			memberDto.setMemberAddress(rs.getString("member_address"));
			memberDto.setMemberDetailAddress(rs.getString("member_detailaddress"));
			memberDto.setMemberJoin(rs.getDate("member_join"));
			memberDto.setMemberRole(rs.getString("member_role"));
		}
		else {
			memberDto = null;
		}
		
		con.close();
		
		return memberDto;
	}
//  비밀번호 변경 메소드
	public boolean editPassword(String memberId, String memberPw, String changePw) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update member set member_pw = ? where member_id = ? and member_pw = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, changePw);// 바꿀비밀번호
		ps.setString(2, memberId);// 현재아이디
		ps.setString(3, memberPw);// 현재비밀번호
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
	
}
