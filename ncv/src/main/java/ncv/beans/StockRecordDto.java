package ncv.beans;

public class StockRecordDto {
	private int stockNo;
	private int vaccineNo;
	private int quantity;
	
	public StockRecordDto() {
		super();
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
