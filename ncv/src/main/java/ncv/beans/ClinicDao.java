package ncv.beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClinicDao {
    
	//시퀀스 생성 기능 (insert 후 병원 상세 정보 조회를 위함)
	public int getSequence() throws Exception{
		Connection con = JdbcUtils.connect();
		
		String sql = "select clinic_seq.nextval from dual";
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		rs.next();
		int seq = rs.getInt("nextval");
		
		con.close();
		
		return seq;
	}
	
    //병원 등록 기능
    public void insert(ClinicDto clinicDto) throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "insert into clinic values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, clinicDto.getClinicNo());
        ps.setString(2, clinicDto.getClinicName());
        ps.setString(3, clinicDto.getClinicTel());
        ps.setString(4, clinicDto.getClinicTime());
        ps.setString(5, clinicDto.getClinicPostcode());
        ps.setString(6, clinicDto.getClinicAddress());
        ps.setString(7, clinicDto.getClinicDetailAddress());
        ps.setString(8, clinicDto.getClinicSido());
        ps.setString(9, clinicDto.getClinicSigungu());
        ps.setString(10, clinicDto.getClinicBname());
        
        ps.execute();
        
        con.close();
    }
    
    //병원 수정 기능
    public boolean edit(ClinicDto clinicDto) throws Exception{
        Connection con = JdbcUtils.connect();
        
        String sql = "update clinic set "
        		+ "clinic_name = ?, clinic_tel = ?, clinic_Time = ?, "
        		+ "clinic_postcode = ?, clinic_address = ?, clinic_detailaddress = ?, "
        		+ "clinic_sido = ?, clinic_sigungu = ?, clinic_bname = ? where clinic_no = ?";
        
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
        ps.setInt(10, clinicDto.getClinicNo());
        
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
            clinicDto.setClinicSido(rs.getString("clinic_sido"));
            clinicDto.setClinicSigungu(rs.getString("clinic_sigungu"));
            clinicDto.setClinicBname(rs.getString("clinic_bname"));
            
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
            clinicDto.setClinicSido(rs.getString("clinic_sido"));
            clinicDto.setClinicSigungu(rs.getString("clinic_sigungu"));
            clinicDto.setClinicBname(rs.getString("clinic_bname"));
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
    
    //읍면동 조회
    public List<String> bnameList(String clinicSido, String clinicSigungu) throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "select clinic_bname from clinic "
    			+ "where clinic_sido=? and clinic_sigungu=? "
    			+ "group by clinic_bname "
    			+ "order by clinic_bname asc";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, clinicSido);
    	ps.setString(2, clinicSigungu);
    	ResultSet rs = ps.executeQuery();
    	
    	List<String> list = new ArrayList<>();
    	while(rs.next()) {
    		list.add(rs.getString(1));
    	}
    	
    	con.close();
    	
    	return list;
    }
    
    //시도, 시군구, 읍면동받아서 조회
    public List<ClinicDto> searchByAddress(String clinicSido, String clinicSigungu, String clinicBname) throws Exception{
    	Connection con = JdbcUtils.connect();
    	String sql = "select * from clinic "
    			+ "where instr(clinic_sido, ?)=1 "
    			+ "and instr(clinic_sigungu, ?)=1 "
    			+ "and instr(clinic_bname, ?)=1 "
    			+ "order by clinic_name asc";
    	PreparedStatement ps = con.prepareStatement(sql);
    	ps.setString(1, clinicSido);
    	ps.setString(2, clinicSigungu);
    	ps.setString(3, clinicBname);
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
            clinicDto.setClinicSido(rs.getString("clinic_sido"));
            clinicDto.setClinicSigungu(rs.getString("clinic_sigungu"));
            clinicDto.setClinicBname(rs.getString("clinic_bname"));
            
            list.add(clinicDto);
        }
        con.close();
        
        return list;
    }
}