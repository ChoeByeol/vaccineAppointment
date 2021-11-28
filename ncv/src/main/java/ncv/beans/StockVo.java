package ncv.beans;

public class StockVo {
	
	private String vaccineName;
	private int stockInQty;
	private int stockOutQty;
	private int totalStock;
	
	public StockVo() {
		super();
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public int getStockInQty() {
		return stockInQty;
	}
	public void setStockInQty(int stockInQty) {
		this.stockInQty = stockInQty;
	}
	public int getStockOutQty() {
		return stockOutQty;
	}
	public void setStockOutQty(int stockOutQty) {
		this.stockOutQty = stockOutQty;
	}
	public int getTotalStock() {
		return totalStock;
	}
	public void setTotalStock(int totalStock) {
		this.totalStock = totalStock;
	}
	
}
