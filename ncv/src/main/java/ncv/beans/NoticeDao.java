package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
	
	public static final String USERNAME="semi",PASSWORD="semi";
	
	//목록 검색
	public List<NoticeDto> list() throws Exception{
		Connection con = JdbcUtils.connect();
		String sql = "select * from notice order by notice_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		
		List<NoticeDto> list=new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto=new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeSuperNo(rs.getInt("notice_superno"));
			noticeDto.setNoticeGroupNo(rs.getInt("notice_groupno"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));
			
			list.add(noticeDto);
			
		}
		
		con.close();
		
		return list;
			
		
	}
	
	//제목으로 검색
	
	public List<NoticeDto> search(String column, String keyword) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice where instr(#1,?)>0 order by notice_no desc";
		sql=sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		
		ResultSet rs=ps.executeQuery();
		
		List<NoticeDto> list=new ArrayList<>();
		while(rs.next()) {
			NoticeDto noticeDto=new NoticeDto();
			
			noticeDto.setNoticeNo(rs.getInt("notice_no"));
			noticeDto.setNoticeWriter(rs.getString("notice_writer"));
			noticeDto.setNoticeTitle(rs.getString("notice_title"));
			noticeDto.setNoticeContent(rs.getString("notice_content"));
			noticeDto.setNoticeTime(rs.getDate("notice_time"));
			noticeDto.setNoticeHit(rs.getInt("notice_hit"));
			noticeDto.setNoticeSuperNo(rs.getInt("notice_superno"));
			noticeDto.setNoticeGroupNo(rs.getInt("notice_groupno"));
			noticeDto.setNoticeDepth(rs.getInt("notice_depth"));
			
			list.add(noticeDto);
			
		}
		
		con.close();
		
		return list;
		
		
		
	}

}
