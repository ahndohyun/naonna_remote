package com.spring.naonnaTest.message;

import java.util.ArrayList;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MessageController {

	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "/messageToMatch.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public int msgTOmatch(MessageVO vo) {
		System.out.println(vo.getTeamName());
		System.out.println(vo.getPeople());
		System.out.println(vo.getSendPeople());
		System.out.println(vo.getMatchingID());
		
		messageService.playerToMatch(vo);
		
		return 1;
	}
	
	@RequestMapping(value = "/countMessage.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public int countMessage(String nickname) {
		int countMsg = 0;

		countMsg = messageService.countMessage(nickname);
		System.out.println("countMsg = " + countMsg);
		return countMsg;
	}
	
	@RequestMapping(value = "/printMessage.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String printMessage(String nickname) {
		ArrayList<MessageVO> list = null;

		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			list = messageService.printMessage(nickname);
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
}
