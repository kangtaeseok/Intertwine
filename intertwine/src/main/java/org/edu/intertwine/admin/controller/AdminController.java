package org.edu.intertwine.admin.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.admin.model.service.AdminService;
import org.edu.intertwine.admin.model.vo.Admin;
import org.edu.intertwine.admin.model.vo.ContentReport;
import org.edu.intertwine.comment.model.service.CommentService;
import org.edu.intertwine.comment.model.vo.Comment;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.Time;
import org.edu.intertwine.post.model.service.PostService;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.user.model.service.UserService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
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
	
	
	@Autowired
	private UserService userService;
	
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
		
		
		  Time time = new Time(); 
		  if(adminService.selectVisitCountToday() == 0) {
		  mv.addObject("nine", 0); mv.addObject("twe", 0); mv.addObject("fity", 0);
		  mv.addObject("eight", 0); mv.addObject("twone", 0); mv.addObject("twofo", 0);
		  
		  } else { 
			  time.setStartTime("09"); time.setEndTime("12"); 
			  mv.addObject("nine",adminService.selectVisitCountTime(time));
			  
			  time.setStartTime("12"); time.setEndTime("15"); 
			  mv.addObject("twe", adminService.selectVisitCountTime(time)); 
			  
			  time.setStartTime("15"); time.setEndTime("18"); 
			  mv.addObject("fity", adminService.selectVisitCountTime(time)); 
			  
			  time.setStartTime("18");	time.setEndTime("21"); 
			  mv.addObject("eight", adminService.selectVisitCountTime(time)); 
			  
			  time.setStartTime("21"); time.setEndTime("24");
			  mv.addObject("twone", adminService.selectVisitCountTime(time)); 
			  
			  time.setStartTime("24"); time.setEndTime("09"); 
			  mv.addObject("twofo", adminService.selectVisitCountTime(time)); }

		  mv.addObject("userCount", userService.selectAllUserCount());
		  
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
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		int listCount = adminService.selectSeachUserIdCount(keyword);
		
		Paging paging = new Paging(listCount, currentPage, limit, "rsearchuserId.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<ContentReport> list = adminService.selectSearchUserId(search);
		
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
			mv.addObject("msg", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			mv.addObject("url", "admin/reportPage");
			mv.setViewName("common/alert");
		}
		
		return mv;
	}
	
	
	//포스트넘버
	@RequestMapping(value="rsearchboardNum.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportSearchBoardNum(@RequestParam("action") String action,
										@RequestParam("keyword") String keyword,
										@RequestParam(name="limit", required=false) String slimit,
										@RequestParam(name="page", required=false) String page,
										ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		int listCount = adminService.selectSeachBoardNumCount(keyword);
		
		Paging paging = new Paging(listCount, currentPage, limit, "rsearchboardNum.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<ContentReport> list = adminService.selectSeachBoardNum(search);
		
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
			mv.addObject("msg", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			mv.addObject("url", "admin/reportPage");
			mv.setViewName("common/alert");
		}
		
		return mv;
	}
	
	//처리상태
	@RequestMapping(value="rsearchStatus.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView reportSearchStatus(@RequestParam("action") String action,
											@RequestParam("keyword") String keyword,
											@RequestParam(name="page", required=false) String page,
											ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		int limit = 10;
		
		int listCount = adminService.selectSeachStatusCount(keyword);
		
		Paging paging = new Paging(listCount, currentPage, limit, "rsearchStatus.do");
		paging.calculate();
		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
			
		ArrayList<ContentReport> list = adminService.selectSeachStatus(search);
		
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
			mv.addObject("msg", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			mv.addObject("url", "admin/reportPage");
			mv.setViewName("common/alert");
		}
		
		return mv;
	}
	@Autowired
	private PostService postService;
	
	//게시물상세보기
	@RequestMapping("rptdetail.do")
	public String postDetailMethod(@RequestParam("pnum") int boardNum, 
			@RequestParam(name="page", required=false) String page, Model model) {

		int currentPage = 1;
		if(page != null && page.trim().length() > 0) {
			currentPage = Integer.parseInt(page);
		}

		int limit = 10;

		int listCount = adminService.selectReportBoardNumCount(boardNum);
		
		Paging paging = new Paging(listCount, currentPage, limit, "rptdetail.do");
		paging.calculate();

		
		Post post = postService.selectOnePost(boardNum);
		ArrayList<ContentReport> report = adminService.selectPostNumList(boardNum);
		
		if(post != null) {
			adminService.updateRptStatusing(boardNum);
			model.addAttribute("report", report);
			model.addAttribute("post", post);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			return "admin/reportDetailView";
		} else {
			model.addAttribute("msg", boardNum + "번 게시글 상세보기 요청 실패");
			model.addAttribute("url", "admin/reportPage");
			return "common/alert";
		}
		
	}
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value="rptCommentdetail.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String commentDetailMethod(@RequestParam("cnum") int commentId
			,@RequestParam("pnum") int boardNum, 
			@RequestParam(name="page", required=false) String page, Model model) {

		int currentPage = 1;
		if(page != null && page.trim().length() > 0) {
			currentPage = Integer.parseInt(page);
		}
		int limit = 10;
		
		int listCount = adminService.selectReportCommentCount(commentId);
		
		Paging paging = new Paging(listCount, currentPage, limit, "rptCommentdetail.do");
		paging.calculate();

		ArrayList<Comment> comment = commentService.selectComments(boardNum);
		ArrayList<ContentReport> report = adminService.selectPostNumList(boardNum);
		
		if(comment != null) {
			adminService.updateRptCStatusing(boardNum);
			model.addAttribute("report", report);
			model.addAttribute("comment", comment);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			return "admin/rptCommentView";
		} else {
			model.addAttribute("msg","상세보기 요청 실패");
			model.addAttribute("url", "admin/reportPage");
			return "common/alert";
		}
		
	}
	 
	//신고 내용받기
	@ResponseBody
	@RequestMapping(value="inPostReport.do", method=RequestMethod.POST)
	public void inPostReport(@RequestParam("postId") int postId, @RequestParam("message") String message,  @RequestParam("userId") String userId){
		ContentReport cpt = new ContentReport();	
		cpt.setBoardNum(postId);
		cpt.setReportReason(message);
		cpt.setReportComment(0);
		cpt.setUserId(userId);
		adminService.insertRptPost(cpt);
		
		
	}
	
	//신고 내용받기
	@ResponseBody
	@RequestMapping(value="inComReport.do", method=RequestMethod.POST)
	public void inComReport(@RequestParam("postId") int postId, @RequestParam("message") String message,  @RequestParam("userId") String userId,
			@RequestParam("commentId") int commentId){
		ContentReport cpt = new ContentReport();
		cpt.setBoardNum(postId);
		cpt.setReportReason(message);
		cpt.setReportComment(commentId);
		cpt.setUserId(userId);
		adminService.insertRptComment(cpt);
	}
	
	//삭제 혹은 비공개 처리
	@RequestMapping(value="delContent.do", method=RequestMethod.POST)
	public ResponseEntity<?> delContentMethod(@RequestParam("reportId") List<Integer> reportIds,
	 Model model) {
		
		for (Integer reportId : reportIds) {
			List<ContentReport> cpt = adminService.selectContentReportList(reportId);
			List<Integer> postIds = new ArrayList<>();
			
		  for (ContentReport contentReport : cpt) {
		        Integer postId = contentReport.getBoardNum();
		        Post post = postService.selectOnePost(postId);
		        if (post != null) {
		        	postIds.add(postId);
		        }
		  }
		  postService.updateBatchPrivate(postIds);
		  adminService.updateRptStatus(reportId);
	    }
		
		return new ResponseEntity<>(HttpStatus.OK);
	
	}
	
	
	//삭제 혹은 비공개 처리
		@RequestMapping(value="delcomment.do", method=RequestMethod.POST)
		public ResponseEntity<?> delCommentMethod(@RequestParam("reportId") List<Integer> reportIds,
		 Model model) {
			
			for (Integer reportId : reportIds) {
				List<ContentReport> cpt = adminService.selectContentReportList(reportId);
				List<Integer> commentIds = new ArrayList<>();
				
			  for (ContentReport contentReport : cpt) {
			        Integer commentId = contentReport.getReportComment();
					Comment comment = commentService.selectCommentbyCommentId(commentId);
			        if (comment != null) {
			        	commentIds.add(commentId);
			        }
			  }
			  //댓글삭제 추가예정
				/* commentService. */
			  adminService.updateRptStatus(reportId);
		    }
			
			return new ResponseEntity<>(HttpStatus.OK);
		
		}
	
	//처리상태 변경(분류)
	@RequestMapping(value="upStatus.do", method=RequestMethod.POST)
	public ResponseEntity<?> rptUpdateMethod(@RequestParam("reportId") List<Integer> reportIds,
	 Model model) {
		for (Integer reportId : reportIds) {
	        adminService.updateRptStatus(reportId);
	    }
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	//알림띄우기
	@RequestMapping(value="reportAlarm.do", method=RequestMethod.POST)
	@ResponseBody
	public String reportAlarm() throws UnsupportedEncodingException {
		ArrayList<ContentReport> list = adminService.selectReportAlarm();
		
		JSONArray jarr = new JSONArray();
		
		for(ContentReport cpt : list) {
			JSONObject job = new JSONObject();
			job.put("rId", cpt.getReportId());
			job.put("Nnum", cpt.getBoardNum());
			job.put("uId", cpt.getUserId());
			job.put("reason", cpt.getReportReason());
			jarr.add(job);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("rlist", jarr);
		
		return sendJson.toJSONString();
	}
	
	
}
