package com.spring.naonnaTest.admin;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	
	@RequestMapping(value="menu_bar/joinadmin.do" , method = RequestMethod.POST)
	public String insert_Admin (AdminVO vo, HttpServletResponse response ) throws Exception {		
		int check = adminService.insertAdmin(vo);	
		
		System.out.println("check "+ check);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if(check == 1) {
			out.println("<script>");
			out.println("alert('회원가입이 완료되었습니다.');");
			out.println("alert('로그인 해주세요.');");
			out.println("location.href='../home.do';");
			out.println("</script>");			
			out.close();
			
		}else {
			out.println("<script>");
			out.println("alert('회원가입이 실패되었습니다.');");
			out.println("location.href='../home.do';");
			out.println("</script>");			
			out.close();
		}
		
		
		return null;
		
	}
	
	@RequestMapping(value="/login_a.do" , method = RequestMethod.POST)
	public String AdminLogin(AdminVO vo, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		int check = adminService.userCheck(vo);
		if(check ==1 ) {
			
			AdminVO adminvo = adminService.getAdminInfo(vo);
			session.setAttribute("admin", adminvo.getGround_admin());
			session.setAttribute("groundName", adminvo.getGround_name());
			if(adminService.isAdmin(vo)) {
				session.setAttribute("admin", adminvo.getGround_admin());
				session.setAttribute("groundName", adminvo.getGround_name());
				out.println("<script>");
				out.println("location.href='manager.do'");
				out.println("</script>"); 
			}else{
				out.println("<script>");
  				out.println("location.href='home.do '");
  				out.println("</script>"); 
			}
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
		
	
		

}
