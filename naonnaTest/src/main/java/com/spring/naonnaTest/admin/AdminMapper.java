package com.spring.naonnaTest.admin;

public interface AdminMapper {

	int insertAdmin(AdminVO vo);
	String userCheck(AdminVO vo);
	int isAdmin(AdminVO vo);
	AdminVO getAdminInfo(AdminVO vo);
	
}
