package ncv.beans;

public class VaccineDto {
	
	private int vaccineNo;
	private String vaccinePlatform;
	private String vaccineName;
	private String vaccineValue;
	private String vaccineCompany;
	private int vaccineAge;
	private String vaccineComposition;
	private int vaccineShot;
	private String vaccineInterval;
	private String vaccineMethod;
	private String vaccineKeep;
	private String vaccineExpire;
	private String vaccineLife;
	
	public VaccineDto() {
		super();
	}
	public String getVaccinePlatform() {
		return vaccinePlatform;
	}
	public void setVaccinePlatform(String vaccinePlatform) {
		this.vaccinePlatform = vaccinePlatform;
	}
	public int getVaccineNo() {
		return vaccineNo;
	}
	public void setVaccineNo(int vaccineNo) {
		this.vaccineNo = vaccineNo;
	}
	public String getVaccineName() {
		return vaccineName;
	}
	public void setVaccineName(String vaccineName) {
		this.vaccineName = vaccineName;
	}
	public String getVaccineValue() {
		return vaccineValue;
	}
	public void setVaccineValue(String vaccineValue) {
		this.vaccineValue = vaccineValue;
	}
	public String getVaccineCompany() {
		return vaccineCompany;
	}
	public void setVaccineCompany(String vaccineCompany) {
		this.vaccineCompany = vaccineCompany;
	}
	public int getVaccineAge() {
		return vaccineAge;
	}
	public void setVaccineAge(int vaccineAge) {
		this.vaccineAge = vaccineAge;
	}
	public String getVaccineComposition() {
		return vaccineComposition;
	}
	public void setVaccineComposition(String vaccineComposition) {
		this.vaccineComposition = vaccineComposition;
	}
	public int getVaccineShot() {
		return vaccineShot;
	}
	public void setVaccineShot(int vaccineShot) {
		this.vaccineShot = vaccineShot;
	}
	public String getVaccineInterval() {
		if(vaccineInterval == null) {
			return "";
		}
		else {
			return vaccineInterval;
		}
	}
	public void setVaccineInterval(String vaccineInterval) {
		this.vaccineInterval = vaccineInterval;
	}
	public String getVaccineMethod() {
		return vaccineMethod;
	}
	public void setVaccineMethod(String vaccineMethod) {
		this.vaccineMethod = vaccineMethod;
	}
	public String getVaccineKeep() {
		return vaccineKeep;
	}
	public void setVaccineKeep(String vaccineKeep) {
		this.vaccineKeep = vaccineKeep;
	}
	public String getVaccineExpire() {
		return vaccineExpire;
	}
	public void setVaccineExpire(String vaccineExpire) {
		this.vaccineExpire = vaccineExpire;
	}
	public String getVaccineLife() {
		return vaccineLife;
	}
	public void setVaccineLife(String vaccineLife) {
		this.vaccineLife = vaccineLife;
	}
	@Override
	public String toString() {
		return "VaccineDto [vaccineNo=" + vaccineNo + ", vaccineShot=" + vaccineShot + "]";
	}
	
}

