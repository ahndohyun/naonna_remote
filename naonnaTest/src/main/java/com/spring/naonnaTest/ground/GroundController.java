package com.spring.naonnaTest.ground;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	
	@RequestMapping(value = "/ground_detail.do", method = RequestMethod.GET)
	public ModelAndView That_Ground_Info(GroundVO vo) {
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
	
	@RequestMapping(value = "/insertGround.do", method = RequestMethod.POST)
	public ModelAndView Insert_Ground_Info(GroundVO vo ,MultipartHttpServletRequest multiRequest , HttpServletResponse response)  throws Exception {
		  MultipartFile mf1 = multiRequest.getFile("imgfile1");
		  MultipartFile mf2 = multiRequest.getFile("imgfile2");
		  MultipartFile mf3 = multiRequest.getFile("imgfile3");
		  
	      String uploadPath = "C:\\BigDeep\\upload\\";
	      
	      String originalFileExtension = mf1.getOriginalFilename().substring(mf1.getOriginalFilename().lastIndexOf("."));
	      String storedFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      String storedFileName3= UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
	      System.out.println("storedFileName1 : " + storedFileName1);
	      System.out.println("storedFileName2 : " + storedFileName2);
	      System.out.println("storedFileName3 : " + storedFileName3);
	    
	      if(mf1.getSize() != 0) {
	         //mf.transferTo(new File(uploadPath+ "/" + mf.getOriginalFilename()));
	         mf1.transferTo(new File(uploadPath + storedFileName1));
	      }
	      if(mf2.getSize() != 0) {
		         //mf.transferTo(new File(uploadPath+ "/" + mf.getOriginalFilename()));
		         mf2.transferTo(new File(uploadPath + storedFileName2));
		      }
	      if(mf3.getSize() != 0) {
		         //mf.transferTo(new File(uploadPath+ "/" + mf.getOriginalFilename()));
		         mf3.transferTo(new File(uploadPath + storedFileName3));
		      }
	      
	      
	      //vo.setPhoto(storedFileName);
	      vo.setPhoto1(storedFileName1);
	      vo.setPhoto2(storedFileName2);
	      vo.setPhoto3(storedFileName3);
	      
		System.out.println("Groundphoto in ");
		
		groundService.insertGround(vo);
		
		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_search");
		System.out.println("추가 complete??");
		return result;
		
		
	}
	
	/*@RequestMapping("/insertGround2.do")
	public ModelAndView Insert_Ground_Info2(GroundVO vo) {
		System.out.println("찾아감?");
		
		HashMap<String, String> map = new HashMap<String, String>(); 
		  map.put("ground_Name", vo.getGround_Name()); 
		  map.put("ground_addr;", vo.getGround_addr()); 
		  map.put("ground_city;", vo.getGround_city());
		  map.put("grass",vo.getGrass());
		  map.put("shower",vo.getShower()); 
		  map.put("parking", vo.getParking() ); 
		  map.put("light", vo.getLight());
		  map.put("week_morning", vo.getWeek_morning() );
		  map.put("week_evening;",vo.getWeek_evening()); 
		  map.put("weekend_morning" ,vo.getWeekend_morning()); 
		  map.put("weekend_evening" ,vo.getWeekend_evening());
		  map.put("review",vo.getReview() );
		  map.put("rule",vo.getRule() );
		  map.put("ground_people",vo.getGround_people() );
		  map.put("ground_size", vo.getGround_size());
		  groundService.insertGround(vo);
		
		
		
		ModelAndView result = new ModelAndView();
		result.addObject("vo", vo);
		result.setViewName("ground_search");
		System.out.println("추가 complete??");
		return result;
		
		
	}
	*/
	 /* @RequestMapping("/fileUpload1")
	   public ModelAndView fileUpload1(HttpServletRequest request, RequestModel model) throws Exception{
	      MultipartFile mf = model.getFile();
	      
	      String uploadPath = "C:\\BigDeep\\upload\\";
	      
	      String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));// 마지막 .을 기준으로 파일명을 분리
	      String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension; //하이픈을 공백으로 바꾸고 + 확장자
	      
	      //지정한 주소에 파일 저장
	      if(mf.getSize() != 0) {
	         mf.transferTo(new File(uploadPath+storedFileName));// -> 업로드가 된다
	      }
	      
	      ModelAndView mav = new ModelAndView();
	      mav.setViewName("download");
	      mav.addObject("name", model.getName());
	      mav.addObject("paramName", mf.getName());
	      mav.addObject("fileName", mf.getOriginalFilename());
	      mav.addObject("fileSize", mf.getSize());
	      
	      //스프링은 기본적으로 분자처리 방식으로 utf-8을 사용하므로
	      //서버에 업로드된 한들 파일을 다운로드 하기 위해서 utf-8로 엔코딩 한다.         //화면에 보여줄떄 밑에                                                                                                //저장될 떄?
	      String downlink = "fileDownload?of="+URLEncoder.encode(storedFileName, "UTF-8") + "&of2=" + URLEncoder.encode(mf.getOriginalFilename(), "UTF-8");
	      mav.addObject("downlink", downlink);
	      
	      return mav;
	      
	   }
	
	*/
	
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
	
	
	   

}