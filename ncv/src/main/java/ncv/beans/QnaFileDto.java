package ncv.beans;

public class QnaFileDto {

	private int qnaFileNo;
	private int qnaNo;
	private String qnaFileUploadName;
	private String qnaFileSaveName;
	private String qnaFileType;
	private long qnaFileSize;
	
	public QnaFileDto() {
		super();
	}
	public int getQnaFileNo() {
		return qnaFileNo;
	}
	public void setQnaFileNo(int qnaFileNo) {
		this.qnaFileNo = qnaFileNo;
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaFileUploadName() {
		return qnaFileUploadName;
	}
	public void setQnaFileUploadName(String qnaFileUploadName) {
		this.qnaFileUploadName = qnaFileUploadName;
	}
	public String getQnaFileSaveName() {
		return qnaFileSaveName;
	}
	public void setQnaFileSaveName(String qnaFileSaveName) {
		this.qnaFileSaveName = qnaFileSaveName;
	}
	public String getQnaFileType() {
		return qnaFileType;
	}
	public void setQnaFileType(String qnaFileType) {
		this.qnaFileType = qnaFileType;
	}
	public long getQnaFileSize() {
		return qnaFileSize;
	}
	public void setQnaFileSize(long qnaFileSize) {
		this.qnaFileSize = qnaFileSize;
	}
	
	
}
