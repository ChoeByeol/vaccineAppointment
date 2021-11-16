package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClinicDao {
    
    //병원 등록 기능
    public void insert(ClinicDto clinicDto) throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "insert into clinic values(clinic_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, clinicDto.getClinicName());
        ps.setString(2, clinicDto.getClinicTel());
        ps.setString(3, clinicDto.getClinicTime());
        ps.setString(4, clinicDto.getClinicPostcode());
        ps.setString(5, clinicDto.getClinicAddress());
        ps.setString(6, clinicDto.getClinicDetailAddress());
        ps.setString(7, clinicDto.getClinicSido());
        ps.setString(8, clinicDto.getClinicSigungu());
        ps.setString(9, clinicDto.getClinicBname());
        
        ps.execute();
        
        con.close();
    }
    
    //병원 수정 기능
    public boolean edit(ClinicDto clinicDto) throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "update clinic set clinic_name = ?, clinic_tel = ?, clinic_Time = ?, clinic_postcode = ?, clinic_address = ?, clinic_detailaddress = ? where clinic_no = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, clinicDto.getClinicName());
        ps.setString(2, clinicDto.getClinicTel());
        ps.setString(3, clinicDto.getClinicTime());
        ps.setString(4, clinicDto.getClinicPostcode());
        ps.setString(5, clinicDto.getClinicAddress());
        ps.setString(6, clinicDto.getClinicDetailAddress());
        ps.setInt(7, clinicDto.getClinicNo());
        
        int result = ps.executeUpdate();
        
        con.close();
        
        return result > 0;
    }
    
    //병원 목록 기능
    public List<ClinicDto> list() throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "select * from clinic order by clinic_no asc";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        List<ClinicDto> list = new ArrayList<>();
        while(rs.next()) {
            ClinicDto clinicDto = new ClinicDto();
            
            clinicDto.setClinicNo(rs.getInt("clinic_no"));
            clinicDto.setClinicName(rs.getString("clinic_name"));
            clinicDto.setClinicTel(rs.getString("clinic_tel"));
            clinicDto.setClinicTime(rs.getString("clinic_time"));
            clinicDto.setClinicPostcode(rs.getString("clinic_postcode"));
            clinicDto.setClinicAddress(rs.getString("clinic_address"));
            clinicDto.setClinicDetailAddress(rs.getString("clinic_detailAddress"));
            
            list.add(clinicDto);
        }
        con.close();
        
        return list;
    }
    
    //병원 삭제 기능
    public boolean delete(int clinicNo) throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "delete clinic where clinic_no = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, clinicNo);
        int result = ps.executeUpdate();
        
        con.close();
        
        return result > 0;
    }
    
    //병원 상세조회 기능
    public ClinicDto select(int clinicNo) throws Exception{
    	Connection con = JdbcUtils.connect();
    	
    	String sql = "select * from clinic where clinic_no = ?";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setInt(1, clinicNo);
    	ResultSet rs = ps.executeQuery();
    	
    	ClinicDto clinicDto = new ClinicDto();
    	
    	if(rs.next()) {
            clinicDto.setClinicNo(rs.getInt("clinic_no"));
            clinicDto.setClinicName(rs.getString("clinic_name"));
            clinicDto.setClinicTel(rs.getString("clinic_tel"));
            clinicDto.setClinicTime(rs.getString("clinic_time"));
            clinicDto.setClinicPostcode(rs.getString("clinic_postcode"));
            clinicDto.setClinicAddress(rs.getString("clinic_address"));
            clinicDto.setClinicDetailAddress(rs.getString("clinic_detailAddress"));
    	}
    	else {
    		clinicDto = null;
    	}
    	con.close();
    	
    	return clinicDto;
    }
    
    //시도 목록 조회 기능 (필요할거 같아서 만들어놈)
    public List<String> sidoList() throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "select clinic_sido from clinic group by clinic_sido order by clinic_sido";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ResultSet rs = ps.executeQuery();
    	
    	List<String> list = new ArrayList<>();
    	while(rs.next()) {
    		list.add(rs.getString(1));
    	}
    	
    	con.close();
    	
    	return list;
    }
    
    
    //시군구 목록 조회하는 기능 (필요할거 같아서 만들어놈)
    public List<String> sigunguList(String clinicSido) throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "select clinic_sigungu from clinic where clinic_sido=? group by clinic_sigungu order by clinic_sigungu asc";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, clinicSido);
    	ResultSet rs = ps.executeQuery();
    	
    	List<String> list = new ArrayList<>();
    	while(rs.next()) {
    		list.add(rs.getString(1));
    	}
    	
    	con.close();
    	
    	return list;
    }
}