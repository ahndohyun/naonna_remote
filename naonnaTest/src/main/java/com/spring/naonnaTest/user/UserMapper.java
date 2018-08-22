package com.spring.naonnaTest.user;

import com.spring.naonnaTest.team.TeamVO;

public interface UserMapper {
	
	UserVO getUserInfo(String forPerson);
	void insertUserInfo(UserVO vo);
	UserVO myUserInfo(String nickname);
	void updateInfo(UserVO vo);
	void updateProfile(UserVO vo);
	int getUserNick(String nickname);

}
