package ncv.beans;

public class Shot2Dto {
	private int shotNo;
	private int resOkNo;
	private String shotDate;
	private int shotCount;

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
		return shotDate.substring(0, 10);
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

}
