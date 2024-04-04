
package org.edu.intertwine.friend.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.edu.intertwine.friend.model.service.FriendService;
import org.edu.intertwine.friend.model.vo.Friend;
import org.edu.intertwine.user.model.service.UserService;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class FriendController { // 로그 객체 생성 (메소드 동작 확인 및 전달값, 리턴값확인)


}