package kh8semi1.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kh8semi1.beans.JdbcUtils;

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
			vaccineDto.setVaccineAge(rs.getString("vaccine_age"));
			vaccineDto.setVaccineComposition(rs.getString("vaccine_composition"));
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
			vaccineDto.setVaccineAge(rs.getString("vaccine_age"));
			vaccineDto.setVaccineComposition(rs.getString("vaccine_composition"));
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
}
