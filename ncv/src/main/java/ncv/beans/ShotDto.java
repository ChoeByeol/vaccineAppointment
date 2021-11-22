package ncv.beans;

public class ShotDto {

	private int shotNo;
	private String memberId;
	private int resNo;
	private int clinicNo;
	private int vaccineNo;
	private String shotOne;
	private String shotTwo;
	private String shotMemberRrn;
	
	public ShotDto() {
		super();
	}
	public int getShotNo() {
		return shotNo;
	}
	public void setShotNo(int shotNo) {
		this.shotNo = shotNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getClinicNo() {
		return clinicNo;
	}
	public void setClinicNo(int clinicNo) {
		this.clinicNo = clinicNo;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public String getShotOne() {
		return shotOne;
	}
	public void setShotOne(String shotOne) {
		this.shotOne = shotOne;
	}
	public String getShotTwo() {
		return shotTwo;
	}
	public void setShotTwo(String shotTwo) {
		this.shotTwo = shotTwo;
	}
	public String getShotMemberRrn() {
		return shotMemberRrn;
	}
	public void setShotMemberRrn(String shotMemberRrn) {
		this.shotMemberRrn = shotMemberRrn;
	}

}
