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
//	개인정보 변경 기능
//	public boolean update(MemberDto memberDto) throws Exception{
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "update member "
//				+ "set "
//				+ "member_nick=?, member_birth=?,"
//				+ "member_email=?, member_phone=? "
//				+ "where member_id=? and member_pw=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, memberDto.getMember_Nick());
//		ps.setString(2, memberDto.getMember_Birth());
//		ps.setString(3, memberDto.getMember_email());
//		ps.setString(4, memberDto.getMember_phone());
//		ps.setString(5, memberDto.getMember_id());
//		ps.setString(6, memberDto.getMember_Pw());
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
////	비밀번호 변경 메소드
//	public boolean editPassword(String memberId, String memberPw, String changePw) throws Exception{
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "update member "
//				+ "set "
//				+ "member_pw=? "
//				+ "where member_id=? and member_Pw=?";
//				
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, changePw);
//		ps.setString(2, memberId);
//		ps.setString(3, memberPw);
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
//	
////	비밀번호 변경 기능2
//	public boolean editPassword(MemberDto memberDto, String changePw) throws Exception{
//		return editPassword(memberDto.getMember_id(), memberDto.getMember_Pw(), changePw);
//	}
//	
////	회원 탈퇴 기능
//	public boolean quit(String member_id) throws Exception{
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "delete member where member_id = ?";
//		
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1,member_id);
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;				
//	}
//	public boolean quit(String member_id, String member_Pw) throws Exception {
//		Connection con = JdbcUtils.connect();
//
//		String sql = "delete member where member_id = ? and member_pw = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, member_id);
//		ps.setString(2, member_Pw);
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
//	
//	public boolean quit(MemberDto memberDto) throws Exception {
//		Connection con = JdbcUtils.connect();
//		
//		StringBuffer buffer = new StringBuffer();
//		buffer.append("delete member ");
//		buffer.append("where 1=1 ");
//		
//		if(memberDto.getMember_id() != null) {
//			buffer.append("and member_id = ? ");
//		}
//		if(memberDto.getMember_Pw() != null) {
//			buffer.append("and member_pw = ? ");
//		}
//		if(memberDto.getMember_Nick() != null) {
//			buffer.append("and member_nick = ? ");
//		}
//		if(memberDto.getMember_phone() != null) {
//			buffer.append("and member_phone = ? ");
//		}
//		if(memberDto.getMember_grade() != null) {
//			buffer.append("and member_grade = ? ");
//		}
//		
//		String sql = buffer.toString();
//		System.out.println("sql = " + sql);
//		PreparedStatement ps = con.prepareStatement(sql);
//		
//		int index = 1;
//		if(memberDto.getMember_id() != null) {
//			ps.setString(index++, memberDto.getMember_id());
//		}
//		if(memberDto.getMember_Pw() != null) {
//			ps.setString(index++, memberDto.getMember_Pw());
//		}
//		if(memberDto.getMember_Nick() != null) {
//			ps.setString(index++, memberDto.getMember_Nick());
//		}
//		if(memberDto.getMember_phone() != null) {
//			ps.setString(index++, memberDto.getMember_phone());
//		}
//		if(memberDto.getMember_grade() != null) {
//			ps.setString(index++, memberDto.getMember_grade());
//		}
//		
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
//	
////	목록 조회 기능
//	public List<MemberDto> list() throws Exception{
//		
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "select * from member";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//		
//		List<MemberDto> memberList = new ArrayList<>();
//		
//		while(rs.next()) {
//			MemberDto memberDto = new MemberDto();
//			
//			memberDto.setMember_id(rs.getString("member_id"));
//			memberDto.setMember_Pw(rs.getString("member_pw"));
//			memberDto.setMember_Nick(rs.getString("member_nick"));
//			memberDto.setMember_Birth(rs.getString("member_Birth"));
//			memberDto.setMember_email(rs.getString("member_email"));
//			memberDto.setMember_phone(rs.getString("member_phone"));
//			memberDto.setMember_join(rs.getDate("member_join"));
//			memberDto.setMember_point(rs.getInt("member_point"));
//			memberDto.setMember_grade(rs.getString("member_grade"));
//			
//			memberList.add(memberDto);
//		}
//		
//		con.close();
//		
//		return memberList;
//	}
//	//	회원검색 기능
//	public List<MemberDto> search(String column, String keyword) throws Exception {
//		Connection con = JdbcUtils.connect();
//		
////		String sql = "select * from product where #1 =? order by #1 asc";
//		String sql = "select * from member where instr(#1, ?) > 0 order by #1 asc";
////		String sql = "select * from product where #1 like '%'||?||'%' order by #1 asc";
//		sql = sql.replace("#1", column);//정적 치환
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, keyword);//동적 치환
//		ResultSet rs = ps.executeQuery();
//		
//		//copy
//		List<MemberDto> list = new ArrayList<>();
//		
//		while(rs.next()) {			
//			MemberDto memberDto = new MemberDto();
//			
//			memberDto.setMember_id(rs.getString("member_id"));
//			memberDto.setMember_Pw(rs.getString("member_pw"));
//			memberDto.setMember_Nick(rs.getString("member_nick"));
//			memberDto.setMember_Birth(rs.getString("member_birth"));
//			memberDto.setMember_email(rs.getString("member_email"));
//			memberDto.setMember_phone(rs.getString("member_phone"));
//			memberDto.setMember_join(rs.getDate("member_join"));
//			memberDto.setMember_point(rs.getInt("member_point"));
//			memberDto.setMember_grade(rs.getString("member_grade"));
//			
//			list.add(memberDto);
//			
//		}			
//		con.close();	
//		
//		return list;		
//	}	
//	
//	//회원상세 기능
//	public MemberDto get(String member_id) throws Exception{
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "select * from member where member_id=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, member_id);
//		ResultSet rs = ps.executeQuery();
//		
//		MemberDto memberDto;
//		
//		if(rs.next()) {
//			memberDto = new MemberDto();
//			
//			memberDto.setMember_id(rs.getString("member_id"));
//			memberDto.setMember_Pw(rs.getString("member_Pw"));
//			memberDto.setMember_Nick(rs.getString("member_Nick"));
//			memberDto.setMember_Birth(rs.getString("member_Birth"));
//			memberDto.setMember_email(rs.getString("member_email"));
//			memberDto.setMember_phone(rs.getString("member_phone"));
//			memberDto.setMember_join(rs.getDate("member_join"));
//			memberDto.setMember_point(rs.getInt("member_point"));
//			memberDto.setMember_grade(rs.getString("member_grade"));
//					
//		}
//		else {
//			memberDto = null;
//		}
//		con.close();
//		
//		return memberDto;		
//	}
//	
//	public boolean addPoint(String member_id, int coin_amount) throws Exception {
//		
//		Connection con = JdbcUtils.connect(); 
//		
//		String sql = "update member "
//				+ "set member_point = member_point + ? "
//				+ "where member_id = ?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, coin_amount);
//		ps.setString(2, member_id);
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
//	
//	public boolean refreshPoint(String member_id) throws Exception {
//		
//		Connection con = JdbcUtils.connect(); 
//		
//		String sql = "update member set member_point = ("
//				+ "select sum(history_amount) from total_history_record where member_id = ?"
//				+") where member_id = ?";
//		
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, member_id);
//		ps.setString(2, member_id);
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
//	
//	//관리자용 수정 기능
//	public boolean editByAdmin(MemberDto memberDto) throws Exception{
//		Connection con = JdbcUtils.connect();
//		
//		String sql = "update member "
//								+ "set "
//										+ "member_nick=?, "
//										+ "member_birth=to_date(?, 'YYYY-MM-DD'), "
//										+ "member_email=?, "
//										+ "member_phone=?, "
//										+ "member_point=?, "
//										+ "member_grade=? "
//								+ "where member_id=?";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setString(1, memberDto.getMember_Nick());
//		ps.setString(2, memberDto.getMember_Birth());
//		ps.setString(3, memberDto.getMember_email());
//		ps.setString(4, memberDto.getMember_phone());
//		ps.setInt(5, memberDto.getMember_point());
//		ps.setString(6, memberDto.getMember_grade());
//		ps.setString(7, memberDto.getMember_id());
//		int result = ps.executeUpdate();
//		
//		con.close();
//		
//		return result > 0;
//	}
	//회원등급별 포인트 보유량 조회 기능(통계기능)
	//= MemberDto 외에 필요한 내용이 있다면 별도의 클래스를 만들어서 처리
	//= DTO는 테이블과 동일한 형태로 만들어야 한다.
	//= 이러한 경우 DTO 말고 VO를 만들어서 사용한다(Value Object)
	//= VO는 자유로운 형태로 만들 수 있다.
	//= DTO와 VO를 구분하지 않는 경우도 많이 있다.
//	public List<GroupPointVO> pointByGrade() throws Exception{
//		Connection con = JdbcUtils.connect(USERNAME, PASSWORD);
//		
//		String sql = "select member_grade, sum(member_point) total from member "
//							+ "group by member_grade order by total desc";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ResultSet rs = ps.executeQuery();
//		
//		List<GroupPointVO> list = new ArrayList<>();
//		while(rs.next()) {
//			GroupPointVO vo = new GroupPointVO();
//			vo.setMember_grade(rs.getString("member_grade"));
//			vo.setTotal(rs.getInt("total"));
//			list.add(vo);
//		}		
//		con.close();
//
//		return list;
//	}
//	
	}

	