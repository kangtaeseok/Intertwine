package org.edu.intertwine.notice.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.edu.intertwine.common.FileNameChange;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.notice.model.service.NoticeService;
import org.edu.intertwine.notice.model.vo.Notice;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//새 공지글 등록 페이지 이동 처리용
	@RequestMapping("movenoticewrite.do")
	public String moveNoticeWrite() {
		return "notice/noticeWrite"; 
	}
	
	//공지글 수정페이지로 이동 처리용
	@RequestMapping(value = "noticeupdate.do", method = RequestMethod.POST)
	public ModelAndView moveNoticeUpdate(@RequestParam("noticeId") int noticeId, ModelAndView mv) {
	    // 공지사항 수정 페이지로 이동
	    mv.addObject("noticeId", noticeId); // 수정할 공지사항의 ID를 모델에 추가
	    mv.setViewName("notice/noticeUpdate"); // 수정 페이지로 이동
	    return mv;
	}

	
	
	
	//요청 결과 처리용 --------------------------------------------------------------
	
	// 공지사항 전체 목록보기 요청 처리용
	@RequestMapping("noticelist.do")
	public String noticeList(
	    @RequestParam(name="page", required=false) String page, 
	    @RequestParam(name="limit", required=false) String slimit, 
	    Model model) {
	    int currentPage = 1;
	    if (page != null) {
	        currentPage = Integer.parseInt(page);
	    }
	    
	    // 한 페이지 공지 10개씩 출력되게 한다면
	    int limit = 10;
	    if (slimit != null) {
	        limit = Integer.parseInt(slimit);
	    }
	    
	    // 총 페이지 수 계산을 위한 공지글 총갯수 조회
	    int listCount = noticeService.selectListCount();
	    // 페이지 관련 항목 계산 처리
	    Paging paging = new Paging(listCount, currentPage, limit, "noticelist.do");
	    paging.calculate();
	    
	    // 페이지에 출력할 목록 조회해 옴
	    ArrayList<Notice> list = noticeService.selectList(paging);
	    
	    if(list != null && list.size() > 0) {
	        model.addAttribute("list", list);
	        model.addAttribute("paging", paging);
	        model.addAttribute("currentPage", currentPage);
	        model.addAttribute("limit", limit);
	    } else {
	        model.addAttribute("alertMessage", "alert('" + currentPage + "페이지 목록 조회에 실패했습니다.");
	        return "notice/noticeListView";
	    }
	    return "notice/noticeListView";
	}
	
	//새 공지글 등록 요청 처리용 (파일 업로드 기능 추가)
	@RequestMapping(value="noticewrite.do", method=RequestMethod.POST)
	public String noticeId(Notice notice, Model model, HttpServletRequest request, 
			@RequestParam(name="ofile", required=false) MultipartFile mfile) {
		logger.info("noticewrite.do : " + notice);
		
		//공지사항 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/notice_upfiles");
		
		//첨부파일이 있을 때
		if(!mfile.isEmpty()) {
			//전송온 파일이름 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장폴더에는 변경된 이름을 저장 처리함
			//파일 이름바꾸기함 : 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {				
				//바꿀 파일명에 대한 문자열 만들기
				renameFileName = FileNameChange.change(fileName, 	"yyyyMMddHHmmss");
				logger.info("첨부파일명 확인 : " + fileName + ", " + renameFileName);
				try {	
					//저장 폴더에 파일명 바꾸기 처리
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("alertMessage", "alert('첨부파일 저장에 실패 했습니다.')");
				}
			}  //파일명 바꾸기
			//notice 객체에 첨부파일 정보 저장 처리
			notice.setOriginalFilePath(fileName);
			notice.setRenameFilePath(renameFileName);
		} //첨부파일 있을 때		
		
		if(noticeService.insertNotice(notice) > 0) {
			//공지글 등록 성공시 목록 보기 페이지로 이동
			return "redirect:noticelist.do";
		}else {
			model.addAttribute("alertMessage", "alert('공지글 등록에 실패 했습니다.')");
			return null;
		}
	}
	
	// 공지글 삭제 요청 처리용
	@RequestMapping("noticedelete.do")
    public String noticeDelete(@RequestParam("noticeid") int noticeid, Model model) {
        if (noticeService.deleteNotice(noticeid) > 0) {
            model.addAttribute("alertMessage", "alert('" + noticeid + "번 공지사항이 삭제되었습니다.')");
        } else {
            model.addAttribute("alertMessage", "alert('" + noticeid + "번 공지사항 삭제에 실패했습니다.')");
        }
        return "redirect:adnlist.do"; // 삭제 후 공지사항 목록 페이지로 리다이렉트
    }
	
	//공지글 제목 검색용 (페이징 처리 포함)
	@RequestMapping(value="noticesearchtitle.do", method= RequestMethod.GET)
	public ModelAndView noticeSearchTitleMethod(
			@RequestParam("action") String action,			
			@RequestParam("keyword") String keyword,
			@RequestParam(name="limit", required=false) String slimit,
			@RequestParam(name="page", required=false) String page,
			ModelAndView mv) {
		
		//검색결과에 대한 페이징 처리
		//출력할 페이지 지정
		int currentPage = 1;
		//전송온 페이지 값이 있다면 추출함
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//한 페이지당 출력할 목록 갯수 지정
		int limit = 10;
		//전송 온 limit 값이 있다면
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
		}
		
		//총 페이지수 계산을 위한 검색 결과 적용된 총 목록 갯수 조회
		int listCount = noticeService.selectSearchTitleCount(keyword);
		
		//뷰 페이지에 사용할 페이징 관련 값 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "noticesearchtitle.do");
		paging.calculate();
		
		//서비스 메소드 호출하고 리턴결과 받기		
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		ArrayList<Notice> list = noticeService.selectSearchTitle(search);
		
		//받은 결과에 따라 성공/실패 페이지 내보내기
		if(list != null && list.size() > 0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("limit", limit);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);			
			
			mv.setViewName("notice/noticeListView");
		}else {
			mv.addObject("message", action + "에 대한 " 
						+ keyword + " 검색 결과가 존재하지 않습니다.");			
			mv.setViewName("common/error");
		}
		
		return mv;
	}
	
	 @PostMapping("updateAddReadCount.do")
	 @ResponseBody
	 public String updateAddReadCount(@RequestParam("noticeId") int noticeId) {
	     try {
	         // MyBatis를 이용하여 쿼리 실행
	         int rowsAffected = sqlSessionTemplate.update("noticeMapper.updateAddReadCount", noticeId);
	         if (rowsAffected > 0) {
	             return "Success"; // 성공적으로 조회수가 증가됨을 클라이언트에게 알림
	         } else {
	             return "Notice with ID " + noticeId + " not found."; // 해당 ID의 공지사항이 존재하지 않을 때 클라이언트에게 알림
	         }
	     } catch (Exception e) {
	         e.printStackTrace();
	         return "Error"; // 조회수 증가 과정에서 오류 발생 시 클라이언트에게 알림
	     }
	 }
	 
	 @RequestMapping("adnlist.do")
		public String adminNoticeList(
		    @RequestParam(name="page", required=false) String page, 
		    @RequestParam(name="limit", required=false) String slimit, 
		    Model model) {
		    int currentPage = 1;
		    if (page != null) {
		        currentPage = Integer.parseInt(page);
		    }
		    
		    // 한 페이지 공지 10개씩 출력되게 한다면
		    int limit = 10;
		    if (slimit != null) {
		        limit = Integer.parseInt(slimit);
		    }
		    
		    // 총 페이지 수 계산을 위한 공지글 총갯수 조회
		    int listCount = noticeService.selectListCount();
		    // 페이지 관련 항목 계산 처리
		    Paging paging = new Paging(listCount, currentPage, limit, "adnlist.do");
		    paging.calculate();
		    
		    // 페이지에 출력할 목록 조회해 옴
		    ArrayList<Notice> list = noticeService.selectList(paging);
		    
		    if(list != null && list.size() > 0) {
		        model.addAttribute("list", list);
		        model.addAttribute("paging", paging);
		        model.addAttribute("currentPage", currentPage);
		        model.addAttribute("limit", limit);
		    } else {
		        model.addAttribute("alertMessage", "alert('" + currentPage + "페이지 목록 조회에 실패했습니다.");
		        return "notice/adminNoticeList";
		    }
		    return "notice/adminNoticeList";
		}
	 
}





