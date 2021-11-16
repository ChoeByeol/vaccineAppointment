package ncv.beans;

public class ShotDto {

	private int shotNo;
	private String memberId;
	private int resNo;
	private String shotStCom;
	private String shotEndCom;
	private String shotMemberNo;
	
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
	public String getShotStCom() {
		return shotStCom;
	}
	public void setShotStCom(String shotStCom) {
		this.shotStCom = shotStCom;
	}
	public String getShotEndCom() {
		return shotEndCom;
	}
	public void setShotEndCom(String shotEndCom) {
		this.shotEndCom = shotEndCom;
	}
	public String getShotMemberNo() {
		return shotMemberNo;
	}
	public void setShotMemberNo(String shotMemberNo) {
		this.shotMemberNo = shotMemberNo;
	}
	
}
