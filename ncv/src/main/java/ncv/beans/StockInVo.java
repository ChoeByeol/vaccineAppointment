package ncv.beans;

public class StockInVo {

	private int stockInNo;
	private String vaccineName;
	private String clinicName;
	private int stockInQty;
	
	public StockInVo() {
		super();
	}
	public int getStockInNo() {
		return stockInNo;
	}
	public void setStockInNo(int stockInNo) {
		this.stockInNo = stockInNo;
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
	
	
	
}
