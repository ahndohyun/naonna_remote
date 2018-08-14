package com.spring.naonnaTest.admin;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value="joinAdmin.do" , method = RequestMethod.POST)
	public String insert_Admin (AdminVO vo, HttpServletResponse response ) throws Exception {	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		/*String count = adminService.isAdmin(vo);
		if (count == "abc" )
		{
			out.println("<script>");
			out.println("alert('관리자 PIN번호 통과.');");
			out.println("</script>");			
			out.close();
			
			
		}
		else
		{
			out.println("<script>");
			out.println("alert('PIN번호 틀림 확인바랍니다.');");
			out.println("location.href='../home.do';");
			out.println("</script>");
			out.close();
						
		}*/
		
		int check = adminService.insertAdmin(vo);	
		
		System.out.println("check :"+ check);
		
		if(check == 1) {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다.');");
			out.println("alert('로그인 해주세요.');");
			out.println("location.href='home.do';");
			out.println("</script>");			
			out.close();
			
		}else {
			out.println("<script>");
			out.println("alert('회원가입이 실패했습니다.다시 가입해주세요');");
			out.println("location.href='home.do';");
			out.println("</script>");			
			out.close();
		}
		

		return null;
		
	}
	
	@RequestMapping(value="login_a.do" , method = RequestMethod.POST)
	public String AdminLogin(AdminVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = adminService.userCheck(vo);
		if(check ==1 ) {
			
			AdminVO adminvo = adminService.getAdminInfo(vo);
			session.setAttribute("admin", adminvo.getGround_admin());
			session.setAttribute("groundName", adminvo.getGround_name());
			out.println("<script>");
			out.println("location.href='manager.do'");
			out.println("</script>"); 
			
			/*if(adminService.isAdmin(vo)) {
				session.setAttribute("admin", adminvo.getGround_admin());
				session.setAttribute("groundName", adminvo.getGround_name());
				out.println("<script>");
				out.println("location.href='..manager.do'");
				out.println("</script>"); 
			}else{
				out.println("<script>");
  				out.println("location.href='..home.do '");
  				out.println("</script>"); 
			}*/
		}
		else if(check == 0){
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다. 다시 로그인해주세요.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else{
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		return null;
		
		
	}
		
	
	@RequestMapping("idcheck.do")
    @ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String admin) {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = adminService.idcheck(admin);
        map.put("cnt", count);
 
        return map;
    }
	
		

}
