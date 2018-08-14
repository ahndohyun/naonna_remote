package com.spring.naonnaTest.matching;

import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MatchingController {

	@Autowired
	private MatchingService matchingService;
	
	@RequestMapping(value = "/print_matching.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String MatchingGET() {

		ArrayList<MatchingVO> list = matchingService.getMatching();
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
	
	
	@RequestMapping(value = "/searchMatching.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String MatchingSearchGET(MatchingVO vo) {
		ArrayList<MatchingVO> list = matchingService.getMatchingSearch(vo);
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
	
	@RequestMapping(value = "/makeMatch.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public ModelAndView makeMatch(MatchingVO vo) {
		matchingService.makeMatching(vo);
		ModelAndView mnv = new ModelAndView();
		ObjectMapper mapper = new ObjectMapper();
		
		System.out.println(vo.getPeople());
		System.out.println(vo.getHomeTeam());
		System.out.println(vo.getPlayDate());
		System.out.println(vo.getMatchingID());
		System.out.println(vo.getMatchLocation());
		
		try {
			mnv.addObject("matchingVO", vo);
			mnv.setViewName("matching_search");

		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
	
		return mnv;
	}
	
}
