package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import ncv.beans.JdbcUtils;

public class VaccineDao {
	
	//백신 조회 기능
	public List<VaccineDto> list() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from vaccine";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		List<VaccineDto> vaccineList = new ArrayList<>();
		while(rs.next()) {
			VaccineDto vaccineDto = new VaccineDto();

			vaccineDto.setVaccineNo(rs.getInt("vaccine_no"));
			vaccineDto.setVaccinePlatform(rs.getString("vaccine_platform"));;
			vaccineDto.setVaccineName(rs.getString("vaccine_name"));
			vaccineDto.setVaccineValue(rs.getString("vaccine_value"));
			vaccineDto.setVaccineCompany(rs.getString("vaccine_company"));
			vaccineDto.setVaccineAge(rs.getInt("vaccine_age"));
			vaccineDto.setVaccineComposition(rs.getString("vaccine_composition"));
			vaccineDto.setVaccineShot(rs.getInt("vaccine_shot"));
			vaccineDto.setVaccineInterval(rs.getString("vaccine_interval"));
			vaccineDto.setVaccineMethod(rs.getString("vaccine_method"));
			vaccineDto.setVaccineKeep(rs.getString("vaccine_keep"));
			vaccineDto.setVaccineExpire(rs.getString("vaccine_expire"));
			vaccineDto.setVaccineLife(rs.getString("vaccine_life"));
			
			vaccineList.add(vaccineDto);
		}

		con.close();

		return vaccineList;
	}
	
	//백신 상세보기 기능
	public VaccineDto get(int vaccineNo) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select * from vaccine where vaccine_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, vaccineNo);
		ResultSet rs = ps.executeQuery();

		VaccineDto vaccineDto;
		if(rs.next()) {
			vaccineDto = new VaccineDto();

			vaccineDto.setVaccineNo(rs.getInt("vaccine_no"));
			vaccineDto.setVaccinePlatform(rs.getString("vaccine_platform"));
			vaccineDto.setVaccineName(rs.getString("vaccine_name"));
			vaccineDto.setVaccineValue(rs.getString("vaccine_value"));
			vaccineDto.setVaccineCompany(rs.getString("vaccine_company"));
			vaccineDto.setVaccineAge(rs.getInt("vaccine_age"));
			vaccineDto.setVaccineComposition(rs.getString("vaccine_composition"));
			vaccineDto.setVaccineShot(rs.getInt("vaccine_shot"));
			vaccineDto.setVaccineInterval(rs.getString("vaccine_interval"));
			vaccineDto.setVaccineMethod(rs.getString("vaccine_method"));
			vaccineDto.setVaccineKeep(rs.getString("vaccine_keep"));
			vaccineDto.setVaccineExpire(rs.getString("vaccine_expire"));
			vaccineDto.setVaccineLife(rs.getString("vaccine_life"));

		}
		else {
			vaccineDto = null;
		}

		con.close();

		return vaccineDto;
	}
	


