package ncv.beans;

import java.sql.Date;

public class Shot3Vo {

	private int shotNo;
	private Date shotDate;
	private int shotCount;
	private int vaccineNo;
	private String shotRrn;
	private String shotMemberName;
	private String vaccineName;
	private String memberId;

    public int getShotNo() {
        return shotNo;
    }
    public void setShotNo(int shotNo) {
        this.shotNo = shotNo;
    }
    public Date getShotDate() {
        return shotDate;
    }
    public Date getShotDateDay() {
        return shotDate;
    }
    public void setShotDate(Date shotDate) {
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
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
}