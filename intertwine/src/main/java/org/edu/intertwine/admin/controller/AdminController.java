package org.edu.intertwine.admin.controller;



import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.admin.model.service.AdminService;
import org.edu.intertwine.admin.model.vo.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Resource(name="AdminService")
@Controller
public class AdminController {

	
	@Autowired
	private AdminService adminService;
	
	//페이지 이동처리
	@RequestMapping("adminLogin.do")
	public String moveadLoginPage() {
		return "admin/adlogin"; 
	}
	
	@RequestMapping("admain.do")
	public ModelAndView moveadadMainPage(ModelAndView mv) {
		mv.addObject("visitCount", adminService.selectVisitCount());
		mv.addObject("sumCount", adminService.selectVisitCountAll());
		mv.setViewName("admin/admain");
		return mv; 
	}
	
	@RequestMapping(value="alogin.do", method= {RequestMethod.GET,RequestMethod.POST})
	public String userLogin(Admin admin, HttpSession session, SessionStatus status,
			HttpServletResponse response, Model model) throws IOException {
		
	Admin loginAdmin = adminService.selectAdmin(admin.getAdminId());

	if (loginAdmin != null) {
		
		session.setAttribute("loginAdmin", loginAdmin);
		status.setComplete();
		  return "redirect:admain.do";
	} else {
		model.addAttribute("msg", "암호나 아이디가 일치하지 않습니다. 다시 확인해주세요.");
		model.addAttribute("url", "adminLogin.do");

		 return "common/alert";
	 } 
	}
	
}