//	백신 정보 변경 기능
	public boolean vaccineEdit(VaccineDto vaccineDto) throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "update vaccine set vaccine_platform = ?, vaccine_name = ?, vaccine_value = ?, vaccine_company = ?, vaccine_age = ?, vaccine_composition = ?, vaccine_shot = ?, vaccine_interval = ? , vaccine_method = ? , vaccine_keep = ? , vaccine_expire = ?, vaccine_life = ? where vaccine_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, vaccineDto.getVaccinePlatform());
		ps.setString(2, vaccineDto.getVaccineName());
		ps.setString(3, vaccineDto.getVaccineValue());
		ps.setString(4,	vaccineDto.getVaccineCompany());
		ps.setInt(5, vaccineDto.getVaccineAge());
		ps.setString(6, vaccineDto.getVaccineComposition());
		ps.setInt(7, vaccineDto.getVaccineShot());
		ps.setString(7, vaccineDto.getVaccineInterval());
		ps.setString(8, vaccineDto.getVaccineMethod());
		ps.setString(9, vaccineDto.getVaccineKeep());
		ps.setString(10, vaccineDto.getVaccineExpire());
		ps.setString(11, vaccineDto.getVaccineLife());
		ps.setInt(12, vaccineDto.getVaccineNo());
		int result = ps.executeUpdate();

		con.close();

		return result > 0;		
	}	
	
	//번호 생성 기능 : 번호를 미리 생성해두어야 할 필요가 있는 경우 사용
	public int getSequence() throws Exception {
		Connection con = JdbcUtils.connect();

		String sql = "select vac_seq.nextval from dual";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs= ps.executeQuery();

		rs.next();
		int seq = rs.getInt(1);

		con.close();

		return seq;
	}
	
	// 백신 등록 기능
	public void vaccineWrite(VaccineDto vaccineDto) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "insert into vaccine values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, vaccineDto.getVaccineNo());
		ps.setString(2, vaccineDto.getVaccinePlatform());
		ps.setString(3, vaccineDto.getVaccineName());
		ps.setString(4, vaccineDto.getVaccineValue());
		ps.setString(5, vaccineDto.getVaccineCompany());
		ps.setInt(6, vaccineDto.getVaccineAge());
		ps.setString(7, vaccineDto.getVaccineComposition());
		ps.setInt(8, vaccineDto.getVaccineShot());
		ps.setString(9, vaccineDto.getVaccineInterval());
		ps.setString(10, vaccineDto.getVaccineMethod());
		ps.setString(11, vaccineDto.getVaccineKeep());
		ps.setString(12, vaccineDto.getVaccineExpire());
		ps.setString(13, vaccineDto.getVaccineLife());
		ps.execute();

		con.close();
	}	
	
	// 백신 정보 삭제 기능
	public boolean delete(int vaccineNo) throws Exception{
		Connection con = JdbcUtils.connect();

		String sql = "delete vaccine where vaccine_no = ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, vaccineNo);
		int result = ps.executeUpdate();

		con.close();

		return result > 0;
	}	
	
	
	//접종가능한 백신 목록
	public List<VaccineDto> listByAge(MemberDto memberDto) throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select * from vaccine "
				+ "where vaccine_age <= ? "
				+ "order by vaccine_no asc";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, memberDto.getAge());
		ResultSet rs = ps.executeQuery();
		
		List<VaccineDto> list = new ArrayList<>();
		while(rs.next()) {
			VaccineDto vaccineDto = new VaccineDto();

			vaccineDto.setVaccineNo(rs.getInt("vaccine_no"));
			vaccineDto.setVaccinePlatform(rs.getString("vaccine_platform"));;
			vaccineDto.setVaccineName(rs.getString("vaccine_name"));
			vaccineDto.setVaccineValue(rs.getString("vaccine_value"));
			vaccineDto.setVaccineCompany(rs.getString("vaccine_company"));
			vaccineDto.setVaccineAge(rs.getInt("vaccine_age"));
			vaccineDto.setVaccineComposition(rs.getString("vaccine_composition"));
			vaccineDto.setVaccineShot(rs.getInt("vaccine_shot"));
			vaccineDto.setVaccineInterval(rs.getString("vaccine_interval"));
			vaccineDto.setVaccineMethod(rs.getString("vaccine_method"));
			vaccineDto.setVaccineKeep(rs.getString("vaccine_keep"));
			vaccineDto.setVaccineExpire(rs.getString("vaccine_expire"));
			vaccineDto.setVaccineLife(rs.getString("vaccine_life"));
			
			list.add(vaccineDto);
		}
		
		con.close();
		
		return list;
	}
	
	//백신 차수 확인 기능
		public int shot(int vaccineNo) throws Exception {
			Connection con = JdbcUtils.connect();

			String sql = "select vaccine_shot from vaccine where vaccine_no = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, vaccineNo);
			ResultSet rs = ps.executeQuery();
			
			rs.next();
			int shot = rs.getInt(1);

			con.close();

			return shot;
		}
}
