package org.edu.intertwine.user.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.edu.intertwine.admin.model.service.AdminService;
import org.edu.intertwine.common.FileNameChange;
import org.edu.intertwine.common.Notification;
import org.edu.intertwine.user.model.service.UserService;
import org.edu.intertwine.user.model.vo.MyPage;
import org.edu.intertwine.user.model.vo.NaverLoginAuth;
import org.edu.intertwine.user.model.vo.SocialLogin;
import org.edu.intertwine.user.model.vo.User;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;


@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private NaverLoginAuth naverLoginAuth;
	
	//뷰페이지 이동
	//회원가입
	@RequestMapping("enrollPage.do")
	public String moveEnrollPage() {
	return "user/enroll";
	}
	
	//아이디/비번찾기
	@RequestMapping("findInfo.do")
	public String moveFindInfoPage() {
		return "user/finduserInfo"; 
	}
	
	//휴면해제
	@RequestMapping("ustopclear.do")
	public String movestopClearPage() {
		return "user/stopPage"; 
	}
	
	
	//일반유저 정보수정
	@RequestMapping("userInfo.do")
	public String moveUserInfoPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		model.addAttribute("type", result);
		return "user/userInfo"; 
	}
	//회원가입시 이동페이지
	@RequestMapping("socialPage.do")
	public String moveSocialPage() {
		return "user/socialPage"; 
	}
	
	//메인화면이동
	@RequestMapping("main.do")
	public String moveMainPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		model.addAttribute("type", result);
		return "common/main";
	}
	
	//회원가입후 이동페이지
	@RequestMapping("socialUpdatePage.do")
	public String moveSocialUpdatePage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		model.addAttribute("type", result);
		return "user/socialUpPage"; 
	}

	//이용시간 페이지로 이동
	@RequestMapping("userTime.do")
	public String moveUserTimePage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		userService.updateUserTime(userService.selectMyPage(user.getUserId()));
		String time = userService.selectUserTime(user.getUserId());
		model.addAttribute("type", result);
		model.addAttribute("time", time);
		return "user/userTimePage";
	}
	//유저 계정 비활성화
	@RequestMapping("userStopPage.do")
	public String moveUserStopPage(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		model.addAttribute("type", result);
		return "user/userStopPage";
	}

	//요청 받아서 결과받는 메소드 --------------------------
	//로그인
	@RequestMapping(value="ulogin.do", method=RequestMethod.POST)
	public String userLogin(User user, HttpSession session, SessionStatus status,
			HttpServletResponse response, Model model) throws IOException {
	
	if(userService.selectAccountStatus(user.getUserId()) > 0) {
			return "redirect:ustopclear.do";
	}
	User loginUser = userService.selectUser(user.getUserId());
	
	if (loginUser != null  && this.bcryptPasswordEncoder.matches(user.getUserPwd(),
							  loginUser.getUserPwd())
							 ) {
		
		userService.updateDayTime(loginUser.getUserId());
		session.setAttribute("loginUser", loginUser);
		status.setComplete();
		
		if(adminService.selectVisitCount() != null) {
			adminService.updateVisitCount();
		} else {
			adminService.insertVisitCount();
		}
		
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
			if(naverLoginAuth.getAccessToken() != null && naverLoginAuth.getAccessToken().toString() != null) {
				naverLoginAuth.logOut(naverLoginAuth.getAccessToken().toString());
				session.invalidate();
				return "common/login";
			} else {
				logger.info(session.toString());
				session.invalidate();
				return "common/login";
			}
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
			userService.updateUserStatus(email);
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
			userService.insertMyPage(user.getUserId());
			userService.insertAlarm(user.getUserId());
			return "common/main";
		}
		return "user/enroll";
	}
	
	
	@RequestMapping("kakao_login.do")
	public String kakaoLogin(HttpServletRequest request, HttpSession session, Model model) throws Exception {
		User user = (User) session.getAttribute("loginUser");
		String result = "";
		result = userService.selectSocialType(user.getUserId());
		model.addAttribute("type", result);
		return "commom/main";
	}
			
	@RequestMapping("kakao_loginP.do")
	public String kakaoLoginMethod(HttpSession session, @RequestParam("kakaomail") String email, 
			@RequestParam("kakaoId") String userId,  SessionStatus status, Model model) throws Exception {
		User loginUser = null;
		User user = null;
		
		if(userService.selectAccountStatus(userId) > 0) {
			return "redirect:ustopclear.do";
		}
		
		if(userService.selectEmailCount(email) > 0) {
			loginUser = userService.selectEmail(email);
			
			if(loginUser != null) {
				session.setAttribute("loginUser", loginUser);
				status.setComplete();
				if(adminService.selectVisitCount() != null) {
	    			adminService.updateVisitCount();
	    		} else {
	    			adminService.insertVisitCount();
	    		}
				String result = "";
				result = userService.selectSocialType(loginUser.getUserId());
				userService.updateDayTime(loginUser.getUserId());
				
				model.addAttribute("type", result);
				return "redirect:main.do";
			} else {
				model.addAttribute("msg", "로그인에 실패했습니다. 관리자에게 문의하세요");
				model.addAttribute("url", "login.do");
				return "common/alert";
			}
		} else {
			int result = 0;
			user = new User();
			user.setUserId(userId);
			user.setEmail(email);
			result = userService.insertUser(user);
			
			SocialLogin social = new SocialLogin();
			social.setUserId(userId);
	    	social.setType("kakao");
	    	social.setUserTime(new java.sql.Date(new java.util.Date().getTime()));
	    	userService.insertSocial(social);
	    	userService.insertMyPage(user.getUserId());
	    	userService.insertAlarm(user.getUserId());
	    	
	    	if(result > 0) {
	    		loginUser = user;
	    		session.setAttribute("loginUser", loginUser );
	    		status.setComplete();
	    		if(adminService.selectVisitCount() != null) {
	    			adminService.updateVisitCount();
	    		} else {
	    			adminService.insertVisitCount();
	    		}
	    		return "redirect:socialPage.do";
	    	}
		return "login.do";
		}
		
	
	}
	private String result = null;
	//네이버 로그인 구현 ------------------------------------------------------------------------------------------
	@RequestMapping(value ="naver_login.do", produces = "application/json", method = { RequestMethod.GET, 	RequestMethod.POST })
	public String naverLogin(@RequestParam String code, SessionStatus status, Model model, 
			HttpSession session, @RequestParam String state) throws Exception{
		
		
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginAuth.getAccessToken(session, code, state);
		result = naverLoginAuth.getUserProfile(oauthToken);
		
		logger.info(result);
		JSONParser jsonParser = new JSONParser();
        JSONObject json;
        
        json = (JSONObject) jsonParser.parse(result);
        JSONObject response = (JSONObject)json.get("response");
        
        String email = String.valueOf(response.get("email"));
        String name = String.valueOf(response.get("name"));
        String userId = String.valueOf(response.get("id"));
        String phone = String.valueOf(response.get("mobile"));
        logger.info("email : " + email);
        User user = null;
        
        if(userService.selectEmailCount(email) > 0) {
        	if(userService.selectAccountStatus(userId) > 0) {
    			return "redirect:ustopclear.do";
    		}
        	
        	User loginUser = userService.selectEmail(email);
        	if(userService.selectAccountStatus(loginUser.getUserId()) > 0) {
				return "redirect:ustopclear.do";
			}
        	session.setAttribute("loginUser", loginUser);
        	userService.updateDayTime(loginUser.getUserId());
			status.setComplete();
			logger.info(loginUser.toString());
			if(adminService.selectVisitCount() != null) {
    			adminService.updateVisitCount();
    		} else {
    			adminService.insertVisitCount();
    		}
			return "redirect:main.do";
        	
        } else {
        	int result = 0;
        	user = new User();
        	user.setUserId(userId);
        	user.setEmail(email);
        	user.setPhone(phone);
        	user.setUserName(name);
        	result = userService.insertUser(user);
	    	
	    	if(result > 0) {
	    		SocialLogin social = new SocialLogin();
	        	social.setUserId(userId);
	        	social.setType("naver");
	        	social.setUserTime(new java.sql.Date(new java.util.Date().getTime()));
	        	userService.insertSocial(social);
	        	userService.insertMyPage(user.getUserId());
	        	userService.insertAlarm(user.getUserId());
	        	
        		User loginUser = user;
    			session.setAttribute("loginUser", loginUser);
    			status.setComplete();
    			if(adminService.selectVisitCount() != null) {
	    			adminService.updateVisitCount();
	    		} else {
	    			adminService.insertVisitCount();
	    		}
    			return "redirect:socialPage.do";
        	} else {
        		return "user/login";
        	}
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
		public String userchangePwdP(@RequestParam("phone") String phone, Model model) throws IOException {
		 
		 if (phone.startsWith("02")) {
	            if (phone.length() == 9) {
	              phone = phone.replaceAll("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	            } else if (phone.length() == 10) {
	            	phone = phone.replaceAll("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
	            }
	        } else if (phone.length() == 10) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (phone.length() == 11) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        }
		 User user = userService.selectPhone(phone);
		 
		 return "user/finduserInfo";
	 }
	 
	 @RequestMapping(value="updatePwd.do", method=RequestMethod.POST)
	 public String userchangePwdP(@RequestParam("userPwd") String pwd, @RequestParam("phone") String phone,
			 HttpServletResponse response) throws IOException {
		 if (phone.startsWith("02")) {
	            if (phone.length() == 9) {
	              phone = phone.replaceAll("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	            } else if (phone.length() == 10) {
	            	phone = phone.replaceAll("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
	            }
	        } else if (phone.length() == 10) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (phone.length() == 11) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        }
		 User user = userService.selectPhone(phone);
		 
		 String str = null;
		 user.setUserPwd(bcryptPasswordEncoder.encode(pwd));
		 int result = userService.updatePwd(user);
	 
		return "common/login";
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
		
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("NCS8OAISM6A6JWFI", "ZT4MPBGAQUWJAMUJZHQNMPSVEGQXNJLN", "https://api.coolsms.co.kr");
		
	    net.nurigo.sdk.message.model.Message message1 = new net.nurigo.sdk.message.model.Message();
		message1.setFrom("01022037375");
		message1.setTo(phone);
		message1.setText("인증번호는 " + key + " 입니다.");
		
		SingleMessageSentResponse response2 = messageService.sendOne(new SingleMessageSendingRequest(message1));
		
		if(response2 != null) { 
		if (phone.startsWith("02")) {
	            if (phone.length() == 9) {
	              phone = phone.replaceAll("(\\d{2})(\\d{3})(\\d{4})", "$1-$2-$3");
	            } else if (phone.length() == 10) {
	            	phone = phone.replaceAll("(\\d{2})(\\d{4})(\\d{4})", "$1-$2-$3");
	            }
	        } else if (phone.length() == 10) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{3})(\\d{4})", "$1-$2-$3");
	        } else if (phone.length() == 11) {
	        	phone = phone.replaceAll("(\\d{3})(\\d{4})(\\d{4})", "$1-$2-$3");
	        }
		 
		User user = userService.selectPhone(phone);
		if(user != null) {
			return key;
		} 
		
	 }
		 return "user/findInfo.do";
	 
		
	 }  


	 //유저 상세정보 조회및 업데이트
	 @RequestMapping(value="uupdate.do", method=RequestMethod.POST)
	 public String userInfoUpdate(User user, HttpSession session, Model model) {
		 User loginUser = (User) session.getAttribute("loginUser");
		 if(user != null) {
			 loginUser.setNickname(user.getNickname());
			 loginUser.setUserName(user.getUserName());
			 loginUser.setUserPwd(bcryptPasswordEncoder.encode(user.getUserPwd()));
			 loginUser.setPhone(user.getPhone());
			 loginUser.setAddress(user.getAddress());
			 
			 int result = userService.updateUser(loginUser);
			 if(result > 0) {
				 model.addAttribute("msg", "수정 성공!!");
				 model.addAttribute("url", "userInfo.do");
				return "common/alert";
			 } else {
				 model.addAttribute("msg", "수정 실패 관리자에게 문의하세요.");
				 model.addAttribute("url", "userInfo.do");
				 return "common/alert";
			 }
		 }
		 
		 return "common/main";
	 }
	 
	 
	 //소셜로그인 정보수정
	 @RequestMapping(value="usocialupdate.do", method=RequestMethod.POST)
	 public String userSocialInfoUpdate(User user, HttpSession session) {
		 User loginUser = (User) session.getAttribute("loginUser");
		 
		 if(user != null) {
			 loginUser.setNickname(user.getNickname());
			 loginUser.setPhone(user.getPhone());
			 loginUser.setAddress(user.getAddress());
			 loginUser.setUserName(user.getUserName());

		 }
		userService.updateSocial(loginUser);
		 return "common/main";
	 }
	 
	 @RequestMapping(value="getUserTime.do", method= {RequestMethod.POST, RequestMethod.GET})
	 public ResponseEntity<?> userUseTime(HttpSession session) throws UnsupportedEncodingException {
		 	User loginUser = (User) session.getAttribute("loginUser");
		 	String time = "";
	        if (loginUser != null) {
	        	
	        	Notification notify = userService.selectNotify(loginUser.getUserId());
	        	MyPage page = userService.selectMyPage(loginUser.getUserId());
	        	userService.updateUserTime(page);
	        	notify.setNotifyContent("접속 후" + page.getUserTime() + "분이 지났습니다.");
	        	userService.updateCustonAlarm(notify);
	        	
	        	 if(Integer.parseInt(userService.selectUserTime(loginUser.getUserId()).trim()) % 60 == 0) {
	        		 time = notify.getNotifyContent();
	        		 return ResponseEntity.ok(URLEncoder.encode(time, "utf-8"));
	        	 } else {
	        		 return ResponseEntity.notFound().build();
	        	 }
	        }
	        return ResponseEntity.notFound().build();
	    }
	 
	 
	 //마이페이지 시간 설정
	 @RequestMapping(value="customTime.do", method= {RequestMethod.POST,RequestMethod.GET})
	 public String customTimeMethod(HttpSession session,@RequestParam("message") String meassage,
			 Model model) {
		 User user = (User) session.getAttribute("loginUser");
		 Notification notify = userService.selectNotify(user.getUserId()); 
		 notify.setNotifyContent(meassage);
		 
		 int result = userService.updateCustonAlarm(notify);
		 
		 if(result > 0) {
			 return "user/userTimePage";
		 } else {
			 model.addAttribute("msg", "수정실패");
			 model.addAttribute("url", "user/userTimePage");
			 return "common/alert";
		 }
		 
	 }
	 
	 //기본제공 알림으로 변경
	 @RequestMapping(value="userSetTime.do", method= {RequestMethod.POST,RequestMethod.GET})
	 public String basicTimeMethod(HttpSession session, Model model) {
		 User user = (User) session.getAttribute("loginUser");
		 Notification notify = userService.selectNotify(user.getUserId());
		 if(Integer.parseInt(userService.selectUserTime(user.getUserId()).trim()) % 60 == 0) {
		 String message = "접속 후" + userService.selectUserTime(user.getUserId()) + "분이 지났습니다.";
		 notify.setNotifyContent(message);
		 }
		 int result = userService.updateCustonAlarm(notify);
		 
		 if(result > 0) {
			 model.addAttribute("msg", "수정성공");
			 model.addAttribute("url", "userTime.do");
			 return "common/alert";
		 } else {
			 model.addAttribute("msg", "수정실패");
			 model.addAttribute("url", "userTime.do");
			 return "common/alert";
		 }
		
	 }
	 
	 //계정 비활성화
	 @RequestMapping(value="udisable.do", method=RequestMethod.POST)
	 public String userDisabled(HttpSession session) {
		 User user = (User) session.getAttribute("loginUser");
		 userService.updateUserdisable(user.getUserId());
		return "성공";
	 }
	 
	 //계정 정지(탈퇴)
	 @RequestMapping(value="ustopdel.do", method=RequestMethod.POST)
	 public String userUpdate(HttpSession session) {
		 User user = (User) session.getAttribute("loginUser");
		 userService.insertUserStop(user.getUserId());
		 userService.updateUserStop(user.getUserId());
		return "성공";
	 }
	 
	 //마이페이지
	 @RequestMapping(value="myprofileupdate.do", method=RequestMethod.POST)
	 public String myPageselMethod (HttpSession session,User user, MyPage mypage,
				@RequestParam(name="ofile", required=false) MultipartFile mfile, Model model, HttpServletRequest request) {
		 
		String savePath = request.getSession().getServletContext().getRealPath(
		 					"resources/profile");
		logger.info(mfile.toString());
		if(!mfile.isEmpty()) {
				
			String fileName = mfile.getOriginalFilename();
			
			String renameFileName = null;
	
			if(fileName != null && fileName.length() > 0) {	
				renameFileName = FileNameChange.change(fileName, "yyyyMMddHHmmss");
				try {	
					mfile.transferTo(new File(savePath + "\\" + renameFileName));
				} catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("msg", "첨부파일 저장 실패!");
					model.addAttribute("url", "mypage.do");
					return "common/alert";
				}
			}
			mypage.setProfile(fileName);
			mypage.setProfileDraft("resources/profile/" + renameFileName);
			userService.updateMyPage(mypage);
				
			
		}
		return "redirect:mypage.do";
	}
	 
	  
} 
	 
	 



