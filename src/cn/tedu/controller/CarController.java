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
	
	//19��ȫ���ص�ʡ����ֳ��г�����
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

	
	//�Ӵ˴���ת��Ĭ�ϵı�����Ϣҳ��
	@RequestMapping("/type.do")
	public String hello(Model model){
		return "redirect:type_bj.do";
	}
	
	//��ѯ����������Ʒ�Ƶ�ռ��  ��Ĭ��չʾ�ģ�
	@RequestMapping("/type_bj.do")
	public String test(Model model){
		List<CarCount> carList =cardao.findByType_bj();
		model.addAttribute("carlist", carList);
		System.out.println("type_bj.do");
		return "type";
	}
	
	//��ѯ��������Ʒ�Ƶ�ռ��
	@RequestMapping("/type_tj.do")
	public String type_tj(Model model){
		List<CarCount> carList = cardao.findByType_tj();
		model.addAttribute("carlist", carList);
		System.out.println("type_tj.do");
		return "type";
	}
	
	//��ѯ�Ϻ�������Ʒ�Ƶ�ռ��
	@RequestMapping("/type_sh.do")
	public String type_sh(Model model){
		List<CarCount> carList = cardao.findByType_sh();
		model.addAttribute("carlist", carList);
		System.out.println("type_sh.do");
		return "type";
	}
	//��ѯ���������Ʒ�Ƶ�ռ��
	@RequestMapping("/type_cq.do")
	public String type_cq(Model model){
		List<CarCount> carList = cardao.findByType_cq();
		model.addAttribute("carlist", carList);
		System.out.println("type_cq.do");
		return "type";
	}
	
	//�鿴��������ε��˶Զ��ֳ�������
	@RequestMapping("/carByAge.do")
	public String carByAge(String age , Model model) {
		System.out.println(age.toString());
		List<CarOrderByAge> carlist;
		//Ĭ�ϲ�ѯ00
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
			carsearch.setCarname("����");
			
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
			carsearch.setCarname("����");
			
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
			carsearch.setCarname("����");
			
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
		
		
		
		//����ѯҳ�� ��ѯ�۸� ��������
		if (low != null || high != null) {
			carsearch.setHigh(Integer.parseInt(high));
			carsearch.setLow(Integer.parseInt(low));
			carlist = cardao.searchIndexAndPrice(carsearch);
			model.addAttribute("car", carlist);
			return "carsearch/searchIndex";
		}
		//����ѯҳ�� ����
		carlist = cardao.findAll();
		model.addAttribute("car", carlist);
		return "carsearch/searchIndex";
	}
	
	
	
	
	
	
//	//Ĭ��ҳ�棬19��ȫ���ص�ʡ����ֳ��г�����
//	@RequestMapping("/json.do")
//	public String json(Model model) {
//		List<CityCountJson> list = cardao.findAllFromCity();
//		//��note���󼯺�ת��json���飨��̬������
//				JSONArray json = JSONArray.fromObject(list);
////				System.out.println(json);
//				String json_str = json.toString();
////				System.out.print(json_str);
//		String cityjson = json.toString();
//		System.out.println(cityjson);
//		model.addAttribute("cityjson", cityjson);
//	    return "json";
//	}
	

	/*	//��ѯĳһ��ʡ�������Ʒ�Ƶ�ռ��
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
//	@ResponseBody//��ע�ⲻ��ʡ�� ����ajax�޷����ܷ���ֵ
//	public String ajax(HttpServletRequest request){
//		System.out.println(111);
//		System.out.println(request.getParameter("name"));
//		return "hello!!!!!!!!";
//	}
	
/*	@RequestMapping("/ajax.do")
	@ResponseBody//��ע�ⲻ��ʡ�� ����ajax�޷����ܷ���ֵ
	public String ajax(String name){
		
		System.out.println(name);
		return "hello!!!!!!!!";
	}*/
	

	
	
	
}
