package ncv.beans;

import java.sql.Date;

public class QnaDto {

	private int qnaNo;
	private String qnaWriter;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
	private String qnaAnswer;
	
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
		if(qnaAnswer == null) {
			return "";
		}
		else {
			return qnaAnswer;
		}
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	
	//답변상태 보여주기
	public String getQnaState() {
		if(this.qnaAnswer == null || this.qnaAnswer.isEmpty()) {
			return "답변대기";
		}
		else {
			return "답변완료";
		}
	}
}
