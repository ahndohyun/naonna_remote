package com.spring.naonnaTest.user;

public interface UserMapper {
	
	UserVO getUserInfo(String forPerson);
	void insertUserInfo(UserVO vo);
	
}
