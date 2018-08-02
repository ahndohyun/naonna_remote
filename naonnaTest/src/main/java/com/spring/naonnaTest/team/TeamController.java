package com.spring.naonnaTest.team;

import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TeamController {
	
	@Autowired
	private TeamService teamService;
		
	@RequestMapping(value = "/getTeamlistJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			
	public String TeamlistJSONGET(TeamVO teamvo) {
		ArrayList<TeamVO> list = teamService.getTeamlistJson(teamvo);
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
	
	@RequestMapping(value = "/getTeamfindJSON.do",  method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody		 	
	public String TeamfindJSONGET(TeamVO teamvo) {
		ArrayList<TeamVO> list = teamService.getTeamfindson(teamvo);
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

}
