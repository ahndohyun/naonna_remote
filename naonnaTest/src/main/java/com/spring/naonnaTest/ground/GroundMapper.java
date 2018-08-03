package com.spring.naonnaTest.ground;

import java.util.ArrayList;
import java.util.HashMap;

public interface GroundMapper {

	ArrayList<GroundVO> getGroundList();
	ArrayList<GroundVO> MapperFromDAO(GroundVO vo);
	ArrayList<GroundVO> MapperFromTime(HashMap map);
	ArrayList<GroundVO> getThatGroundList();
}
