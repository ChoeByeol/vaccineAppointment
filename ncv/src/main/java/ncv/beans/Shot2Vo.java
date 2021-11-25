package ncv.beans;

public class Shot2Vo {
	private int shotNo;
	private int resOkNo;
	private int vaccineNo;
	private String ClinicName;
	private String memberId;
	private String memberName;
	private String resRrn;
	private String resPhone;
	private String vaccineName;
	private String shotDate;
	private int shotCount;

	public Shot2Vo() {
		super();
	}

	public int getShotNo() {
		return shotNo;
	}

	public void setShotNo(int shotNo) {
		this.shotNo = shotNo;
	}

	public int getResOkNo() {
		return resOkNo;
	}

	public String getClinicName() {
		return ClinicName;
	}

	public void setClinicName(String clinicName) {
		ClinicName = clinicName;
	}

	public void setResOkNo(int resOkNo) {
		this.resOkNo = resOkNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getVaccineName() {
		return vaccineName;
	}

	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}

	public String getShotDate() {
		return shotDate;
	}
	
	public String getShotDateDay() {
		return shotDate.substring(0, 16);
	}	

	public void setShotDate(String shotDate) {
		this.shotDate = shotDate;
	}

	public int getShotCount() {
		return shotCount;
	}

	public void setShotCount(int shotCount) {
		this.shotCount = shotCount;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
}
