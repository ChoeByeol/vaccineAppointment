package ncv.beans;

public class Stock2Vo {
	
	private String clinicName;
	private int stockInQty;
	private int stockOutQty;
	private int totalStock;
	
	public Stock2Vo() {
		super();
	}
	public String getClinicName() {
		return clinicName;
	}
	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
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
