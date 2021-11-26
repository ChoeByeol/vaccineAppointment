package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StockDao {
	
	//번호 생성 기능
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select stock_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}

	//입고 등록
	public void stockIn(StockDto stockDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into stock values(?, ?, ?, ?, 0, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, stockDto.getStockNo());
		ps.setInt(2, stockDto.getVaccineNo());
		ps.setInt(3, stockDto.getClinicNo());
		ps.setInt(4, stockDto.getStockInQty());
		
		ps.execute();
		
		con.close();
	}	
	
	//출고 등록
	public void stockOut(StockDto stockDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into stock values(?, ?, ?, 0, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, stockDto.getStockNo());
		ps.setInt(2, stockDto.getVaccineNo());
		ps.setInt(3, stockDto.getClinicNo());
		ps.setInt(4, stockDto.getStockOutQty());
		
		ps.execute();
		
		con.close();
	}	
	
	//입출고 조회(조인)
	public List<Stock3Vo> select() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no "
				+ "group by S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time;";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<Stock3Vo> list = new ArrayList<>();
		while(rs.next()) {
			Stock3Vo stock3Vo = new Stock3Vo();
			stock3Vo.setStockNo(rs.getInt("stock_no"));
			stock3Vo.setClinicName(rs.getString("clinic_name"));
			stock3Vo.setVaccineName(rs.getString("vaccine_name"));
			stock3Vo.setStockInQty(rs.getInt("stock_in_qty"));
			stock3Vo.setStockOutQty(rs.getInt("stock_out_qty"));
			stock3Vo.setUpdateTime(rs.getDate("update_time"));
			
			list.add(stock3Vo);
		}
		
		con.close();
		
		return list;
	}
	
	//선택 병원 입출고 현황 조회 기능(백신 종류별로 그룹화)
	public List<StockVo> clinicStockList(int clinicNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select V.vaccine_name, sum(stock_in_qty) stock_in_qty, sum(stock_out_qty) stock_out_qty, "
							+ "sum(stock_in_qty) - sum(stock_out_qty) total_stock from stock S "
							+ "left outer join clinic C on S.clinic_no = C.clinic_no "
							+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no "
							+ "where C.clinic_no = ? group by V.vaccine_name";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, clinicNo);
		ResultSet rs = ps.executeQuery();

		List<StockVo> list = new ArrayList<>();
		while(rs.next()) {
			StockVo stockVo = new StockVo();
			stockVo.setVaccineName(rs.getString("vaccine_name"));
			stockVo.setStockInQty(rs.getInt("stock_in_qty"));
			stockVo.setStockOutQty(rs.getInt("stock_out_qty"));
			stockVo.setTotalStock(rs.getInt("total_stock"));
			
			list.add(stockVo);
		}

		con.close();

		return list;
	}	
	
	//백신별 입,출고 현황 조회 기능(병원으로 그룹화)
	public List<Stock2Vo> vaccineStockList(int vaccineNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select C.clinic_name, sum(stock_in_qty) stock_in_qty, sum(stock_out_qty) stock_out_qty, "
				+ "sum(stock_in_qty) - sum(stock_out_qty) total_stock from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no "
				+ "where V.vaccine_no = ? group by C.clinic_name";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, vaccineNo);
		ResultSet rs = ps.executeQuery();

		List<Stock2Vo> list = new ArrayList<>();
		while(rs.next()) {
			Stock2Vo stock2Vo = new Stock2Vo();
			stock2Vo.setClinicName(rs.getString("clinic_name"));
			stock2Vo.setStockInQty(rs.getInt("stock_in_qty"));
			stock2Vo.setStockOutQty(rs.getInt("stock_out_qty"));
			stock2Vo.setTotalStock(rs.getInt("total_stock"));
			
			list.add(stock2Vo);
		}

		con.close();

		return list;
	}
	
	// 페이징에서 마지막 블록을 구하기 위하여 게시글 개수를 구하는 기능(목록)
	public int count() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select count(*) from (select S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no group by S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time)";
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

		String sql = "select count(*) from (select S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no group by S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time) "
				+ "where instr(#1, ?) > 0";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ResultSet rs = ps.executeQuery();

		rs.next();

		int count = rs.getInt(1);

		con.close();

		return count;
	}
	
	public List<Stock3Vo> listByRownum(int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no group by S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time order by stock_no desc" + ")TMP" + ") where rn between ? and ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, begin);
		ps.setInt(2, end);
		ResultSet rs = ps.executeQuery();

		List<Stock3Vo> list = new ArrayList<>();
		while(rs.next()) {
			Stock3Vo stock3Vo = new Stock3Vo();
			stock3Vo.setStockNo(rs.getInt("stock_no"));
			stock3Vo.setClinicName(rs.getString("clinic_name"));
			stock3Vo.setVaccineName(rs.getString("vaccine_name"));
			stock3Vo.setStockInQty(rs.getInt("stock_in_qty"));
			stock3Vo.setStockOutQty(rs.getInt("stock_out_qty"));
			stock3Vo.setUpdateTime(rs.getDate("update_time"));
			
			list.add(stock3Vo);
		}
		
		con.close();
		
		return list;
	}

	public List<Stock3Vo> searchByRownum(String column, String keyword, int begin, int end) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from (" + "select rownum rn, TMP.* from ("
				+ "select S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time from stock S "
				+ "left outer join clinic C on S.clinic_no = C.clinic_no "
				+ "left outer join vaccine V on S.vaccine_no = V.vaccine_no where instr(#1, ?) > 0 group by S.stock_no, C.clinic_name, V.vaccine_name, S.stock_in_qty, S.stock_out_qty, S.update_time order by #1 desc" + ")TMP" + ") where rn between ? and ?";
		sql = sql.replace("#1", column);
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, keyword);
		ps.setInt(2, begin);
		ps.setInt(3, end);
		ResultSet rs = ps.executeQuery();

		List<Stock3Vo> list = new ArrayList<>();
		while(rs.next()) {
			Stock3Vo stock3Vo = new Stock3Vo();
			stock3Vo.setStockNo(rs.getInt("stock_no"));
			stock3Vo.setClinicName(rs.getString("clinic_name"));
			stock3Vo.setVaccineName(rs.getString("vaccine_name"));
			stock3Vo.setStockInQty(rs.getInt("stock_in_qty"));
			stock3Vo.setStockOutQty(rs.getInt("stock_out_qty"));
			stock3Vo.setUpdateTime(rs.getDate("update_time"));
			
			list.add(stock3Vo);
		}
		
		con.close();
		
		return list;
	}
	
	//접종이 완료되면 병원의 백신 출고가 1 증가하는 기능
    public void stockMinus(int clinicNo, int vaccineNo) throws Exception {
        Connection con = JdbcUtils.connect();

        String sql = "insert into stock values(stock_seq.nextval, ?, ?, 0, 1, sysdate)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, vaccineNo);
        ps.setInt(2, clinicNo);

        ps.execute();

        con.close();
    }
    
    //특정 병원과 특정 백신의 입고 총합 - 예약을 받기 위해 필요
    public int getStockInTotalQty(int vaccineNo, int clinicNo) throws Exception {
        Connection con = JdbcUtils.connect();

        String sql = "select sum(stock_in_qty) stock_in_qty from stock S "
                + "left outer join clinic C on S.clinic_no = C.clinic_no "
                + "left outer join vaccine V on S.vaccine_no = V.vaccine_no "
                + "where V.vaccine_no = ? and C.clinic_no = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, vaccineNo);
        ps.setInt(2, clinicNo);
        ResultSet rs = ps.executeQuery();

        rs.next();

        int count = rs.getInt(1);

        con.close();

        return count;
    }
}


