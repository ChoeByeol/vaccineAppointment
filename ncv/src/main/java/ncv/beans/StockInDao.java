package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StockInDao {
	
	//번호 생성 기능
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select stock_in_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}

	//입고 등록
	public void stockIn(StockInDto stockInDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into stock_in values(?, ?, ?, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, stockInDto.getStockInNo());
		ps.setInt(2, stockInDto.getVaccineNo());
		ps.setInt(3, stockInDto.getClinicNo());
		ps.setInt(4, stockInDto.getStockInQty());
		
		ps.execute();
		
		con.close();
	}	
	
	//입고 조회
	public List<StockInDto> select() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from stock_in";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StockInDto> list = new ArrayList<>();
		while(rs.next()) {
			StockInDto stockInDto = new StockInDto();
			stockInDto.setStockInNo(rs.getInt("stock_in_no"));
			stockInDto.setVaccineNo(rs.getInt("vaccine_no"));
			stockInDto.setClinicNo(rs.getInt("clinic_no"));
			stockInDto.setStockInQty(rs.getInt("stock_in_qty"));
			stockInDto.setStockInTime(rs.getDate("stock_in_time"));
			
			list.add(stockInDto);
		}
		
		con.close();
		
		return list;
	}
	
	//선택 병원 입고 현황 조회 기능
	public List<StockVo> myInStockList(int clinicNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select V.vaccine_name, sum(stock_in_qty) stock_in_qty from stock_in S "
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
			
			list.add(stockVo);
		}

		con.close();

		return list;
	}	
	
	//입고 상세보기 기능
	public StockInDto get(int stockInNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from stock_in where stock_in_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, stockInNo);
		ResultSet rs = ps.executeQuery();

		StockInDto stockInDto;
		if(rs.next()) {
			stockInDto = new StockInDto();

			stockInDto.setStockInNo(rs.getInt("stock_in_no"));
			stockInDto.setVaccineNo(rs.getInt("vaccine_no"));
			stockInDto.setClinicNo(rs.getInt("clinic_no"));
			stockInDto.setStockInQty(rs.getInt("stock_in_qty"));
			stockInDto.setStockInTime(rs.getDate("stock_in_time"));

		}
		else {
			stockInDto = null;
		}

		con.close();

		return stockInDto;
	}
	
	public StockInVo get(int clinicNo) throws Exception {
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from stock_in where stock_in_no = ?";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, clinicNo);
		ResultSet rs = ps.executeQuery();

		StockInDto stockInDto;
		if(rs.next()) {
			stockInDto = new StockInDto();

			stockInDto.setStockInNo(rs.getInt("stock_in_no"));
			stockInDto.setVaccineNo(rs.getInt("vaccine_no"));
			stockInDto.setClinicNo(rs.getInt("clinic_no"));
			stockInDto.setStockInQty(rs.getInt("stock_in_qty"));
			stockInDto.setStockInTime(rs.getDate("stock_in_time"));

		}
		else {
			stockInDto = null;
		}

		con.close();

		return stockInDto;
	}
	
}


