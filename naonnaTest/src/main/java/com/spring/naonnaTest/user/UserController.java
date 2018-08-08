package com.spring.naonnaTest.user;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.naonnaTest.team.TeamVO;

@Controller
public class UserController {
	
	@Autowired	
	private UserService userService;
	
	@RequestMapping(value = "/distUserInfo.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	public ModelAndView go_UserDB(HttpServletRequest request, HttpSession session) {
		String forPerson = request.getParameter("kakao_Id");
		ModelAndView mnv = new ModelAndView();
		UserVO info = null;
		try {
			info = userService.distMember(forPerson);
			if(info == null) {
				mnv.setViewName("add_info");
				mnv.addObject("forPerson", forPerson);
			}
			else {
				mnv.setViewName("main");
				session.setAttribute("forPerson", forPerson);
			}
		}
	
		catch (Exception e){
			e.getMessage();
			e.printStackTrace();
		}
		
		return mnv;
	}
	
	
	@RequestMapping(value = "/insertUserForm.do", method = RequestMethod.GET, produces="application/json;charset=UTF-8")
	public ModelAndView insert_Form(String forPerson, HttpSession session) {
		System.out.println(forPerson);
		ModelAndView mNv = new ModelAndView();
		mNv.setViewName("add_info");
		mNv.addObject("forPerson", forPerson);
		System.out.println(forPerson);
		session.setAttribute("forPerson", forPerson);
		return mNv;
	}
	
	@RequestMapping(value = "/insertUserInfo.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public ModelAndView insert_User(UserVO vo, HttpSession session) {
		
		userService.insertUser(vo);
		ModelAndView mNv = new ModelAndView();
		mNv.setViewName("main");
		mNv.addObject("nickname", vo.getNickname());
		mNv.addObject("city", vo.getCity());
		mNv.addObject("email", vo.getEmail());
		mNv.addObject("forPerson", vo.getForPerson());
		mNv.addObject("age", vo.getAge());
		mNv.addObject("gender", vo.getGender());
		
		session.setAttribute("forPerson", vo.getForPerson());
		
		return mNv;
	}
	
	@RequestMapping(value = "/printUserInfo.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			
	public String PrintUserCont(String forPerson) {
		UserVO vo = userService.printUser(forPerson);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(vo);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
}
