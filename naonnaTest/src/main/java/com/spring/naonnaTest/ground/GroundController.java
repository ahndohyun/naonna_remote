package com.spring.naonnaTest.ground;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import oracle.jdbc.OracleBlob;

@Controller
public class GroundController {

	@Autowired
	private GroundService groundService;
		
	@RequestMapping(value = "/getGroundJSON.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String GroundJSONGET() {
		ArrayList<GroundVO> list = groundService.getGroundJson();
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/filter_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_DAO_JSON(GroundVO vo) {
		ArrayList<GroundVO> list = groundService.Ground_DAO_Json(vo);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	@RequestMapping(value = "/time_ground_dao.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String Ground_Time_JSON(GroundVO groundvo, BookingVO bookingvo) {
		System.out.println("bookingvo.getGameDate() = " + bookingvo.getStartTime());
		System.out.println("bookingvo.getGameTime() = " + bookingvo.getAssign());
		System.out.println("bookingvo.getEndTime()" + bookingvo.getEndTime());
//		bookingvo.setEndTime(endTime);
		
		ArrayList<GroundVO> list = groundService.Ground_Time_Json(groundvo, bookingvo);

		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(list);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	
	/*@RequestMapping(value = "/ground_detail.do", method = RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody			//자바 객체를 http 객체에 담아 저장하고 싶을때
	public String That_Ground_Info_JSON(GroundVO vo) {
		
		ArrayList<GroundVO> getThatGroundList = groundService.That_Ground_Info_JSON(vo);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			str = mapper.writeValueAsString(getThatGroundList);
			System.out.println("str=" + str);
		}
		catch (Exception e){
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	
	
	}*/
	
	
	@RequestMapping("/ground_detail.do")
	public ModelAndView That_Ground_Info(GroundVO vo, String ground_Name) {
		String Ground_Name = vo.getGround_Name();
		System.out.println("Ground_Name = " + Ground_Name);
		vo = groundService.That_Ground_Info(Ground_Name);
		System.out.println("ground_detail complete");

		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_detail");
		System.out.println("불러오기  complete??");
		return result;
		
	}
	
	/*//MultipartHttpservletRequest를 이용한 업로드 파일 접근
	   @RequestMapping("fileUpload2")
	   public ModelAndView fileUpload2(MultipartHttpServletRequest request) throws Exception{
	      
	      String name = request.getParameter("name");
	      MultipartFile mf = request.getFile("file");
	      
	      //String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
	      String uploadPath = "C:\\BigDeep\\upload\\"; //직접 업로드 될 위치 지정
	      
	      String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      
	      //지정한 주소에 파일 저장
	      if(mf.getSize() != 0) {
	         //mf.transferTo(new File(uploadPath="/"+mf.getoriginalFilename()));
	         mf.transferTo(new File(uploadPath+storedFileName));
	      }
	      
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("ground_detail");
	      
	      //뷰에 출력한 데이터 모델에 저장
	      mav.addObject("name", name);
	      mav.addObject("paramName", mf.getName());
	      mav.addObject("fileName", mf.getOriginalFilename());
	      mav.addObject("fileSize", mf.getSize());
	      	     	      
	      return mav;
	      
	   }*/
	
		@Override
		public void saveImage(Map<String, Object> hmap) throws SQLException {
	      System.out.println("service 부분 : " + hmap.size());
	      SearchMapper planmapper = sqlsession.getMapper(GroundMapper.class);
	      int res = planmapper.insertFile(hmap);
	      System.out.println("saveImage 성공여부: " + res);
	      //sqlsession.insert("sqlsession.saveImage", hmap);
	      
	      
	   }
	
	   
	   @RequestMapping(value = "getByteImage.search")
	   public ResponseEntity<byte[]> getByteImage() {
	      System.out.println("response 왓니?");
	      Map<String, Object> map = searchService.getByteImage();
	      OracleBlob blob = (OracleBlob)map.get("IMG");
	      System.out.println("blob : " + blob);
	      try {
	         byte[] imageContent = blob.getBytes(1l, (int)blob.length());
	         blob.free();
	         System.out.println("imageContent22 왓니? : " + imageContent.toString());
	         final HttpHeaders headers = new HttpHeaders();
	         headers.setContentType(MediaType.IMAGE_PNG);
	         return new ResponseEntity<byte[]>(imageContent, headers, HttpStatus.OK);
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return null;
	   }

}