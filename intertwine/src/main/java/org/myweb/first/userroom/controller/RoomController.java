package org.myweb.first.userroom.controller;

import org.springframework.stereotype.Controller;


@Controller
public class RoomController {
	/*// 이 컨트롤러 메소드 들이 잘 구동 되는지, 값이 잘 전달 또는 리턴 되었는지 확인하기 위한 로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(RoomController.class);

	@Autowired
	 private TestService testService; 

	@Autowired
	 private NoticeService noticeService; 

	// 뷰 페이지 이동 처리용 --------------------------------------------------------
	@RequestMapping("moveAjax.do")
	public String maveAjaxPage() {
		return "test/testAjaxView";
	}

	
	
	@RequestMapping(value = "test3.do", method = RequestMethod.POST)
	@ResponseBody // 리턴하는 jsonString 을 response body 에 담아서 보낸다는 의미임
	public String test3Method(HttpServletResponse response) throws IOException {
		// 클라이언트로 부터 요청이 오면, jsonString을 별도의 스트림을 열어서 보낼수도 있고,
		// 또는 뷰 리졸버로 리턴하면 등록된 jsonView 가 받아서 내보낼 수도 있음

		// Service 메소드 호출하고 결과받기
		// 최근 등록한 공지글 1개 조회해 옴
		Notice notice = noticeService.selectLast();

		// 받은 notice 를 JSONObject 에 옮겨 담기 처리
		JSONObject job = new JSONObject();

		job.put("noticeno", notice.getNoticeNo());
		// 문자열 값에 한글이 있다면, 반드시 인코딩 해서 저장해야 함
		job.put("noticetitle", URLEncoder.encode(notice.getNoticeTitle(), "utf-8"));
		job.put("noticewriter", notice.getNoticeWriter());
		// 날짜데이터는 반드시 문자열로 바꿔서 저장할 것 : 날짜 그대로 저장하면 뷰에서 json 전체 출력안됨
		job.put("noticedate", notice.getNoticeDate().toString());
		// 문자열 값에 한글이 있다면, 반드시 인코딩 해서 저장해야 함
		job.put("noticecontent", URLEncoder.encode(notice.getNoticeContent(), "utf-8"));

		// ajax 로 서비스 요청시 클라이언트로 응답하는 방법은 2가지
		// 방법 1 :
		// public void 형 => 직접 출력스트림을 만들어서 내보냄
		// 방법 2 :
		// public String 형 => 설정된 JsonView 로 내보냄

		// 리턴되는 json 객체의 String 문자열을 등록된 뷰 리졸버인 JsonView 로 보냄
		// servlet-context.xml 의 JsonView 가 받아서 내보냄
		return job.toJSONString();

	}

	@RequestMapping(value = "test4.do", method = RequestMethod.POST)
	@ResponseBody
	public String test4Method(@RequestParam("keyword") String keyword, HttpServletResponse response)
			throws IOException {
		// 전달받은 키워드로 공지사항 제목 검색 메소드를 실행하고 겨로가받기
		ArrayList<Notice> list = noticeService.selectSearchTitle(keyword);

		// response 에 내보낼 값에 대한 mimiType 설정
		response.setContentType("application/json; charset=utf-8");

		// 리턴된 list를 json 배열에 옮겨 담기
		JSONArray jarr = new JSONArray();

		for (Notice notice : list) {
			// notice 값들을 저장할 json 객체 생성
			JSONObject job = new JSONObject();

			job.put("noticeno", notice.getNoticeNo());
			// 저장할 문자열에 한글이 있다면 반드시 인코딩해서 저장해야 함
			job.put("noticetitle", URLEncoder.encode(notice.getNoticeTitle(), "utf-8"));
			job.put("noticewriter", notice.getNoticeWriter());
			// 날짜는 반드시 문자열로 바꿔서 저장할 것
			job.put("noticedate", notice.getNoticeDate().toString());

			jarr.add(job);
		} // for

		// 전송용 json 객체 생성
		JSONObject sendJson = new JSONObject();
		// 전송용 json에 jarr 을 저장함
		sendJson.put("list", jarr);

		return sendJson.toJSONString();
	}

	// 클라이언트가 보낸 json 객체를 받아서 처리하는 컨트롤러 메소드
	// get : 전송값이 request 의 head 에 기록되어서 전송옴 (url 에 보여짐)
	// post : 전송값이 request 의 body 에 인코딩되어서 기록되어 전송옴 (url 에 안 보여짐, 인코딩 처리 필요함)
	@RequestMapping(value = "test5.do", method = RequestMethod.POST)
	public ResponseEntity<String> test5Method(@RequestBody String param) throws ParseException {
		// post 로 request body 에 기록된 json 문자열을 꺼내서 param 변수에 저장하라는 의미임

		// param 에 저장된 json 문자열을 json 객체로 바꿈
		JSONParser jparser = new JSONParser();
		JSONObject job = (JSONObject) jparser.parse(param);

		// json 객체가 가진 각 필드(property) 값을 우출해서 vo 객체 (Notice)에 저장
		Notice notice = new Notice();
		notice.setNoticeTitle((String) job.get("title"));
		notice.setNoticeWriter((String) job.get("writer"));
		notice.setNoticeContent((String) job.get("content"));

		// 새 공지글 등록 처리용 메소드 실행
		int result = noticeService.insertNotice(notice);

		// ResponseEntity<T> : 클라이언트에게 응답하는 용도의 객체임
		// 뷰 리졸버가 아닌 출력스트림으로 나감
		if (result > 0) {
			return new ResponseEntity<String>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<String>("fiiled", HttpStatus.REQUEST_TIMEOUT);
		}
	}

	// 
	// 클라이언트가 보낸 json 객체를 받아서 처리하는 컨트롤러 메소드
	// get : 전송값이 request 의 head 에 기록되어서 전송옴 (url 에 보여짐)
	// post : 전송값이 request 의 body 에 인코딩되어서 기록되어 전송옴 (url 에 안 보여짐, 인코딩 처리 필요함)
	
	 * @RequestMapping(value = "test6.do", method = RequestMethod.POST) public
	 * ResponseEntity<String> test6Method(@RequestBody String param) throws
	 * ParseException { // post 로 request body 에 기록된 json 문자열을 꺼내서 param 변수에 저장하라는
	 * 의미임
	 * 
	 * // param 에 저장된 json 문자열을 json 객체로 바꿈 JSONParser jparser = new JSONParser();
	 * JSONArray jarr = (JSONArray) jparser.parse(param);
	 * 
	 * // jarr이 가진 // json 객체가 가진 각 필드(property) 값을 우출해서 vo 객체 (Notice)에 저장 for (int
	 * i = 0; i < jarr.size(); i++) { JSONObject job = (JSONObject) jarr.get(i);
	 * 
	 * Notice notice = new Notice(); notice.setNoticeTitle((String)
	 * job.get("title")); notice.setNoticeWriter((String) job.get("writer"));
	 * notice.setNoticeContent((String) job.get("content"));
	 * 
	 * // 새 공지글 등록 처리용 메소드 실행 int result = noticeService.insertNotice(notice); // 에러
	 * 발생 또는 공지글 등록 실패시 if (result <= 0) { return new
	 * ResponseEntity<String>("fiiled", HttpStatus.REQUEST_TIMEOUT); } } return new
	 * ResponseEntity<String>("success", HttpStatus.OK); }
	 */
	

}
