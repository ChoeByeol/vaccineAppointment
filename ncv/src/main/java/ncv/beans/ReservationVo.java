package ncv.beans;

public class ReservationVo {

	@Override
	public String toString() {
		return "ReservationVo [resNo=" + resNo + ", memberId=" + memberId + ", clinicName=" + clinicName
				+ ", vaccineName=" + vaccineName + ", resShot=" + resShot + ", resDate=" + resDate + ", resTime="
				+ resTime + ", resName=" + resName + ", resRrn=" + resRrn + ", resPhone=" + resPhone + "]";
	}

	private int resNo;
	private String memberId;
	private String clinicName;
	private String vaccineName;
	private int resShot;
	private String resDate;
	private String resTime;
	private String resName;
	private String resRrn;
	private String resPhone;
	
	public ReservationVo() {
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

	public String getClinicName() {
		return clinicName;
	}

	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
	}

	public String getVaccineName() {
		return vaccineName;
	}

	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
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

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}
	
	public String getResDateDay() {
		return resDate.substring(0, 10);
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
