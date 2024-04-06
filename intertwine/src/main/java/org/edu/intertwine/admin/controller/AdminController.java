package org.edu.intertwine.admin.controller;



import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.admin.model.service.AdminService;
import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {

	
	@Autowired
	private AdminService adminService;
	
	//페이지 이동처리
	@RequestMapping("adminLogin.do")
	public String moveadLoginPage() {
		return "admin/adlogin"; 
	}
	@RequestMapping("RptPage.do")
	public String moveadReportPage() {
		return "admin/reportPage"; 
	}
	
	@RequestMapping("userRptPage.do")
	public String moveadUserReportPage() {
		return "admin/userreportPage"; 
	}
	
	@RequestMapping("rptlist.do")
	public String reportListMethod(
			@RequestParam(name="page", required=false) String page,
			@RequestParam(name="limit", required=false) String slimit, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//한 페이지에 게시글 10개씩 출력되게 한다면
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);	//전송받은 한 페이지에 출력할 목록 갯수를 적용
		}
		//총페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		int listCount = adminService.selectRptListCount();
		//페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "rptlist.do");
		paging.calculate();
		
		//출력할 페이지에 대한 목록 조회
		ArrayList<ContentReport> list = adminService.selectRptList(paging);
		
		//받은 결과로 성공/실패 페이지 내보냄
		if(list != null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
			model.addAttribute("listCount", listCount);
			
			return "admin/reportPage";
		} else {
			model.addAttribute("msg", currentPage + " 페이지 목록 조회 실패");
			model.addAttribute("url", "admin/reportPage");
			return "admin/reportPage";
		}
	}
	
	
	
	@RequestMapping("admain.do")
	public ModelAndView moveadadMainPage(ModelAndView mv) {
		mv.addObject("visitCount", adminService.selectVisitCount());
		mv.addObject("sumCount", adminService.selectVisitCountAll());
		mv.addObject("Jan", adminService.selectVisitCountMonth("01"));
		mv.addObject("Feb", adminService.selectVisitCountMonth("02"));
		mv.addObject("Mar", adminService.selectVisitCountMonth("03"));
		mv.addObject("Apr", adminService.selectVisitCountMonth("04"));
		mv.addObject("May", adminService.selectVisitCountMonth("05"));
		mv.addObject("Jun", adminService.selectVisitCountMonth("06"));
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
	
	//신고게시판 검색처리
	@RequestMapping(value="rsearchuserId.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportSearchUserId(@RequestParam("action") String action,
										@RequestParam("keyword") String keyword,
										@RequestParam(name="limit", required=false) String slimit,
										@RequestParam(name="page", required=false) String page,
										ModelAndView mv) {
		//검색결과에 대한 페이징 처리를 위한 페이지 지정
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		
		//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회
		int listCount = adminService.selectSeachUserIdCount(keyword);
		
		//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "rsearchuserId.do");
		paging.calculate();
		
		
		//한 페이지에 출력할 검색 결과 적용된 목록 조회
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<ContentReport> list = adminService.selectSearchUserId(search);
		
		//받은 결과에 따라 성공/실패 페이지 내보내기
		if(list != null && list.size() > 0) {
			mv.setViewName("admin/reportPage");
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);
			mv.addObject("limit", limit);
			mv.addObject("listCount", listCount);
			
		} else {
			mv.addObject("message", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
}
