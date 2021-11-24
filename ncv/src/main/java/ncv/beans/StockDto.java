package ncv.beans;

public class StockDto {
	
	private int stockNo;
	private int clinicNo;
	private String stockDate;
	private String StockType;
	private int vaccineNo;
	private int quantity;
	public StockDto() {
		super();
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public int getClinicNo() {
		return clinicNo;
	}
	public void setClinicNo(int clinicNo) {
		this.clinicNo = clinicNo;
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
	

