package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StockOutDao {

	//번호 생성 기능
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select stock_out_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}

	//출고 등록
	public void stockOut(StockOutDto stockOutDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into stock_out values(?, ?, ?, ?, sysdate)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, stockOutDto.getStockOutNo());
		ps.setInt(2, stockOutDto.getVaccineNo());
		ps.setInt(3, stockOutDto.getClinicNo());
		ps.setInt(4, stockOutDto.getStockOutQty());
		
		ps.execute();
		
		con.close();
	}
	
	//출고 조회
	public List<StockOutDto> select() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from stock_out";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		List<StockOutDto> list = new ArrayList<>();
		while(rs.next()) {
			StockOutDto stockOutDto = new StockOutDto();
			stockOutDto.setStockOutNo(rs.getInt("stock_out_no"));
			stockOutDto.setVaccineNo(rs.getInt("vaccine_no"));
			stockOutDto.setClinicNo(rs.getInt("clinic_no"));
			stockOutDto.setStockOutQty(rs.getInt("stock_out_qty"));
			stockOutDto.setStockOutTime(rs.getDate("stock_out_time"));
			
			list.add(stockOutDto);
		}
		
		con.close();
		
		return list;
	}
	
	//선택 병원 출고 현황 조회 기능
	public List<StockVo> myOutStockList(int clinicNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select V.vaccine_name, sum(stock_out_qty) stock_out_qty from stock_out S "
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
			stockVo.setStockOutQty(rs.getInt("stock_out_qty"));
			
			list.add(stockVo);
		}

		con.close();

		return list;
	}	
	
	
}
