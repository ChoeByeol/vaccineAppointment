package ncv.beans;

public class ReservationDto {
	private int resNo;
	private String memberId;
	private int vaccineNo;
	private int clinicNo;
	private int resShot;
	private String resDate;
	private String resTime;
	private String resName;
	private String resRrn;
	private String resPhone;
	
	public ReservationDto() {
		super();
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public int getClinicNo() {
		return clinicNo;
	}
	public void setClinicNo(int clinicNo) {
		this.clinicNo = clinicNo;
	}
	public int getResShot() {
		return resShot;
	}
	public void setResShot(int resShot) {
		this.resShot = resShot;
	}
	public String getResDate() {
		return resDate;
	}
	public String getResDateDay() {
		return resDate.substring(0, 10);
	}	
	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getResRrn() {
		return resRrn;
	}
	public void setResRrn(String resRrn) {
		this.resRrn = resRrn;
	}
	public String getResPhone() {
		return resPhone;
	}
	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}
}
