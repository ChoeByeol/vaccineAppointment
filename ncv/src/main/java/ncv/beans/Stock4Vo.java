package ncv.beans;

//특정 병원과 특정 백신의 입고 총합을 보기 위한 Vo(병원으로 그룹화)
public class Stock4Vo {

    String clinicName;
    int stockInTotalQty;

    public Stock4Vo() {
        super();
    }
    public String getClinicName() {
        return clinicName;
    }
    public void setClinicName(String clinicName) {
        this.clinicName = clinicName;
    }
    public int getStockInTotalQty() {
        return stockInTotalQty;
    }
    public void setStockInTotalQty(int stockInTotalQty) {
        this.stockInTotalQty = stockInTotalQty;
    }

}