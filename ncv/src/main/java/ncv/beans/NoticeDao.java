package ncv.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
	
	//목록기능
	public List<NoticeDto> list() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice order by notice_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));

			
			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	//검색기능

	public List<NoticeDto> search(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice where instr(#1, ?) > 0 order by notice_no desc";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));

			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	//상세보기 기능
	public NoticeDto get(int noticeNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice where notice_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		ResultSet rs = ps.executeQuery();
		
		NoticeDto noticeDto;
		if(rs.next()) {

				noticeDto = new NoticeDto();
				
				noticeDto.setNoticeNo(rs.getInt("notice_no"));
				noticeDto.setNoticeWriter(rs.getString("notice_writer"));
				noticeDto.setNoticeTitle(rs.getString("notice_title"));
				noticeDto.setNoticeContent(rs.getString("notice_content"));
				noticeDto.setNoticeTime(rs.getDate("notice_time"));
				noticeDto.setNoticeHit(rs.getInt("notice_hit"));
				noticeDto.setNoticeDepth(rs.getInt("notice_depth"));
		}
		else {
			noticeDto = null;
		}
		
		con.close();
		
		return noticeDto;
	}
	

	//남의 글일 때 조회수 증가 기능
	public boolean readUp(int noticeNo, String memberId) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "update notice "
							+ "set notice_hit = notice_hit + 1 "
							+ "where notice_no = ? and notice_writer != ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		ps.setString(2, memberId);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	

	//등록 기능
	public void write(NoticeDto noticeDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		
		String sql = "insert into notice values(?, ?, ?, ?, sysdate, 0,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1,noticeDto.getNoticeNo());
		ps.setString(2, noticeDto.getNoticeWriter());
		ps.setString(3, noticeDto.getNoticeTitle());
		ps.setString(4, noticeDto.getNoticeContent());
		ps.setInt(5, noticeDto.getNoticeDepth());
		ps.execute();
		
		con.close();
	}
	
	//번호 생성 기능 : 번호를 미리 생성해두어야 할 필요가 있는 경우 사용
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select notice_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
	


	//삭제 기능
	public boolean delete(int noticeNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "delete notice where notice_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}

	//수정 기능
	public boolean edit(NoticeDto noticeDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "update notice set notice_title=?, notice_content=? where notice_no=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, noticeDto.getNoticeTitle());
		ps.setString(2, noticeDto.getNoticeContent());
		ps.setInt(3, noticeDto.getNoticeNo());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}

	
	// 이 이하는 아직 이해가 덜 된 채로 긁어와서 잘못된 부분이 있을 수 있습니다.


	
	//그룹 상단 고정 페이징 목록
	public List<NoticeDto> listByImportant(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from notice "
								+"order by notice_depth desc,notice_no desc"
								+ ")TMP"
						+ ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();

			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));


			
			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	//페이징 검색
	public List<NoticeDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from ("
								+ "select rownum rn, TMP.* from ("
									+ "select * from notice where instr(#1, ?) > 0 order by notice_no desc"
								+ ")TMP"
						+ ") where rn between ? and ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();

			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));

			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
	
	//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록 / 검색)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from notice";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	public int count(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from notice where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}

	
	//일치 검색 기능
	public List<NoticeDto> searchEquals(String column, String keyword) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice where #1 = ? order by notice_no desc";
		sql = sql.replace("#1", column);//정적 바인딩
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto = new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));



			
			list.add(noticeDto);
		}
		
		con.close();
		
		return list;
	}
}





	

