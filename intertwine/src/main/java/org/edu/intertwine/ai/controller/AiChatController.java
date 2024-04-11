package org.edu.intertwine.ai.controller;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.edu.intertwine.ai.model.service.AiChatService;
import org.edu.intertwine.ai.model.vo.AiChat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AiChatController {
	
	@Autowired
	private AiChatService aiChatService;
	
	@RequestMapping("aichatgo.do")
	public String aiChatView() {
	    
	    return "ai/aiChatView";
	}
	
	@ResponseBody
	@RequestMapping(value = "sendaichat.do", method = {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	public String processChat(@RequestParam("keyword") String keyword, Model model) throws Exception {
		// 입력 받은 키워드를 기반으로 특정 키워드를 추출
	    String extractedKeyword = extractKeyword(keyword);
		
	    // 입력 받은 키워드를 사용하여 응답을 가져옴
	    ArrayList<AiChat> aiChatList = aiChatService.selectAiChatByKeyword(extractedKeyword);
	    
	    // 응답이 있으면 해당 응답을 반환하고 없으면 기본 응답 반환
	    if (aiChatList != null && !aiChatList.isEmpty()) {
	        AiChat aiChat = aiChatList.get(0); // 첫 번째 응답을 가져옴
	        String Content = aiChat.getAiChatContent();
	        return Content;
	    } else {
	        return "죄송해요, 잘 이해하지 못했어요. 다시 말해주실래요? 😕";
	    }
	}
	
	private String extractKeyword(String input) {
	    // 정규식 패턴을 이용하여 특정 키워드를 추출
		 Pattern pattern = Pattern.compile("안녕|날씨|음식|피드|스퀘어|친구|나는|이름");
	    Matcher matcher = pattern.matcher(input);

	    // 키워드를 찾으면 반환, 못 찾으면 입력된 키워드 그대로 반환
	    if (matcher.find()) {
	        return matcher.group();
	    } else {
	        return input;
	    }
	}
}
