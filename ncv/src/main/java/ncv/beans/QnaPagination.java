package ncv.beans;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class QnaPagination {
	//필수 데이터
	private int p;
	private int count;
	
	//선택 데이터
	private String column;
	private String keyword;
	
	//생성자들 이용하여 필수 데이터를 설정하도록 구현
	public QnaPagination(HttpServletRequest req) {
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
	private List<QnaDto> list;
	public void calculate() throws Exception {
		//count 계산
		QnaDao qnaDao = new QnaDao();
		if(isSearch()) {
			this.count = qnaDao.count(column, keyword);
		}
		else {
			this.count = qnaDao.count();
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
			this.list = qnaDao.searchByRownum(column, keyword, begin, end);
		}
		else {
			this.list = qnaDao.listByRownum(begin, end);
		}
	}
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getColumn() {
		return column;
	}

	public void setColumn(String column) {
		this.column = column;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartBlock() {
		return startBlock;
	}

	public void setStartBlock(int startBlock) {
		this.startBlock = startBlock;
	}

	public int getFinishBlock() {
		return finishBlock;
	}

	public void setFinishBlock(int finishBlock) {
		this.finishBlock = finishBlock;
	}

	public int getLastBlock() {
		return lastBlock;
	}

	public void setLastBlock(int lastBlock) {
		this.lastBlock = lastBlock;
	}

	public List<QnaDto> getList() {
		return list;
	}

	public int getPageSize() {
		return pageSize;
	}

	public int getBlockSize() {
		return blockSize;
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
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	@Override
	public String toString() {
		return "MemberPagination [p=" + p + ", count=" + count + ", column=" + column + ", keyword=" + keyword
				+ ", pageSize=" + pageSize + ", blockSize=" + blockSize + ", begin=" + begin + ", end=" + end
				+ ", startBlock=" + startBlock + ", finishBlock=" + finishBlock + ", lastBlock=" + lastBlock + "]";
	}
}
