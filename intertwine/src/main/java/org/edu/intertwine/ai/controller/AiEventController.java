package org.edu.intertwine.ai.controller;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.edu.intertwine.ai.model.service.AiEventService;
import org.edu.intertwine.ai.model.vo.AiEvent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller 
public class AiEventController {

	@Autowired 
	private AiEventService aiEventService;
	
	@RequestMapping("aieventgo.do")
	public String aiEventView() {
	    
	    return "ai/aiEventView";
	}
	
	@ResponseBody
	@RequestMapping(value = "sendaievent.do", method = {RequestMethod.POST, RequestMethod.GET}, produces = "text/plain;charset=UTF-8")
	public String processEvent(@RequestParam("keyword") String keyword, Model model) throws Exception {
		// 입력 받은 키워드를 기반으로 특정 키워드를 추출
	    String extractedKeyword = extractKeyword(keyword);
		
	    // 입력 받은 키워드를 사용하여 응답을 가져옴
	    ArrayList<AiEvent> aiEventList = aiEventService.selectAiEventByKeyword(extractedKeyword);
	    
	    // 응답이 있으면 해당 응답을 반환하고 없으면 기본 응답 반환
	    if (aiEventList != null && !aiEventList.isEmpty()) {
	        AiEvent aiEvent = aiEventList.get(0); // 첫 번째 응답을 가져옴
	        String content = aiEvent.getAiEventContent();
	        String link = aiEvent.getAiEventLink();
	        String name = aiEvent.getAiEventName();
	        if (link != null && !link.isEmpty()) {
	            return content + "\n" + "\n" + " <a href='" + link + "'>"+ name + "</a>"; // content와 link 반환
	        } else {
	            return content;
	        }
	    } else {
	        return "죄송해요, 잘 이해하지 못했어요. 다시 말해주실래요? 😕";
	    }
	}
	
	private String extractKeyword(String input) {
	    // 정규식 패턴을 이용하여 특정 키워드를 추출
		 Pattern pattern = Pattern.compile("안녕|날씨|음식|게시물|그래|Hello|구글|네이버|다음|나는");
	    Matcher matcher = pattern.matcher(input);

	    // 키워드를 찾으면 반환, 못 찾으면 입력된 키워드 그대로 반환
	    if (matcher.find()) {
	        return matcher.group();
	    } else {
	        return input;
	    }
	}













}
