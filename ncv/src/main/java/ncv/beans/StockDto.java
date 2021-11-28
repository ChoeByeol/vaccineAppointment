package ncv.beans;

import java.sql.Date;

public class StockDto {
	
	private int stockNo;
	private int vaccineNo;
	private int clinicNo;
	private int stockInQty;
	private int stockOutQty;
	private Date updateTime;
	
	public StockDto() {
		super();
	}

	public int getStockNo() {
		return stockNo;
	}

	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
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

	public int getStockOutQty() {
		return stockOutQty;
	}

	public void setStockOutQty(int stockOutQty) {
		this.stockOutQty = stockOutQty;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	

}
	

