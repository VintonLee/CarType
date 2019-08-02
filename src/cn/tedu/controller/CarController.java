package cn.tedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.tedu.dao.CarDao;
import cn.tedu.entity.Car;
import cn.tedu.entity.CarCount;
import cn.tedu.entity.CarOrderByAge;
import cn.tedu.entity.CarSearch;
import cn.tedu.entity.CityCountJson;
import net.sf.json.JSONArray;

@Controller
public class CarController {
	
	@Resource(name="carDao")
	CarDao cardao;
	
	@RequestMapping("/car.do")
	public String index(String test){
		System.out.println("test="+test);
		System.out.println("-----------");
		return "redirect:carByAge.do?age=00";
	}
	
	//19年全国重点省会二手车市场调研
	@RequestMapping("/citycount.do")
	public String index(Model model) {
		List<CityCountJson> list = cardao.findAllFromCity();
		System.out.println("------");
		JSONArray json = JSONArray.fromObject(list);
		String cityjson = json.toString();
		System.out.println(cityjson);
		model.addAttribute("cityjson", cityjson);
	    return "citycount";
	}

	
	//从此处调转到默认的北京信息页面
	@RequestMapping("/type.do")
	public String hello(Model model){
		return "redirect:type_bj.do";
	}
	
	//查询北京各汽车品牌的占比  （默认展示的）
	@RequestMapping("/type_bj.do")
	public String test(Model model){
		List<CarCount> carList =cardao.findByType_bj();
		model.addAttribute("carlist", carList);
		System.out.println("type_bj.do");
		return "type";
	}
	
	//查询天津各汽车品牌的占比
	@RequestMapping("/type_tj.do")
	public String type_tj(Model model){
		List<CarCount> carList = cardao.findByType_tj();
		model.addAttribute("carlist", carList);
		System.out.println("type_tj.do");
		return "type";
	}
	
	//查询上海各汽车品牌的占比
	@RequestMapping("/type_sh.do")
	public String type_sh(Model model){
		List<CarCount> carList = cardao.findByType_sh();
		model.addAttribute("carlist", carList);
		System.out.println("type_sh.do");
		return "type";
	}
	//查询重庆各汽车品牌的占比
	@RequestMapping("/type_cq.do")
	public String type_cq(Model model){
		List<CarCount> carList = cardao.findByType_cq();
		model.addAttribute("carlist", carList);
		System.out.println("type_cq.do");
		return "type";
	}
	
	//查看各个年龄段的人对二手车的需求
	@RequestMapping("/carByAge.do")
	public String carByAge(String age , Model model) {
		System.out.println(age.toString());
		List<CarOrderByAge> carlist;
		//默认查询00
		carlist = cardao.findAllFromAge00();
		System.out.println("00------"+carlist);
		
		if (age.equals("90")) {
			carlist = cardao.findAllFromAge90();
			System.out.println("90------"+carlist);
		}
		if (age.equals("80")) {
			carlist = cardao.findAllFromAge80();
			System.out.println("80------"+carlist);
		}
		model.addAttribute("carlist",carlist);
		model.addAttribute("ages",age);
		
		return "first";
	}
	
	@RequestMapping("/search.do")
	public String search(String car,String low,String high,Model model) {
		
		  if(car==null || car.equals("null") || car.equals("")){
	    	  car = "";
	      }
		
		CarSearch carsearch = new CarSearch();
		List<Car> carlist;
		if (car.equals("benchicar")) {
			carsearch.setCarname("奔驰");
			
			  if(low==null || low.equals("null") || low.equals("") || high==null || high.equals("null") || high.equals("")){
				  carlist = cardao.search(carsearch);
				  model.addAttribute("benchi", carlist);
				  return "carsearch/benchicar";
		      }
			
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchAndPrice(carsearch);
			model.addAttribute("benchi", carlist);
			return "carsearch/benchicar";
		}
		if (car.equals("baomacar")) {
			carsearch.setCarname("宝马");
			
			  if(low==null || low.equals("null") || low.equals("") || high==null || high.equals("null") || high.equals("")){
				  carlist = cardao.search(carsearch);
				  model.addAttribute("baoma", carlist);
				  return "carsearch/baomacar";
		      }
			
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchAndPrice(carsearch);
			model.addAttribute("benchi", carlist);
			return "carsearch/baomacar";
		}
		if (car.equals("dazhongcar")) {
			carsearch.setCarname("大众");
			
			  if(low==null || low.equals("null") || low.equals("") || high==null || high.equals("null") || high.equals("")){
				  carlist = cardao.search(carsearch);
				  model.addAttribute("dazhong", carlist);
				  return "carsearch/dazhongcar";
		      }
			
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchAndPrice(carsearch);
			model.addAttribute("dazhong", carlist);
			return "carsearch/dazhongcar";
		}
		if (car.equals("qitacar")) {
			
			  if(low==null || low.equals("null") || low.equals("") || high==null || high.equals("null") || high.equals("")){
				  carlist = cardao.searchQiTa();
				  model.addAttribute("qita", carlist);
				  return "carsearch/qitacar";
		      }
			
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchQiTaAndPrice(carsearch);
			model.addAttribute("qita", carlist);
			return "carsearch/qitacar";
		}
		
		
		
		//主查询页面 查询价格 不限类型
		if (low != null || high != null) {
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchIndexAndPrice(carsearch);
			model.addAttribute("car", carlist);
			return "carsearch/searchIndex";
		}
		//主查询页面 不限
		carlist = cardao.findAll();
		model.addAttribute("car", carlist);
		return "carsearch/searchIndex";
	}
	
	
	
	
	
	
//	//默认页面，19年全国重点省会二手车市场调研
//	@RequestMapping("/json.do")
//	public String json(Model model) {
//		List<CityCountJson> list = cardao.findAllFromCity();
//		//将note对象集合转成json数组（静态方法）
//				JSONArray json = JSONArray.fromObject(list);
////				System.out.println(json);
//				String json_str = json.toString();
////				System.out.print(json_str);
//		String cityjson = json.toString();
//		System.out.println(cityjson);
//		model.addAttribute("cityjson", cityjson);
//	    return "json";
//	}
	

	/*	//查询某一个省会各汽车品牌的占比
	@RequestMapping("/hello.do")
	public String hello(Model model){
		List<Car> carList =cardao.findAll();
		model.addAttribute("carlist", carList);
		return "hello";
	}*/
	
//	@RequestMapping("/h.do")
//	public String test_hello(){
//		System.out.println(2);
//		return "hello";
//	}
//	
//	@RequestMapping("/ajax.do")
//	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
//	public String ajax(HttpServletRequest request){
//		System.out.println(111);
//		System.out.println(request.getParameter("name"));
//		return "hello!!!!!!!!";
//	}
	
/*	@RequestMapping("/ajax.do")
	@ResponseBody//此注解不能省略 否则ajax无法接受返回值
	public String ajax(String name){
		
		System.out.println(name);
		return "hello!!!!!!!!";
	}*/
	

	
	
	
}
