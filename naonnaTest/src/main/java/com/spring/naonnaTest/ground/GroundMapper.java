package com.spring.naonnaTest.ground;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public interface GroundMapper {

	ArrayList<GroundVO> getGroundList();
	ArrayList<GroundVO> MapperFromDAO(GroundVO vo);
	ArrayList<GroundVO> MapperFromTime(HashMap map);
	ArrayList<GroundVO> getThatGroundList();
	GroundVO getThatGroundList(String Ground_Name);
	
	int insertFile(Map<String, Object> hmap);
	Map<String, Object> getByteImage();
}
