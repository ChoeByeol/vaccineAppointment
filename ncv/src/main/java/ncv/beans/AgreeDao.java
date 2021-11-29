package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AgreeDao {
	
	//공지 수정
	public boolean edit(AgreeDto agreeDto) throws Exception {
		
		Connection con = JdbcUtils.connect();
		
		String sql = "update agree set agree1=?, agree2=?,agree3=?,agree4=?";
					
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, agreeDto.getAgree1());
		ps.setString(2, agreeDto.getAgree2());
		ps.setString(3, agreeDto.getAgree3());
		ps.setString(4, agreeDto.getAgree4());
		int result = ps.executeUpdate();

		con.close();		
		
		return result > 0;
	}
	
	//공지조회 기능
	public AgreeDto get() throws Exception {
		
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from agree";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		AgreeDto agreeDto;
		
		if (rs.next()) {
			agreeDto = new AgreeDto();
			agreeDto.setAgree1(rs.getString("agree1"));
			agreeDto.setAgree2(rs.getString("agree2"));
			agreeDto.setAgree3(rs.getString("agree3"));
			agreeDto.setAgree4(rs.getString("agree4"));
		}else {
			agreeDto = null;
		}
		con.close();
		
		return agreeDto;
		}
	}
