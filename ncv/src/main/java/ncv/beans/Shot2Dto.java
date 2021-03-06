package ncv.beans;

public class Shot2Dto {
    private int shotNo;
    private int resOkNo;
    private String shotDate;
    private int shotCount;
    private int vaccineNo;
    private String shotRrn;
    private String shotMemberName;
    private String memberId;

    public int getShotNo() {
        return shotNo;
    }
    public void setShotNo(int shotNo) {
        this.shotNo = shotNo;
    }
    public int getResOkNo() {
        return resOkNo;
    }
    public void setResOkNo(int resOkNo) {
        this.resOkNo = resOkNo;
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
	public String getShotRrn() {
		return shotRrn;
	}
	public void setShotRrn(String shotRrn) {
		this.shotRrn = shotRrn;
	}
	public String getShotMemberName() {
		return shotMemberName;
	}
	public void setShotMemberName(String shotMemberName) {
		this.shotMemberName = shotMemberName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}