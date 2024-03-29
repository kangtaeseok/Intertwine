package org.edu.intertwine.faq.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.faq.model.service.FaqService;
import org.edu.intertwine.faq.model.vo.Faq;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

//import org.myweb.first.common.FileNameChange;
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

@Controller //설정 xml 에 해당 클래스를 Controller 로 자동 등록해 줌
public class FaqController {
	
	private static final Logger logger = LoggerFactory.getLogger(FaqController.class);

	
	@Autowired
	private FaqService faqService;

	//게시글 목록 보기 요청 처리용(페이징 처리)
	@RequestMapping("flist.do")
	public String faqListMethod(
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
		int listCount = faqService.selectListCount();
		faqService.selectListCount();
		
		// 페이징 계산 처리 실행
		Paging paging = new Paging(listCount, currentPage, limit, "flist.do");
		paging.calculate();
		
		//출력할 페이지에 대한 목록 조회
		ArrayList<Faq> list = faqService.selectList(paging);
		
		//받은 결과로 성공/실패 페이지 내보냄
		if(list !=null && list.size() > 0) {
			model.addAttribute("list", list);
			model.addAttribute("paging", paging);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("limit", limit);
			
			return "faq/faqListView";
		}else {
			model.addAttribute("message", currentPage + " 페이지 목록 조회 실패 !");
			return "common/error";
		}
		
	}	
	
	
	@RequestMapping(value="ftop3.do", method=RequestMethod.POST)
	@ResponseBody
	public String faqTop3Method() throws UnsupportedEncodingException {
		
		
		//ajax 요청시 리턴방법은 여러가지가 있음
		//response 객체 이용시에는 2가지 중 선택 사용하면 됨
		//1. 출력스트림으로 응답하는 방법
		//2. 뷰리졸버로 리턴하는 방법 : response body 에 내보낼 값을 저장함
		//    => servlet-context.xml 에 설정된 JSONView 클래스가 받아서 내보냄
		ArrayList<Faq> list = faqService.selectTop3();
		
		//list 를 json 배열에 옮기기
		JSONArray jarr = new JSONArray();
		
		for(Faq faq : list) {
			//faq 객체 저장용 json 객체 생성
			JSONObject job = new JSONObject();
			
			job.put("fnum", faq.getFaqNum());
			// 한글에 대해서는 인코딩해서 json 에 담아야 한다(한글 깨짐 방지)
			job.put("ftitle", URLEncoder.encode(faq.getFaqTitle(), "utf-8"));
			job.put("fcount", faq.getFaqReadCount());
			
			//job 를 jarr 에 추가
			jarr.add(job);	
			
			logger.info(job.toString());
		}
		
		//전송용 json 객체 준비
		JSONObject sendJson = new JSONObject();
		//전송용 객체에 jarr을 담음
		sendJson.put("list", jarr);
		
		//전송용 json 을 json string 으로 바꿔서 전송되게 함
		return sendJson.toJSONString();
	}
	
	//게시글 상세보기 요청 처리용
	@RequestMapping("fdetail.do")
	public String faqDetatilMethod(
			@RequestParam("fnum") int faqNum,
			@RequestParam(name="page", required=false) String page, Model model) {
		//목록으로 돌아갈 때의 페이지를 기억 저장
		int currentPage = 1;
		if(page != null) {
			currentPage = Integer.parseInt(page);
		}
		
		//조회수 1증가 처리
		faqService.updateAddReadCount(faqNum);
		
		logger.info("faqNum+++++++++++++ : " + faqNum);
		
		//요청된 글번호의 게시글 조회		
		Faq faq = faqService.selectFaq(faqNum);
		
		if(faq != null) {
			model.addAttribute("faq", faq);
			model.addAttribute("currentPage", currentPage);
			
			return "faq/faqDetailView";
		}else {
			model.addAttribute("message", faqNum + "번 게시글 상세보기 요청 실패!");
			return "common/error";
		}
		
	}
	
	//새 게시글 등록 페이지 내보내기용 메소드
	@RequestMapping("fwform.do")
	public String moveFaqWritePage() {
		return "faq/faqWriteForm";
	}

	//새 게시원글 등록 요청 처리용 (첨부파일 업로드 기능 추가됨)
	@RequestMapping(value="finsert.do", method=RequestMethod.POST)
	public String faqInsertMethod(Faq faq, Model model, HttpServletRequest request, 
		@RequestParam(name="upfile", required=false) MultipartFile mfile) {
		logger.info("finsert.do : " + faq);
		
		//게시글 첨부파일 저장용 폴더 지정 : 톰캣(WAS)이 구동하고 있는 애플리케이션 프로젝트 안의 폴더 지정
		//el 절대경로 표기인 ${ pageContext.servletContext.contextPath } 와 같은 의미의 코드임
		String savePath = request.getSession().getServletContext().getRealPath(
				"/resources/faq_upfiles"); //디렉토리에 저장시 "C:\\upfiles"
		
		//첨부파일이 있을 때 
		if(!mfile.isEmpty()) {
			//전송온 첨부파일명 추출함
			String fileName = mfile.getOriginalFilename();
			String renameFileName = null;
			
			//저장 폴더에는 변경된 파일이름으로 파일을 저장함
			//파일 이름 바꾸기함 => 년월일시분초.확장자
			if(fileName != null && fileName.length() > 0) {
				//바꿀 파일명에 대한 문자열 포맷 만들기
				//renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
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
			//faq 에 첨부파일 정보 저장 처리
			//faq.setFaqOriginalFileName(fileName);
			//faq.setFaqRenameFileName(renameFileName);
			
		}//첨부 파일 있을 때
		
		if(faqService.insertOriginFaq(faq) > 0) {
			//게시슬 등록 성공시 목록 보기 페이지로 이동
			return "redirect:blist.do";
		}else {
			model.addAttribute("message", "새 게시 원들 등록 실패 !");
			return "common/error";
		}
		
	}
	
	
	
}
