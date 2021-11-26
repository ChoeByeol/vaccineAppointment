package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncv.beans.QnaDto;
import ncv.beans.JdbcUtils;


public class QnaDao {
	
	//번호 생성 기능 : 번호를 미리 생성해두어야 할 필요가 있는 경우 사용
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select Qna_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt(1);
		
		con.close();
		
		return seq;
	}
		
	//문의 등록 기능 : 번호를 미리 생성해놓은 경우
	public void write(QnaDto qnaDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "insert into qna values(?, ?, ?, ?, sysdate, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qnaDto.getQnaNo());
		ps.setString(2, qnaDto.getQnaWriter());
		ps.setString(3, qnaDto.getQnaTitle());
		ps.setString(4, qnaDto.getQnaContent());
		ps.setString(5, qnaDto.getQnaAnswer());
		ps.execute();
		
		con.close();
	}
	
	//상세 조회
	public QnaDto get(int qnaNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from qna where qna_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qnaNo);
		ResultSet rs = ps.executeQuery();
		
		QnaDto qnaDto;
		if(rs.next()) {
			qnaDto = new QnaDto();
			qnaDto.setQnaNo(rs.getInt("qna_no"));
			qnaDto.setQnaWriter(rs.getString("qna_writer"));
			qnaDto.setQnaTitle(rs.getString("qna_title"));
			qnaDto.setQnaContent(rs.getString("qna_content"));
			qnaDto.setQnaDate(rs.getDate("qna_date"));
			qnaDto.setQnaAnswer(rs.getString("qna_answer"));
		}
		else {
			qnaDto = null;
		}
		
		con.close();
		
		return qnaDto;
	}

	//수정 기능
	public boolean edit(QnaDto qnaDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "update qna set qna_title = ?, qna_content = ? where qna_no = ? and qna_writer = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qnaDto.getQnaTitle());
		ps.setString(2, qnaDto.getQnaContent());
		ps.setInt(3, qnaDto.getQnaNo());
		ps.setString(4, qnaDto.getQnaWriter());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	//관리자 답변(수정) 기능
	public boolean answer(QnaDto qnaDto) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "update qna set qna_answer = ? where qna_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qnaDto.getQnaAnswer());
		ps.setInt(2, qnaDto.getQnaNo());
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
	
	//삭제 기능
	public boolean delete(int qnaNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "delete qna where qna_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, qnaNo);
		int result = ps.executeUpdate();
		
		con.close();
		
		return result > 0;
	}
		
	//페이징 목록
	public List<QnaDto> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from qna order by qna_no desc" + ")TMP" + ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<QnaDto> list = new ArrayList<>();
		while (rs.next()) {
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaNo(rs.getInt("qna_no"));
			qnaDto.setQnaWriter(rs.getString("qna_writer"));
			qnaDto.setQnaTitle(rs.getString("qna_title"));
			qnaDto.setQnaContent(rs.getString("qna_content"));
			qnaDto.setQnaDate(rs.getDate("qna_date"));
			qnaDto.setQnaAnswer(rs.getString("qna_answer"));
			
			list.add(qnaDto);
		}

		con.close();

		return list;
	}
	
	//페이징 목록 검색
	public List<QnaDto> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select * from qna where instr(#1, ?) > 0 order by #1 desc" + ")TMP" + ") where rn between ? and ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();

		List<QnaDto> list = new ArrayList<>();
		while (rs.next()) {
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaNo(rs.getInt("qna_no"));
			qnaDto.setQnaWriter(rs.getString("qna_writer"));
			qnaDto.setQnaTitle(rs.getString("qna_title"));
			qnaDto.setQnaContent(rs.getString("qna_content"));
			qnaDto.setQnaDate(rs.getDate("qna_date"));
			qnaDto.setQnaAnswer(rs.getString("qna_answer"));
			
			list.add(qnaDto);
		}

		con.close();

		return list;
	}
	
	//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from qna";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(검색)
	public int count(String column, String keyword) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select count(*) from qna where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		
		int count = rs.getInt(1);
		
		con.close();
		
		return count;
	}
	
	//내가 작성한 1대1문의 목록
	public List<QnaDto> mylist(String qnaWriter) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from qna where qna_writer = ? order by qna_no desc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, qnaWriter);
		ResultSet rs = ps.executeQuery();
		
		List<QnaDto> list = new ArrayList<>();
		while (rs.next()) {
			QnaDto qnaDto = new QnaDto();
			qnaDto.setQnaNo(rs.getInt("qna_no"));
			qnaDto.setQnaWriter(rs.getString("qna_writer"));
			qnaDto.setQnaTitle(rs.getString("qna_title"));
			qnaDto.setQnaContent(rs.getString("qna_content"));
			qnaDto.setQnaDate(rs.getDate("qna_date"));
			qnaDto.setQnaAnswer(rs.getString("qna_answer"));
			
			list.add(qnaDto);
		}

		con.close();

		return list;
		
		
	}
	
}
