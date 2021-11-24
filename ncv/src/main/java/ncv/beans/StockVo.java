package ncv.beans;

public class StockVo {
	private String vaccineName;
	private int quantity;
	private String stockDate;
	private String StockType;
	public StockVo() {
		super();
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getStockDate() {
		return stockDate;
	}
	public void setStockDate(String stockDate) {
		this.stockDate = stockDate;
	}
	public String getStockType() {
		return StockType;
	}
	public void setStockType(String stockType) {
		StockType = stockType;
	}
}
