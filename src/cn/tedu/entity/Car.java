package cn.tedu.entity;

public class Car {
	public String carname;
	public String carinfo;
	public String carlc;
	public String carpailiang;
	public String carbsx;
	public String caryear;
	public String price;
	public String getCarbsx() {
		return carbsx;
	}
	public void setCarbsx(String carbsx) {
		this.carbsx = carbsx;
	}
	public String getCaryear() {
		return caryear;
	}
	public void setCaryear(String caryear) {
		this.caryear = caryear;
	}

	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public String getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	public String getCarlc() {
		return carlc;
	}
	public void setCarlc(String carlc) {
		this.carlc = carlc;
	}
	public String getCarpailiang() {
		return carpailiang;
	}
	public void setCarpailiang(String carpailiang) {
		this.carpailiang = carpailiang;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Car [carname=" + carname + ", carinfo=" + carinfo + ", carlc=" + carlc + ", carpailiang=" + carpailiang
				+ ", price=" + price + "]";
	}
	
	
}
