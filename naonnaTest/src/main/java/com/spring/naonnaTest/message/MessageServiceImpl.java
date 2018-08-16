package com.spring.naonnaTest.message;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("messageService")
public class MessageServiceImpl implements MessageService{
	
	@Autowired
	private SqlSession sqlSession;
	
	public void playerToMatch(MessageVO vo) {
		try {
			MessageMapper messageMapper = sqlSession.getMapper(MessageMapper.class);
			messageMapper.playerMSG(vo);
		}
		catch(Exception e) {
			e.printStackTrace();
			e.getMessage();
		}

	}
	
}
