package cn.tedu.entity;

public class CarSearch {
	public String carname;
	public Integer low;
	public Integer high;
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public Integer getLow() {
		return low;
	}
	public void setLow(Integer low) {
		this.low = low;
	}
	public Integer getHigh() {
		return high;
	}
	public void setHigh(Integer high) {
		this.high = high;
	}
	@Override
	public String toString() {
		return "CarSearch [carname=" + carname + ", low=" + low + ", high=" + high + "]";
	}
	
}
