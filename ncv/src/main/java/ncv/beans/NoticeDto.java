package ncv.beans;

import java.sql.Date;

public class NoticeDto {
	private int noticeNo;
	private String noticeWriter;
	private String noticeTitle;
	private String noticeContent;
	private Date noticeTime;
	private int noticeHit;
	private int noticeSuperNo;
	private int noticeDepth;
	private int noticeGroupNo;
	public NoticeDto() {
		super();
	}
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public String getNoticeWriter() {
		return noticeWriter;
	}
	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public Date getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(Date noticeTime) {
		this.noticeTime = noticeTime;
	}
	public int getNoticeHit() {
		return noticeHit;
	}
	public void setNoticeHit(int noticeHit) {
		this.noticeHit = noticeHit;
	}
	public int getNoticeSuperNo() {
		return noticeSuperNo;
	}
	public void setNoticeSuperNo(int noticeSuperNo) {
		this.noticeSuperNo = noticeSuperNo;
	}
	public int getNoticeGroupNo() {
		return noticeGroupNo;
	}
	public void setNoticeGroupNo(int noticeGroupNo) {
		this.noticeGroupNo = noticeGroupNo;
	}
	public int getNoticeDepth() {
		return noticeDepth;
	}
	public void setNoticeDepth(int noticeDepth) {
		this.noticeDepth = noticeDepth;
	}
	
}
