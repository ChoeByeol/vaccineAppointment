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
	public void setShotDate(String shotDate) {
		this.shotDate = shotDate;
	}
	public int getShotCount() {
		return shotCount;
	}
	@Override
	public String toString() {
		return "Shot2Dto [shotNo=" + shotNo + ", resOkNo=" + resOkNo + ", shotDate=" + shotDate + ", shotCount="
				+ shotCount + "]";
	}
	public void setShotCount(int shotCount) {
		this.shotCount = shotCount;
	}

}
