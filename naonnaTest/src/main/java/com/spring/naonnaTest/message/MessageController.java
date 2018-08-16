package com.spring.naonnaTest.message;

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
	
}
