package ncv.beans;

import java.sql.Date;

public class ShotVo {

	private int shotNo;
	private int resNo;
	private String shotStCom;
	private String shotEndCom;
	private String shotMemberNo;
	private int resShotNo;
	private Date resDate;
	private String resTime;
	private String resName;
	private String resRrn;
	private String resPhone;
	
	public ShotVo() {
		super();
	}
	public int getShotNo() {
		return shotNo;
	}
	public void setShotNo(int shotNo) {
		this.shotNo = shotNo;
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
	public int getResShotNo() {
		return resShotNo;
	}
	public void setResShotNo(int resShotNo) {
		this.resShotNo = resShotNo;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
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
