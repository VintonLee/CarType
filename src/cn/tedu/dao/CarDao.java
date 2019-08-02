package cn.tedu.dao;

import java.util.List;


import cn.tedu.entity.Car;
import cn.tedu.entity.CarCount;
import cn.tedu.entity.CarOrderByAge;
import cn.tedu.entity.CarSearch;
import cn.tedu.entity.CityCountJson;

public interface CarDao {	
	public List<Car> findAll();
	public List<CarCount> findByType_bj();
	public List<CarCount> findByType_tj();
	public List<CarCount> findByType_sh();
	public List<CarCount> findByType_cq();
	public List<CityCountJson> findAllFromCity();
	public List<CarOrderByAge> findAllFromAge00();
	public List<CarOrderByAge> findAllFromAge90();
	public List<CarOrderByAge> findAllFromAge80();
	public List<Car> searchIndexAndPrice(CarSearch carSearch);
	public List<Car> search(CarSearch carSearch);
	public List<Car> searchQiTa();
	public List<Car> searchQiTaAndPrice(CarSearch carSearch);
	public List<Car> searchAndPrice(CarSearch carSearch);
}
