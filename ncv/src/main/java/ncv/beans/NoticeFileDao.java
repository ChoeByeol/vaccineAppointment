package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeFileDao {

	//파일 정보 저장 기능
	public void insert(NoticeFileDto noticeFileDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into Notice_file values(notice_file_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeFileDto.getNoticeNo());
		ps.setString(2, noticeFileDto.getNoticeFileUploadname());
		ps.setString(3, noticeFileDto.getNoticeFileSavename());
		ps.setLong(4, noticeFileDto.getNoticeFileSize());
		ps.setString(5, noticeFileDto.getNoticeFileType());
		ps.execute();
		
		con.close();
	}



	//단일조회
	public NoticeFileDto get(int noticeFileNo) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice_file where notice_file_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeFileNo);
		ResultSet rs = ps.executeQuery();
		
		NoticeFileDto noticeFileDto;
		if(rs.next()) {
			noticeFileDto = new NoticeFileDto();
			
			//copy
			noticeFileDto.setNoticeFileNo(rs.getInt("notice_file_no"));
			noticeFileDto.setNoticeNo(rs.getInt("notice_no"));
			noticeFileDto.setNoticeFileSavename(rs.getString("notice_file_savename"));
			noticeFileDto.setNoticeFileUploadname(rs.getString("notice_file_uploadname"));
			noticeFileDto.setNoticeFileType(rs.getString("notice_file_type"));
			noticeFileDto.setNoticeFileSize(rs.getLong("notice_file_size"));
		}
		else {
			noticeFileDto = null;
		}
		
		con.close();
		
		return noticeFileDto;
	}
	
	//게시글에 해당하는 파일목록 조회
	public List<NoticeFileDto> find(int noticeNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from notice_file where notice_no = ? order by notice_file_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, noticeNo);
		ResultSet rs = ps.executeQuery();
		
		List<NoticeFileDto> list = new ArrayList<>();
		while(rs.next()) {
			NoticeFileDto noticeFileDto = new NoticeFileDto();
			
			//copy
			noticeFileDto.setNoticeFileNo(rs.getInt("notice_file_no"));
			noticeFileDto.setNoticeNo(rs.getInt("notice_no"));
			noticeFileDto.setNoticeFileSavename(rs.getString("notice_file_savename"));
			noticeFileDto.setNoticeFileUploadname(rs.getString("notice_file_uploadname"));
			noticeFileDto.setNoticeFileType(rs.getString("notice_file_type"));
			noticeFileDto.setNoticeFileSize(rs.getLong("notice_file_size"));
			
			list.add(noticeFileDto);
		}
		
		con.close();
		
		return list;
	}

}