package com.spring.naonnaTest.user;

public interface UserMapper {
	
	UserVO getUserInfo(String forPerson);
	void insertUserInfo(UserVO vo);
	UserVO myUserInfo(String nickname);
	void updateInfo(UserVO vo);
	void updateProfile(UserVO vo);
	int getUserNick(String nickname);
	
	void updateTeamName(String nickname,String team_name);

}
