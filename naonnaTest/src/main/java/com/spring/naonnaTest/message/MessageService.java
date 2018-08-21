package com.spring.naonnaTest.message;

import java.util.ArrayList;

public interface MessageService {

	public void playerToMatch(MessageVO vo);
	public int countMessage(String nickname);
	ArrayList<MessageVO> printMessage(String nickname);
	public void joinTeamMSG(MessageVO vo);
	
}
