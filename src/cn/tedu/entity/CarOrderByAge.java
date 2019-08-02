package cn.tedu.entity;

public class CarOrderByAge {
	public String carname;
	public Integer count;
	public Integer age;
	public String price;
	public String carinfo;
	public String img;
	
	
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getCarname() {
		return carname;
	}
	public void setCarname(String carname) {
		this.carname = carname;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "CarOrderByAge [carname=" + carname + ", count=" + count + ", age=" + age + ", price=" + price
				+ ", carinfo=" + carinfo + ", img=" + img + "]";
	}

	
}


