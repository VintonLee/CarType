package cn.tedu.test;


import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.dao.CarDao;
import cn.tedu.entity.Car;
import cn.tedu.entity.CarCount;
import cn.tedu.entity.CarOrderByAge;
import cn.tedu.entity.CarSearch;
import cn.tedu.entity.CityCountJson;

public class TestCase {
	private CarDao dao;
	@Before
	public void init(){
		String config="spring_car.xml";
		ApplicationContext ac=new ClassPathXmlApplicationContext(config);
		dao=ac.getBean("carDao",CarDao.class);
	}
	
	
	@Test
	public void test2(){
		List<Car> employees=dao.findAll();
		System.out.println(employees);
		
	}
	
	@Test
	public void test3(){
		List<CarCount> lists=dao.findByType_bj();
		
		for (CarCount carCount : lists) {
//			System.out.println(carCount);
			System.out.println(carCount.getType());
		}
		
//		System.out.println(lists);
	}
	
	@Test
	public void test4(){
		List<CityCountJson> employees=dao.findAllFromCity();
		System.out.println(employees);
	}
	
	@Test
	public void test5(){
		List<CarOrderByAge> employees=dao.findAllFromAge00();
		System.out.println(employees);
	}
	
	@Test
	public void test6(){
		CarSearch carSearch = new CarSearch();
		carSearch.setCarname("´óÖÚ");
		carSearch.setLow(5);
		carSearch.setHigh(10);
		List<Car> employees=dao.search(carSearch);
		System.out.println(employees);
		System.out.println(employees.size());
	}
	
	@Test
	public void test7(){
		String s = null;
		System.out.println(Integer.parseInt(s));
	}
}
