package ncv.beans;


public class NoticeFileDto {
	
	private int noticeFileNo;
	private int noticeNo;
	private String noticeFileUploadname;
	private String noticeFileSavename;
	private String noticeFileType;
	private long noticeFileSize;
			
	public int getNoticeFileNo() {
		return noticeFileNo;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public String getNoticeFileUploadname() {
		return noticeFileUploadname;
	}

	public String getNoticeFileSavename() {
		return noticeFileSavename;
	}

	public String getNoticeFileType() {
		return noticeFileType;
	}

	public long getNoticeFileSize() {
		return noticeFileSize;
	}

	public void setNoticeFileNo(int noticeFileNo) {
		this.noticeFileNo = noticeFileNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public void setNoticeFileUploadname(String noticeFileUploadname) {
		this.noticeFileUploadname = noticeFileUploadname;
	}

	public void setNoticeFileSavename(String noticeFileSavename) {
		this.noticeFileSavename = noticeFileSavename;
	}

	public void setNoticeFileType(String noticeFileType) {
		this.noticeFileType = noticeFileType;
	}

	public void setNoticeFileSize(long noticeFileSize) {
		this.noticeFileSize = noticeFileSize;
	}


		
	public NoticeFileDto() {
		super();
		
		
		
	}
}
	