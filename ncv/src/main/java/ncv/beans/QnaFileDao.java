package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QnaFileDao {
	//파일 정보 저장 기능
	public void insert(QnaFileDto boardFileDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into qna_file values(qna_file_seq.nextval, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardFileDto.getQnaNo());
		ps.setString(2, boardFileDto.getQnaFileUploadName());
		ps.setString(3, boardFileDto.getQnaFileSaveName());
		ps.setLong(4, boardFileDto.getQnaFileSize());
		ps.setString(5, boardFileDto.getQnaFileType());
		ps.execute();
		
		con.close();
		
	}

	public QnaFileDto get(int qnaFileNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from board_file where board_file_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qnaFileNo);
		ResultSet rs = ps.executeQuery();
		
		QnaFileDto qnaFileDto;
		if(rs.next()) {
			qnaFileDto = new QnaFileDto();
			
			//copy
			qnaFileDto.setQnaFileNo(rs.getInt("qna_file_no"));
			qnaFileDto.setQnaFileSaveName(rs.getString("qna_file_savename"));
			qnaFileDto.setQnaFileUploadName(rs.getString("qna_file_uploadname"));
			qnaFileDto.setQnaFileType(rs.getString("qna_file_type"));
			qnaFileDto.setQnaFileSize(rs.getLong("qna_file_size"));
		}
		else {
			qnaFileDto = null;
		}
		
		con.close();
		
		return qnaFileDto;
	}
	
	//게시글에 해당하는 파일목록 조회
	public List<QnaFileDto> find(int qnaNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from qna_file where qna_no = ? order by qna_file_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qnaNo);
		ResultSet rs = ps.executeQuery();
		
		List<QnaFileDto> list = new ArrayList<>();
		while(rs.next()) {
			QnaFileDto qnaFileDto = new QnaFileDto();
			
			//copy
			qnaFileDto.setQnaFileNo(rs.getInt("qna_file_no"));
			qnaFileDto.setQnaFileSaveName(rs.getString("qna_file_savename"));
			qnaFileDto.setQnaFileUploadName(rs.getString("qna_file_uploadname"));
			qnaFileDto.setQnaFileType(rs.getString("qna_file_type"));
			qnaFileDto.setQnaFileSize(rs.getLong("qna_file_size"));
			
			list.add(qnaFileDto);
		}
		
		con.close();
		
		return list;
	}
}
