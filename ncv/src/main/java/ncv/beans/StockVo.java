package ncv.beans;

public class StockVo {
	private String vaccineName;
	private String clinicName;
	private int stockInQty;
	private int stockOutQty;
	private int stock;
	
	public StockVo() {
		super();
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
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
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stockInQty - stockOutQty;
	}

	
}
