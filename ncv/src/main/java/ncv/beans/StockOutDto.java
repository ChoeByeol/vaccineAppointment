package ncv.beans;

import java.sql.Date;

public class StockOutDto {

	private int stockOutNo;
	private int vaccineNo;
	private int clinicNo;
	private int stockOutQty;
	private Date stockOutTime;
	
	public StockOutDto() {
		super();
	}
	public int getStockOutNo() {
		return stockOutNo;
	}
	public void setStockOutNo(int stockOutNo) {
		this.stockOutNo = stockOutNo;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public int getClinicNo() {
		return clinicNo;
	}
	public void setClinicNo(int clinicNo) {
		this.clinicNo = clinicNo;
	}
	public int getStockOutQty() {
		return stockOutQty;
	}
	public void setStockOutQty(int stockOutQty) {
		this.stockOutQty = stockOutQty;
	}
	public Date getStockOutTime() {
		return stockOutTime;
	}
	public void setStockOutTime(Date stockOutTime) {
		this.stockOutTime = stockOutTime;
	}
	
	
}
