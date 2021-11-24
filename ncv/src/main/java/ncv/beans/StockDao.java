package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StockDao {
	
//	INSERT INTO testtable (subject, content)
//	VALUES
//	('sub1','con1'),
//	('sub2','con2'),
//	('sub3','con3');


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

		String sql = "insert into stock values(?, ?, ?, ?, sysdate, '입고')";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, stockDto.getStockNo());
		ps.setInt(2, stockDto.getClinicNo());
		ps.setInt(3, stockDto.getVaccineNo());
		ps.setInt(4, stockDto.getQuantity());

		ps.execute();

		con.close();
	}	
	
	//입고 기록 등록
//	public void stockInRecord(StockRecordDto stockRecordDto) throws Exception{
//		Connection con = JdbcUtils.connect();
//
//		String sql = "insert into stock_record values(?, ?, ?)";
//		PreparedStatement ps = con.prepareStatement(sql);
//		ps.setInt(1, stockRecordDto.getStockNo());
//		ps.setInt(2, stockRecordDto.getVaccineNo());
//		ps.setInt(3, stockRecordDto.getQuantity());
//
//		ps.execute();
//
//		con.close();
//	}	
	
	
	//선택 병원 재고현황 조회 기능
	public List<StockVo> myStockList(int clinicNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select c.vaccine_name, sum(quantity) quantity from stock a left join clinic b on b.clinic_no = a.clinic_no left join vaccine c on c.vaccine_no = a.vaccine_no where b.clinic_no = ? group by c.vaccine_name";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, clinicNo);
		ResultSet rs = ps.executeQuery();

		List<StockVo> myStockList = new ArrayList<>();
		while(rs.next()) {
			StockVo stockVo = new StockVo();

			stockVo.setVaccineName(rs.getString("vaccine_name"));
			stockVo.setQuantity(rs.getInt("quantity"));	
			
			myStockList.add(stockVo);
		}

		con.close();

		return myStockList;
	}	
	
}


