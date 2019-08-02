package cn.tedu.entity;

public class CarCount {
	public String type;
	public Integer count;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "CarCount [type=" + type + ", count=" + count + "]";
	}
	
	
}
