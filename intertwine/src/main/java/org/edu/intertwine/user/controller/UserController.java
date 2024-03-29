package org.edu.intertwine.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;

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
	@RequestMapping("idchk.do")
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
	@RequestMapping("emailchk.do")
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
	public String userEnroll(User user) {
		logger.info("uinsert.do : " + user.toString());
		
		user.setUserPwd(bcryptPasswordEncoder.encode(user.getUserPwd()));
		
		if(userService.insertUser(user) > 0) {
			return "common/main";
		}
		return "user/enroll";
	}
	
	@RequestMapping(value="kakao_login.do", method=RequestMethod.POST)
	public String kakaoLogin() {
		return "";
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
	 @RequestMapping("emailAuth.do")
	 public ResponseEntity<String> sendAuth(@RequestParam("auth") String authNum) {
		 if(Integer.parseInt(authNum) == random) { 
			  return new ResponseEntity<String>("이메일 인증 성공!", HttpStatus.OK);
		  } else {
			  return new ResponseEntity<String>("이메일 인증 실패!", HttpStatus.REQUEST_TIMEOUT);
		 } 
	}
	 
	 //아이디 찾기
	 @RequestMapping("idsearch.do")
		public void userSearchId(@RequestParam("email") String email, HttpServletResponse response) throws IOException {
		 User user = userService.selectEmail(email);
		 logger.info(user.toString());
		 String returnStr = null;
		 if(user != null) {
			 returnStr = user.getUserId();
		 } else {
			 returnStr ="none";
		 }

		response.setContentType("text/html' charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(returnStr);
		out.flush();
		}
	 
	 
	//비번찾기처리
	 @RequestMapping("changePwd.do")
		public void userchangePwd(@RequestParam("pemail") String email, 
				@RequestParam("pwd") String pwd, HttpServletResponse response) throws IOException {
		 User user = userService.selectEmail(email);
		 user.setUserPwd(bcryptPasswordEncoder.encode(pwd));
		 String str = null;
		 int result = userService.updatePwd(user);
		 
		 if(result > 0) {
			 str = "ok";
			 logger.info(str);
		 } else {
			 str = "dup";
		 }
		 response.setContentType("text/html' charSet=utf-8");
		PrintWriter out = response.getWriter();
		out.append(str);
		out.flush();
	 }
	 
	/*
	 * udetail.do
	 * 
	 * userDetail()
	 */
	 
}


