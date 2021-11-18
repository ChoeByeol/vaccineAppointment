package ncv.beans;

import java.sql.Date;

public class QnaDto {

	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaAnswer;
	private String qnaState;
	
	public QnaDto() {
		super();
	}
	public int getQnaNo() {
		return qnaNo;
	}
	public void setQnaNo(int qnaNo) {
		this.qnaNo = qnaNo;
	}
	public String getQnaWriter() {
		return qnaWriter;
	}
	public void setQnaWriter(String qnaWriter) {
		this.qnaWriter = qnaWriter;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public Date getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(Date qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public String getQnaState() {
		return qnaState;
	}
	public void setQnaState(String qnaState) {
		this.qnaState = qnaState;
	}
	
}
