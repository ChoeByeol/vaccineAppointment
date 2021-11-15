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
				+ "member_rrn, member_gender, "
				+ "member_address, member_phone, member_join,"
				+ "member_DetailAddress, member_postcode) "
				+ "values(?, ?, ?, ?, ?, ?, ?, sysdate,?,?)";
		
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
}