package org.edu.intertwine.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.OAuthToken;
import org.edu.intertwine.user.model.vo.SocialLogin;
import org.edu.intertwine.user.model.vo.User;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.RestTemplate;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private UserService userService;
	
	//뷰페이지 이동
	
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
	return "user/enroll";
	}
	
	@RequestMapping("findInfo.do")
	public String moveMainPage() {
		return "user/finduserInfo"; 
	}
	
	@RequestMapping("userInfo.do")
	public String moveUserInfoPage() {
		return "user/userInfo"; 
	}
	
	
	//요청 받아서 결과받는 메소드 --------------------------
	//로그인
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	public String userLogin(User user, HttpSession session, SessionStatus status,
			HttpServletResponse response, Model model) throws IOException {
	User loginUser = userService.selectUser(user.getUserId());

	if (loginUser != null  && this.bcryptPasswordEncoder.matches(user.getUserPwd(),
							  loginUser.getUserPwd())
							 ) {
		session.setAttribute("loginUser", loginUser);
		status.setComplete();
		  return "common/main";
	} else {
		model.addAttribute("msg", "암호나 아이디가 일치하지 않습니다. 다시 확인해주세요.");
		model.addAttribute("url", "login.do");
		 return "common/alert";
	 } 
	}
	
	//로그아웃
	@RequestMapping("ulogout.do")
	public String userLogout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			session.invalidate();
			return "common/login";
		}
		return "common/main";
	}
	
	//아이디체크
	@RequestMapping(value="idchk.do", method=RequestMethod.POST)
	public void userCheckId(@RequestParam("userid") String userId, HttpServletResponse response) throws IOException {
	int idCount = userService.selectUserCount(userId);
	String returnStr = null;
		if(idCount == 0) {
			returnStr = "ok";
		} else {
			returnStr = "dup";
		}

	response.setContentType("text/html' charSet=utf-8");
	PrintWriter out = response.getWriter();
	out.append(returnStr);
	out.flush();
	out.close();
	}
	
	//이메일 체크
	@RequestMapping(value="emailchk.do", method=RequestMethod.POST)
	public void userCheckEmail(@RequestParam("email") String email, HttpServletResponse response) throws IOException {
	int idCount = userService.selectEmailCount(email);
	String returnStr = null;
		if(idCount == 0) {
			returnStr = "ok";
		} else {
			returnStr = "dup";
		}

	response.setContentType("text/html' charSet=utf-8");
	PrintWriter out = response.getWriter();
	out.append(returnStr);
	out.flush();
	out.close();
	}
	
	//회원등록
	@RequestMapping(value="uinsert.do", method=RequestMethod.POST)
	public @ResponseBody String userEnroll(User user) {
		logger.info("uinsert.do : " + user.toString());
		
		user.setUserPwd(bcryptPasswordEncoder.encode(user.getUserPwd()));
		
		if(userService.insertUser(user) > 0) {
			return "common/main";
		}
		return "user/enroll";
	}
	
	
	
	@ResponseBody
	@RequestMapping("kakao_login.do")
	public String kakaoLogin(HttpServletRequest request, HttpServletResponse response,HttpSession session) throws Exception {
		logger.info("request 에 담아서 온 파라매터 이름들 : " + request.getParameterNames());
		logger.info("response 에 담긴 정보 : " + response.getContentType());
	
			

//		User user = null;
//		if(userService.selectEmailCount(email) > 0) {
//			session.setAttribute("loginUser", userService.selectUser(userId));
//			return "common/main";
//			
//		} else {
//			user = new User();
//			user.setUserId(userId);
//			user.setEmail(email);
//			
//			SocialLogin social = new SocialLogin();
//			social.setUserId(userId);
//	    	social.setType("kakao");
//	    	social.setUserTime(new java.sql.Date(new java.util.Date().getTime()));
//	    	
//	    	session.setAttribute("loginUser", userService.insertUser(user));
//			
//
//		return "common/main";
//		}
		return "" + response;
	
    }
	
	
	
	
	@RequestMapping("naver_login.do")
	public String naverLogin(@RequestParam("code") String code, HttpSession session
			) throws ParseException {
		RestTemplate rt = new RestTemplate(); 
		
		HttpHeaders headers= new HttpHeaders();
		headers.add("Content-type","application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String,String> params = new LinkedMultiValueMap<>();
		params.add("grant_type", "authorization_code");
		params.add("client_id", "Ke8ILgdUZL4ESEsHC80z");
		params.add("state", "1234");
		params.add("client_secret", "rMFNP_YqYj");
		params.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = 
		new HttpEntity<>(params, headers);

		ResponseEntity<String> response =rt.exchange(
	    "https://nid.naver.com/oauth2.0/token",
	    HttpMethod.POST,
	    kakaoTokenRequest,
	    String.class
		);
		
		 JSONParser jp = new JSONParser();
		 OAuthToken oauthToken = new OAuthToken();
		 JSONObject jsonObject = (JSONObject) jp.parse(response.getBody());

	    oauthToken.setAccess_token((String) jsonObject.get("access_token"));
	    oauthToken.setToken_type((String) jsonObject.get("token_type"));
	    oauthToken.setRefresh_token((String) jsonObject.get("refresh_token"));
	    oauthToken.setExpires_in(Integer.parseInt(String.valueOf(jsonObject.get("expires_in"))));
		 
	    HttpHeaders headers2 = new HttpHeaders();
	    headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
	    headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		    
		HttpEntity<MultiValueMap<String, String>> kakaoProfileRequest = new HttpEntity<>(headers2);

		ResponseEntity<String> response2 = rt.exchange(
	        "https://openapi.naver.com/v1/nid/me",
	        HttpMethod.GET,
	        kakaoProfileRequest,
	        String.class
		);
		
		JSONObject naver = (JSONObject) jp.parse(response2.getBody());
		JSONObject naverAccount = (JSONObject) naver.get("response");
		
		String userId = (String) naverAccount.get("id"); 
		String email = (String) naverAccount.get("email");
		String phone = (String) naverAccount.get("mobile");
		String name = (String) naverAccount.get("name");
		String nickname = (String) naverAccount.get("nickname");
		
		User user = null;
		if(userService.selectEmailCount(email) > 0) {
			session.setAttribute("loginUser", userService.selectUser(userId));
			return "common/main";
			
		} else if(email != null) {
			user = new User();
			user.setUserId(userId);
			user.setEmail(email);
			user.setUserName(name);
			user.setNickname(nickname);
			user.setPhone(phone);
			
			SocialLogin social = new SocialLogin();
	    	social.setUserId(userId);
	    	social.setType("naver");
	    	social.setUserTime(new java.sql.Date(new java.util.Date().getTime()));
	    	
	    	session.setAttribute("loginUser", userService.insertUser(user));
			
	    	return "common/main";
		} else {
			return "common/error";
		}
		
		
	}

	
	
	
	private static int random;
	
	//이메일 보내기
	@RequestMapping(value="postEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendEmail(@RequestParam("email") String email) {
		random = new Random().nextInt(1000000);
		
		MimeMessagePreparator smm = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
			 mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(URLDecoder.decode(email, "utf-8")));
			 mimeMessage.setFrom("noreply@baeldung.com");
			 mimeMessage.setSubject("Intertwine 에서 보낸 메일입니다.");
			 mimeMessage.setText("인증 번호는 : " + random + "입니다.");
	            }
	    };
		mailSender.send(smm);
		return "전송완료";
	}
	
	//이메일 인증 성공여부
	 @RequestMapping(value="emailAuth.do", method=RequestMethod.POST)
	 public ResponseEntity<String> sendAuth(@RequestParam("auth") String authNum) {
		 if(Integer.parseInt(authNum) == random) { 
			  return new ResponseEntity<String>("이메일 인증 성공!", HttpStatus.OK);
		  } else {
			  return new ResponseEntity<String>("이메일 인증 실패!", HttpStatus.REQUEST_TIMEOUT);
		 } 
	}
	 
	 //아이디 찾기(이메일)
	 @RequestMapping(value="emailsearch.do", method=RequestMethod.POST)
		public void userSearchIdEmail(@RequestParam("email") String email, HttpServletResponse response) throws IOException {
		 User user = userService.selectEmail(email);

		 String returnStr = null;
		 if(user != null) {
			 returnStr = user.getUserId();
		 } else {
			 returnStr ="none";
		 }

		response.setContentType("text/html; charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
		}
	 
	
	 
	 
	 
	//비번찾기처리(email)
	 @RequestMapping(value="changePwd.do", method=RequestMethod.POST)
		public void userchangePwd(@RequestParam("pemail") String email, 
				@RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {
		 User user = userService.selectEmail(email);
		 user.setUserPwd(bcryptPasswordEncoder.encode(pwd));
		 String str = null;
		 int result = userService.updatePwd(user);
		 
		 if(result > 0) {
			 str = "ok";
		 } else {
			 str = "dup";
		 }
		 response.setContentType("text/html; charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(str);
		out.flush();
		out.close();
	 }
	 
	//비번찾기처리(phone)
	 @RequestMapping(value="changePwdP.do", method=RequestMethod.POST)
		public void userchangePwdP(@RequestParam("phone") String phone, 
				@RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {
		 User user = userService.selectEmail(phone);
		 String str = null;
		 user.setUserPwd(bcryptPasswordEncoder.encode(pwd));
		 int result = userService.updatePwd(user);
		 
		 if(result > 0) {
			 str = "ok";
		 } else {
			 str = "dup";
		 }
		 response.setContentType("text/html; charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(str);
		out.flush();
		out.close();
	 }
	

	 //전화번호로 id 찾기
	 @RequestMapping(value="phonesearch.do", method=RequestMethod.POST)
		public void userSearchIdPhone(@RequestParam("phone") String phone, HttpServletResponse response) throws IOException {
		 User user = userService.selectPhone(phone);
		 String returnStr = null;
		 if(user.getUserId() != null) {
			 returnStr = user.getUserId();
		 } else {
			 returnStr = "none";
		 }

		response.setContentType("text/html; charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		out.close();
		}
	 
	//전화번호로 pwd 찾기
	 @ResponseBody
	 @RequestMapping(value="phonesearchpwd.do", method=RequestMethod.POST)
	 public String sendSMS(HttpServletResponse response, @RequestParam("phone") String phone) throws Exception { // 휴대폰 문자보내기
		 String key = String.valueOf(new Random().nextInt(1000000));
		
		 //DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCS8OAISM6A6JWFI", "ZT4MPBGAQUWJAMUJZHQNMPSVEGQXNJLN", "https://api.coolsms.co.kr");
		
	    //net.nurigo.sdk.message.model.Message message1 = new net.nurigo.sdk.message.model.Message();
		//message1.setFrom("01022037375");
		//message1.setTo(phone);
		//message1.setText("인증번호는 " + key + " 입니다.");
		
		//SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message1));
		
		 // if(response != null) { 
		//		return phone;
		//} else {
		//		return "fail";
		//}
		User user = userService.selectPhone(phone);
		 
		if( user.getUserId() != null) {
			return key;
		} else {
			return "not result";
		}
	 }
	 
	 //유저 상세정보 조회
//	 @RequestMapping(value="udetail.do", method=RequestMethod.POST)
//	 public void userDetail(User user) {
//		 
//		 
//		 
//		 
//		 
//	 }
	 
//	 @RequestMapping(value="uupdate.do", method=RequestMethod.POST)
//	 public String userInfoUpdate() {}
//	 
//	 
//	 
//	 @RequestMapping(value="udisable.do", method=RequestMethod.POST)
//	 public String userDisabled() {}
//	 
//	 
//	 
//	 @RequestMapping(value="publicuset.do", method=RequestMethod.POST)
//	 public String publicMypagesetting() {}
//	 
//	 
//	 
//	 
//	 @RequestMapping(value="ustopdel.do", method=RequestMethod.POST)
//	 public String userUpdate() {}
	
	 
	 
	 
}


