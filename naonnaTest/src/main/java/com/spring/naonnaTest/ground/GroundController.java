package com.spring.naonnaTest.ground;

import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GroundController {

	@Autowired
	private GroundService groundService;
		
	@RequestMapping(value = "/getGroundJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String GroundJSONGET() {
		ArrayList<GroundVO> list = groundService.getGroundJson();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/filter_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_DAO_JSON(GroundVO vo) {
		ArrayList<GroundVO> list = groundService.Ground_DAO_Json(vo);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/time_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_Time_JSON(GroundVO groundvo, BookingVO bookingvo) {
		System.out.println("bookingvo.getGameDate() = " + bookingvo.getStartTime());
		System.out.println("bookingvo.getGameTime() = " + bookingvo.getAssign());
		System.out.println("bookingvo.getEndTime()" + bookingvo.getEndTime());
//		bookingvo.setEndTime(endTime);
		
		ArrayList<GroundVO> list = groundService.Ground_Time_Json(groundvo, bookingvo);

		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	/*@RequestMapping(value = "/ground_detail.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String That_Ground_Info_JSON(GroundVO vo) {
		
		ArrayList<GroundVO> getThatGroundList = groundService.That_Ground_Info_JSON(vo);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(getThatGroundList);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	
	
	}*/
	
	
	@RequestMapping("/ground_detail.do")
	public ModelAndView That_Ground_Info(GroundVO vo, String ground_Name) {
		String Ground_Name = vo.getGround_Name();
		System.out.println("Ground_Name = " + Ground_Name);
		vo = groundService.That_Ground_Info(Ground_Name);
		System.out.println("ground_detail complete");

		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_detail");
		System.out.println("불러오기  complete??");
		return result;
		
	
}

}