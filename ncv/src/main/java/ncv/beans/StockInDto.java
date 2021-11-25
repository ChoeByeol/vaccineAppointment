package ncv.beans;

import java.sql.Date;

public class StockInDto {
	
	private int stockInNo;
	private int vaccineNo;
	private int clinicNo;
	private int stockInQty;
	private Date stockInTime;
	
	public StockInDto() {
		super();
	}

	public int getStockInNo() {
		return stockInNo;
	}

	public void setStockInNo(int stockInNo) {
		this.stockInNo = stockInNo;
	}

	public int getStockInQty() {
		return stockInQty;
	}

	public void setStockInQty(int stockInQty) {
		this.stockInQty = stockInQty;
	}

	public int getClinicNo() {
		return clinicNo;
	}
	public void setClinicNo(int clinicNo) {
		this.clinicNo = clinicNo;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public Date getStockInTime() {
		return stockInTime;
	}
	public void setStockInTime(Date stockInTime) {
		this.stockInTime = stockInTime;
	}

}
	

