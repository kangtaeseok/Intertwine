package org.edu.intertwine.qna.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.edu.intertwine.qna.model.service.QnaService;
import org.edu.intertwine.qna.model.vo.Qna;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.edu.intertwine.common.FileNameChange;
import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.common.SearchDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {
	//이 클래스에서 메소드 안의 요청과 반환값들의 결과 출력확인을 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qnaService;
	
	//뷰 페이지 내보내기용 메소드 작성부 ----------------------
	
	//새 게시글 등록 페이지 내보내기용 메소드
	@RequestMapping("qwform.do")
	public String moveQnaWritePage() {
		return "qna/qnaWriteForm";
	}
	
	@RequestMapping("qreplyform.do")
	public ModelAndView moveReplyPage(
			@RequestParam("qnum") int qnaNum, 
			@RequestParam("page") int currentPage, ModelAndView mv) {
		mv.addObject("qnum", qnaNum);
		mv.addObject("currentPage", currentPage);
		mv.setViewName("qna/qnaReplyForm");
		
		return mv;
	} 
	
	//게시글(원글, 댓글, 대댓글) 수정페이지로 이동 처리용
	@RequestMapping("qupview.do")
	public String moveQnaUpdatePage(
			@RequestParam("qnum") int qnaNum,
			@RequestParam("page") int currentPage,
			Model model) {
		//수정 페이지에 전달해서 출력할 qna 정보 조회
		Qna qna = qnaService.selectQna(qnaNum);
		
		if(qna != null) {
			model.addAttribute("qna", qna);
			model.addAttribute("page", currentPage);
			
			return "qna/qnaUpdateView";
		}else {
			model.addAttribute("message", qnaNum + "번 게시글 수정페이지 이동 실패!");
			return "common/error";
		}
	}
	
	//************************************************************
	
	//요청 처리용 메소드 작성부 --------------------------------------------
	
	//게시글 제목 검색용 (페이징 처리 포함)
	@RequestMapping(value="qsearchTitle.do", method=RequestMethod.POST)
	public ModelAndView qnaSearchTitleMethod(
			@RequestParam("action") String action,
			@RequestParam("keyword") String keyword,
			@RequestParam(name ="limit", required=false) String slimit,
			@RequestParam(name="page", required=false) String page,
			ModelAndView mv) {
		
		//검색결과에 대한 페이징 처리를 위한 페이지 지정
		int currentPage = 1;
		if(page != null ) {
			currentPage = Integer.parseInt(page);
		}
		
		
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit);
			logger.info("limit : " + limit);
			
		}
		
		//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회해 옴
		int listCount = qnaService.selectSearchTitleCount(keyword);
		
		//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
		Paging paging = new Paging(listCount, currentPage, limit, "qsearchTitle.do" );
		paging.calculate();
		
		//한 페이지에 출력할 검색 결과 적용된 목록 조회
		Search search = new Search();
		search.setStartRow(paging.getStartRow());
		search.setEndRow(paging.getEndRow());
		search.setKeyword(keyword);
		
		
		logger.info("paging.startRow : " + paging.getStartRow());
		
		ArrayList<Qna> list = qnaService.selectSearchTitle(search);
		
		
		logger.info("search.startRow : " + search.getStartRow());
		//받은 결과에 따라 설공/실패 페이지 내보내기
		if(list != null && list.size()>0) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("currentPage", currentPage);
			mv.addObject("action", action);
			mv.addObject("keyword", keyword);
			mv.addObject("limit", limit);
			
			mv.setViewName("qna/qnaListView");
			
		}else {
			mv.addObject("message", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;		
	}
	
	//게시글 작성자로 검색용 (페이징 처리 포함)
		@RequestMapping(value="qsearchWriter.do", method=RequestMethod.GET)
		public ModelAndView qnaSearchWriterMethod(
				@RequestParam("action") String action,
				@RequestParam("keyword") String keyword,
				@RequestParam(name ="limit", required=false) String slimit,
				@RequestParam(name="page", required=false) String page,
				ModelAndView mv) {
			
			//검색결과에 대한 페이징 처리를 위한 페이지 지정
			int currentPage = 1;
			if(page != null ) {
				currentPage = Integer.parseInt(page);
			}
			
			int limit = 10;
			if(slimit != null) {
				limit = Integer.parseInt(slimit);
			}
			
			//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회해 옴
			int listCount = qnaService.selectSearchWriterCount(keyword);
			
			//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
			Paging paging = new Paging(listCount, currentPage, limit, "qsearchWriter.do" );
			paging.calculate();
			
			//한 페이지에 출력할 검색 결과 적용된 목록 조회
			Search search = new Search();
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			search.setKeyword(keyword);
			
			ArrayList<Qna> list = qnaService.selectSearchWriter(search);
			
			//받은 결과에 따라 설공/실패 페이지 내보내기
			if(list != null && list.size()>0) {
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("action", action);
				mv.addObject("keyword", keyword);
				mv.addObject("limit", limit);
				
				mv.setViewName("qna/qnaListView");
				
			}else {
				mv.addObject("message", action + "에 대한 " + keyword + " 검색 결과가 존재하지 않습니다.");
				//mv.setViewName("common/error");
				mv.setViewName("qna/qnaError");

			}
			
			return mv;
			
		}
		
		
		//게시글 작성날짜로 검색용 (페이징 처리 포함)
		@RequestMapping(value="qsearchDate.do", method= {RequestMethod.POST, RequestMethod.GET})
		public ModelAndView qnaSearchDateMethod(
				SearchDate searchDate,
				@RequestParam("action") String action,
				@RequestParam(name ="limit", required=false) String slimit,
				@RequestParam(name="page", required=false) String page,
				ModelAndView mv) {
			
			//검색결과에 대한 페이징 처리를 위한 페이지 지정
			int currentPage = 1;
			if(page != null ) {
				currentPage = Integer.parseInt(page);
			}
			
			int limit = 10;
			if(slimit != null) {
				limit = Integer.parseInt(slimit);
			}
			
			//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회해 옴
			int listCount = qnaService.selectSearchDateCount(searchDate);
			
			//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
			Paging paging = new Paging(listCount, currentPage, limit, "qsearchDate.do" );
			paging.calculate();
			
			//한 페이지에 출력할 검색 결과 적용된 목록 조회
			Search search = new Search();
			search.setStartRow(paging.getStartRow());
			search.setEndRow(paging.getEndRow());
			search.setBegin(searchDate.getBegin());
			search.setEnd(searchDate.getEnd());

			
			ArrayList<Qna> list = qnaService.selectSearchDate(search);
			
			//받은 결과에 따라 설공/실패 페이지 내보내기
			if(list != null && list.size()>0) {
				mv.addObject("list", list);
				mv.addObject("paging", paging);
				mv.addObject("currentPage", currentPage);
				mv.addObject("action", action);
				mv.addObject("begin",searchDate.getBegin());
				mv.addObject("end",searchDate.getEnd());
			
				mv.addObject("limit", limit);
				
				mv.setViewName("qna/qnaListView");
				
			}else {
				mv.addObject("message", action + "에 대한 " + searchDate.getBegin() + "부터" +
							searchDate.getEnd() + "기간 사이에 등록된 게시글 검색 결과가 존재하지 않습니다.");

				mv.setViewName("common/error");
			}
			
			return mv;
			
		}
		
	
	//원글 수정 처리용
	@RequestMapping(value="qoriginupdate.do", method=RequestMethod.POST)
	public String originUdateMethod(
			Qna qna,
			HttpServletRequest request,
			@RequestParam(name="page", required=false) String page,
			@RequestParam(name="deleteFlag", required=false) String delFlag,
			@RequestParam(name="upfile", required=false) MultipartFile mfile, 
			Model model) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//게시글 원글 첨부파일 저장 폴더 경로 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/qna_upfiles");
				
		//첨부파일이 변경되었을 때의 처리 ----------------------------------------
		//1. 원래 첨부파일이 있는 데, '파일삭제'를 선택한 경우
		//2. 원래 첨부파일이 있는 데, '새로운파일이 업로드된 경우(첨부파일 변경)
		if(qna.getQnaOriginalFileName() != null && 
				((delFlag != null  && delFlag.equals("yes")) || !mfile.isEmpty())) {
			//저장 폴더에서 이전 파일을 삭제함
			new File(savePath + "\\" + qna.getQnaRenameFileName()).delete();
			//qna 안의 파일정보도 제거함
			qna.setQnaOriginalFileName(null);
			qna.setQnaRenameFileName(null);
		}
		
		//3. 첨부파일이 없었는 데 새로운 첨부파일이 업로도된 경우
		//첨부파일이 있을 때 
		if(!mfile.isEmpty()) {
			//전송온 첨부파일명 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장 폴더에는 변경된 파일이름으로 파일을 저장함
			//파일 이름 바꾸기함 => 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀 파일명에 대한 문자열 포맷 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 변경 확인 : " + fileName + "," + renameFileName);
				
				try {
					//지정한 저장 폴더에 파일명 바꾸기 처리함
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					model.addAttribute("message", "첨부 파일 저장 실패!");
					return "common/error";
				}
			}//파일명 바꾸기
			//qna 에 첨부파일 정보 저장 처리
			qna.setQnaOriginalFileName(fileName);
			qna.setQnaRenameFileName(renameFileName);
			
		}//첨부 파일 있을 때


		
		
		if(qnaService.updateOrigin(qna) > 0) {
			//댓글과 대댓글 수정 성공시 다시 상세보기가 보여지게 처리
			model.addAttribute("qnum", qna.getQnaNum());
			model.addAttribute("page", currentPage);
			
			return "redirect:qdetail.do";
		} else {
			model.addAttribute("message", qna.getQnaNum() + "번 글 수정 실패!");
			return "common/error";
		}
	
	}
	
	
	//댓글과 대댓글 수정 처리용
	@RequestMapping(value="qreplyupdate.do", method=RequestMethod.POST)
	public String replyUdateMethod(Qna reply,
			@RequestParam("page") int page, Model model) {
		
		if(qnaService.updateReply(reply) > 0) {
			//댓글과 대댓글 수정 성공시 다시 상세보기가 보여지게 처리
			model.addAttribute("qnum", reply.getQnaNum());
			model.addAttribute("page", page);
			
			return "redirect:qdetail.do";
		}else {
			model.addAttribute("message", reply.getQnaNum() + "번 글 수정 실패!");
			return "common/error";
		}
	
	}
	
	
	
	//게시글(원들, 댓글, 대댓글) 삭제 요청 처리용
	@RequestMapping("qdelete.do")
	public String qnaDeleteMethod(
			Qna qna, 
			Model model, 
			HttpServletRequest request) {
		
		if(qnaService.deleteQna(qna) > 0) {
			//게시글 삭제 성공시 저장 폴더에 있는 첨부파일도 삭제함
			if(qna.getQnaRenameFileName() != null) {
				String savePath = request.getSession().getServletContext().getRealPath(
						"resources/qna_upfiles");
				//저장 폴더에서 파일 삭제함
				new File(savePath + "\\" + qna.getQnaRenameFileName()).delete();
			}
			return "redirect:qlist.do";			
		}else {
			model.addAttribute("message", qna.getQnaNum()+ "번 게시글 삭제 실패!");
			return "common/error";
		}
		
	}
	
	
	
	//첨부파일 다운로드 요청 처리용
	//파일 다운로드 처리용 메소드는 리턴 타입이 ModelAndView로 정해져 있음
	@RequestMapping("qdown.do")
	public ModelAndView fileDownMothod(
			@RequestParam("ofile") String originalFileName,
			@RequestParam("rfile") String renameFileName,
			ModelAndView mv,
			HttpServletRequest request) {
		//게시글 첨부파일 저장 폴더 지정
		String savePath = request.getSession().getServletContext().getRealPath(
				"resources/qna_upfiles");
		
		//저장 폴더에서 읽을 파일에 대한 File 객체 생성함
		File readFile = new File(savePath + "\\" + renameFileName);
		//파일 다운시 브라우저로 내보낼 원래 파일명에 대한 File 객체 생성함
		File originFile = new File(originalFileName);
		
		//스프링에서는 파일다운로드를 처리하는 뷰클래스를 별도로 작성하도록 되어 있음
		//스프링이 제공하는 View 클래스를 상속받은 후손 클래스를 만들어야 함
		//파일다운로드용 뷰로 전달할 정보 저장 처리
		mv.setViewName("filedown");//등록된 파일다운로드용 뷰클래스의 id명
		mv.addObject("renameFile", readFile);
		mv.addObject("originFile", originFile);
		
		return mv;
	}
	
	
	//게시글 댓글, 대댓글 등록 처리용
	@RequestMapping(value="qreply.do", method=RequestMethod.POST)
	public String replyInsertMethod(Qna reply, 
			@RequestParam("qnum") int qnum,
			@RequestParam("page") int page,
			Model model) {
		//새로 등록할 댓글의 원글 또는 대댓글의 댓글을 조회해 옴
		Qna origin = qnaService.selectQna(qnum);
		
		//새로 등록할 댓글 또는 대댓글의 레벨을 지정함
		reply.setQnaLev(origin.getQnaLev()+1);
		
		//참조 원들 번호 지정함
		reply.setQnaRef(origin.getQnaRef());
		
		//대댓글(댓글의 댓글)일 때는 qnaReplyRef (참조 댓글번호) 지정
		if(reply.getQnaLev() == 3) {
			//참조 댓글 번호 지정
			reply.setQnaReplyRef(origin.getQnaReplyRef());
		}
		
		//최근 등록 댓글 또는 대댓글의 순번을 1로 지정함
		reply.setQnaReplySeq(1);
		logger.info("qreply.do : " + reply);
		
		//기존 같은 레벨의 댓글 또는 대댓글의 순번을 1증가 처리함
		qnaService.updateReplySeq(reply);
		
		if(qnaService.insertReply(reply) > 0) {
			return "redirect:qlist.do?page=" + page;
			
		}else {
			model.addAttribute("message", qnum + "번 글에 대한 댓글 /대댓글 등록 실패");
			return "common/error";
		}
		
	}
	
	//게시글 상세보기 요청 처리용
	@RequestMapping("qdetail.do")
	public String qnaDetatilMethod(
			@RequestParam("qnum") int qnaNum,
			@RequestParam(name="page", required=false) String page, Model model) {
		//목록으로 돌아갈 때의 페이지를 기억 저장
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//조회수 1증가 처리
		qnaService.updateAddReadCount(qnaNum);
		
		//요청된 글번호의 게시글 조회
		Qna qna = qnaService.selectQna(qnaNum);
		
		if(qna != null) {
			model.addAttribute("qna", qna);
			model.addAttribute("currentPage", currentPage);
			
			return "qna/qnaDetailView";
		}else {
			model.addAttribute("message", qnaNum + "번 게시글 상세보기 요청 실패!");
			return "common/error";
		}
		
	}
	
	//새 게시원글 등록 요청 처리용 (첨부파일 업로드 기능 추가됨)
	@RequestMapping(value="qinsert.do", method=RequestMethod.POST)
	public String qnaInsertMethod(Qna qna, Model model, HttpServletRequest request, 
		@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		logger.info("qinsert.do : " + qna);
		
		//게시글 첨부파일 저장용 폴더 지정 : 톰캣(WAS)이 구동하고 있는 애플리케이션 프로젝트 안의 폴더 지정
		//el 절대경로 표기인 ${ pageContext.servletContext.contextPath } 와 같은 의미의 코드임
		String savePath = request.getSession().getServletContext().getRealPath(
				"/resources/qna_upfiles"); //디렉토리에 저장시 "C:\\upfiles"
		
		//첨부파일이 있을 때 
		if(!mfile.isEmpty()) {
			//전송온 첨부파일명 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장 폴더에는 변경된 파일이름으로 파일을 저장함
			//파일 이름 바꾸기함 => 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀 파일명에 대한 문자열 포맷 만들기
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				logger.info("첨부파일명 변경 확인 : " + fileName + "," + renameFileName);
				
				try {
					//지정한 저장 폴더에 파일명 바꾸기 처리함
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
					model.addAttribute("message", "첨부 파일 저장 실패!");
					return "common/error";
				}
			}//파일명 바꾸기
			//qna 에 첨부파일 정보 저장 처리
			qna.setQnaOriginalFileName(fileName);
			qna.setQnaRenameFileName(renameFileName);
			
		}//첨부 파일 있을 때
		
		if(qnaService.insertOriginQna(qna) > 0) {
			//게시슬 등록 성공시 목록 보기 페이지로 이동
			return "redirect:qlist.do";
		}else {
			model.addAttribute("message", "새 게시 원들 등록 실패 !");
			return "common/error";
		}
		
	}
	
	
	
	@RequestMapping(value="qtop3.do", method=RequestMethod.POST)
	@ResponseBody
	public String qnaTop3Method() throws UnsupportedEncodingException {
		//ajax 요청시 리턴방법은 여러가지가 있음
		//response 객체 이용시에는 2가지 중 선택 사용하면 됨
		//1. 출력스트림으로 응답하는 방법
		//2. 뷰리졸버로 리턴하는 방법 : response body 에 내보낼 값을 저장함
		//    => servlet-context.xml 에 설정된 JSONView 클래스가 받아서 내보냄
		ArrayList<Qna> list = qnaService.selectTop3();
		
		//list 를 json 배열에 옮기기
		JSONArray jarr = new JSONArray();
		
		for(Qna qna : list) {
			//qna 객체 저장용 json 객체 생성
			JSONObject job = new JSONObject();
			
			job.put("qnum", qna.getQnaNum());
			// 한글에 대해서는 인코딩해서 json 에 담아야 한다(한글 깨짐 방지)
			job.put("qtitle", URLEncoder.encode(qna.getQnaTitle(), "utf-8"));
			job.put("rcount", qna.getQnaReadCount());
			
			//job 를 jarr 에 추가
			jarr.add(job);			
		}
		
		//전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		//전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);
		
		//전송용 json 을 json string 으로 바꿔서 전송되게 함
		return sendJson.toJSONString();
	}
	
	
	//게시글 목록 보기 요청 처리용(페이징 처리)
	@RequestMapping("qlist.do")
	public String qnaListMethod(
			@RequestParam(name="page", required=false) String page,
			@RequestParam(name="limit", required=false) String slimit,
			Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		// 한 페이지에 게시글 10개씩 출력되게 한다면 
		int limit = 10;
		if(slimit != null) {
			limit = Integer.parseInt(slimit); //전송받은 한 페이지에 출력할 목록 갯수를 적용
		}
		
		//총페이지수 계산을 위해 게시글 전체 갯수 조회해 옴
		int listCount = qnaService.selectListCount();
		// 페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "qlist.do");
		paging.calculate();
		
		//출력할 페이지에 대한 목록 조회
		ArrayList<Qna> list = qnaService.selectList(paging);
		
		//받은 결과로 성공/실패 페이지 내보냄
		if(list !=null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
			
			return "qna/qnaListView";
		}else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패 !");
			return "common/error";
		}
		
	}	
	
	
	@RequestMapping("moveAPI.do")
	public String moveAPIPage() {
		return "redirect:moveExam01.do";
	}
	
    @RequestMapping("moveExam01.do")
    public String moveMapExample01Page() {
	   return "qna/mapExample01";
	  // return "qna/kakaoMessage";
    }
    
	@RequestMapping("kakaoMessage.do")
	public String kakaoMessageMethod() {
		return "qna/kakaoMessage";
	}
	
	@RequestMapping("movePushAlarm.do")
	public String kakaoPushAlarmMethod() {
		return "qna/kakaoShareData";
	}
	
}
