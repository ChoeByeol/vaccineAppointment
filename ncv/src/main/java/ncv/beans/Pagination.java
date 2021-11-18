package ncv.beans;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletRequest;
public class Pagination {
	//필수 데이터
	private int p;
	private int count;
	
	//선택 데이터
	private String column;
	private String keyword;
	
	//생성자를 이용하여 필수 데이터를 설정하도록 구현
	public Pagination(HttpServletRequest req) {
		try {
			this.p = Integer.parseInt(req.getParameter("p"));
			if(this.p <= 0) throw new Exception();
		}
		catch(Exception e) {
			this.p = 1;
		}
		this.column = req.getParameter("column");
		this.keyword = req.getParameter("keyword");
	}
	
	//계산 메소드
	private int pageSize = 10;
	private int blockSize = 10;
	private int begin, end;
	private int startBlock, finishBlock, lastBlock;
	private List<NoticeDto> list;
	public void calculate() throws Exception {
		//count 계산
		NoticeDao2 noticeDao = new NoticeDao2();
		if(isSearch()) {
			this.count = noticeDao.count(column,keyword);
		}
		else {
			this.count = noticeDao.count(column,keyword);
		}
		
		//rownum 계산
		this.end = this.p * this.pageSize;
		this.begin = this.end - (this.pageSize - 1);
		
		//block 계산
		this.lastBlock = (this.count - 1) / this.pageSize + 1;
		this.startBlock = (this.p - 1) / this.blockSize * this.blockSize + 1;
		this.finishBlock = this.startBlock + (this.blockSize - 1);
		
		//list 계산
		if(this.isSearch()) {
			this.list = noticeDao.searchByRownum(column, keyword, begin, end);
		}
		else {
			//this.list = boardDao.listByRownum(begin, end);//일반
			this.list = noticeDao.listByTreeSort(begin, end);//계층형
		}
	}
	public int getPage() {
		return p;
	}
	public int getCount() {
		return count;
	}
	public String getColumn() {
		return column;
	}
	public String getKeyword() {
		return keyword;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public int getBegin() {
		return begin;
	}
	public int getEnd() {
		return end;
	}
	public int getStartBlock() {
		return startBlock;
	}
	public int getFinishBlock() {
		return finishBlock;
	}
	public int getLastBlock() {
		return lastBlock;
	}
	
	//추가 : 이전이 존재하나요?
	public boolean isPreviousAvailable() {
		return this.startBlock > 1;
	}
	//추가 : 다음이 존재하나요?
	public boolean isNextAvailable() {
		return this.finishBlock < this.lastBlock; 
	}
	//추가 : 검색모드인가요?
	public boolean isSearch() {
		return this.column != null && !this.column.equals("") && this.keyword != null && !this.keyword.equals("");
	}
	//추가 : 진짜 마지막 블록 번호 반환
	public int getRealLastBlock() {
		return Math.min(this.finishBlock, this.lastBlock);
	}
	//추가 : 이전을 누르면 나오는 블록 번호
	public int getPreviousBlock() {
		return this.startBlock - 1;
	}
	//추가 : 다음을 누르면 나오는 블록 번호
	public int getNextBlock() {
		return this.finishBlock + 1;
	}
	//추가 : 컬럼이 특정 값인지 검사
	public boolean columnIs(String column) {
		return this.column != null && this.column.equals(column);
	}
	//추가 : null을 제거한 keyword 반환 메소드
	public String getKeywordString() {
		if(this.keyword == null) 
			return "";
		else
			return this.keyword;
	}
	
	@Override
	public String toString() {
		return "Pagination [p=" + p + ", count=" + count + ", column=" + column + ", keyword=" + keyword + ", pageSize="
				+ pageSize + ", blockSize=" + blockSize + ", begin=" + begin + ", end=" + end + ", startBlock="
				+ startBlock + ", finishBlock=" + finishBlock + ", lastBlock=" + lastBlock + "]";
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public List<NoticeDto> getList() {
		return list;
	}
}

