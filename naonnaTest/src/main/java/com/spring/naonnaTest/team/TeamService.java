package com.spring.naonnaTest.team;

import java.util.ArrayList;




public interface TeamService {
	
	ArrayList<TeamVO> getTeamlistJson(TeamVO teamvo);
	ArrayList<TeamVO> getTeamfindson(TeamVO teamvo);
	public void insertTeam(TeamVO teamvo);

}
