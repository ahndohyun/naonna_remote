package com.spring.naonnaTest.user;

public interface UserService {
	
	UserVO distMember(String forPerson);
	void insertUser(UserVO vo);
	UserVO printUser(String forPerson);
}
