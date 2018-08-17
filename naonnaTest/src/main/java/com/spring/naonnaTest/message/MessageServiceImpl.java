package com.spring.naonnaTest.message;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired(required=false) 		//@Autowired는 필드 생성자 메소드에 사용 가능
	private MessageDAO messageDAO = null;		//new UserDAO()객체가 자동으로 생성되어서 대입된다.
	
	public void playerToMatch(MessageVO vo) {
		try {
			messageDAO.matchMessage(vo);
		}
		catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

	}
	
	public int countMessage(String nickname) {
		int count = 0;
		
		try {
			MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
			count = messageMapper.countMsg(nickname);
		}
		catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		return count;

	}
	
	public ArrayList<MessageVO> printMessage(String nickname) {
		ArrayList<MessageVO> list = null;
		
		try {
			MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
			list = messageMapper.printMsg(nickname);
		}
		catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}
		
		return list;

	}
	
}
