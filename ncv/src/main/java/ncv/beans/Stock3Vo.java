package ncv.beans;

import java.sql.Date;

public class Stock3Vo {

	private int stockNo;
	private String clinicName;
	private String vaccineName;
	private int stockInQty;
	private int stockOutQty;
	private Date updateTime;
	
	public Stock3Vo() {
		super();
	}
	public int getStockNo() {
		return stockNo;
	}
	public void setStockNo(int stockNo) {
		this.stockNo = stockNo;
	}
	public String getClinicName() {
		return clinicName;
	}
	public void setClinicName(String clinicName) {
		this.clinicName = clinicName;
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
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	
}
