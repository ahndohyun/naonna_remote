package com.spring.naonnaTest.ground;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("groundService")
public class GroundServiceImpl implements GroundService{

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired(required=false) 		//@Autowired는 필드 생성자 메소드에 사용 가능
	private GroundDAO groundDAO = null;		//new UserDAO()객체가 자동으로 생성되어서 대입된다.
	
	@Override
	public ArrayList<GroundVO> getGroundJson() {
		ArrayList<GroundVO> groundList = null;
		GroundMapper groundMapper = sqlSession.getMapper(GroundMapper.class);
		groundList = groundMapper.getGroundList();
		
		return groundList;
	}
	
	@Override
	public ArrayList<GroundVO> Ground_DAO_Json(GroundVO vo) {
		ArrayList<GroundVO> groundList = groundDAO.DAOtoMapper(vo);
		return groundList;
	}
	
	@Override
	public ArrayList<GroundVO> Ground_Time_Json(GroundVO groundvo, BookingVO bookingvo) {
		ArrayList<GroundVO> groundList = groundDAO.TimetoMapper(groundvo, bookingvo);
		return groundList;
	}
	
	/*@Override
	public ArrayList<GroundVO> That_Ground_Info_JSON(GroundVO vo){
		ArrayList<GroundVO> getThatGroundList = null;
		GroundMapper groundMapper = sqlSession.getMapper(GroundMapper.class);
		getThatGroundList = groundMapper.getGroundList();
		
		return getThatGroundList;
		
	}*/
	
	@Override
	public GroundVO That_Ground_Info(String Ground_Name){
		GroundVO ThatGroundInfo = new GroundVO();
		GroundMapper groundMapper = sqlSession.getMapper(GroundMapper.class);
		ThatGroundInfo = groundMapper.getThatGroundList(Ground_Name);
		
		return ThatGroundInfo;
	}
	
	@Override
	   public Map<String, Object> getByteImage() {
	      System.out.println("ServiceImpl 왓니?");
	      SearchMapper planmapper = sqlsession.getMapper(SearchMapper.class);
	      Map<String, Object> imgMap =  planmapper.getByteImage();
	      System.out.println("imgMap" + imgMap.size());
	      return imgMap;
	   }
}
