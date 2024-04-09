package org.edu.intertwine.map.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.edu.intertwine.common.Paging;
import org.edu.intertwine.common.Search;
import org.edu.intertwine.map.model.service.MapService;
import org.edu.intertwine.map.model.vo.Attraction;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MapController {
	
	private static final Logger logger = LoggerFactory.getLogger(MapController.class);
	
	@Autowired
	private MapService mapservice;
	
	
	@RequestMapping("movemap.do")
	public String movemapPage(Model model) throws UnsupportedEncodingException {
		ArrayList<Attraction> list = mapservice.selectAttraction();
		JSONArray jarr = new JSONArray();

		for (Attraction attraction : list) {
			JSONObject job = new JSONObject();

			job.put("id", attraction.getAttractionId());
			job.put("name", URLEncoder.encode(attraction.getAttractionName(), "utf-8"));
			job.put("address", URLEncoder.encode(attraction.getAttractionAddress(), "utf-8"));
			job.put("lat", attraction.getAttractionLat());
			job.put("lon", attraction.getAttractionLon());
			job.put("park", attraction.getAttractionPark());
			job.put("description", URLEncoder.encode(attraction.getAttractionDescription(), "utf-8"));
			job.put("institutionName", URLEncoder.encode(attraction.getAttractionInstitutionName(), "utf-8"));
			job.put("institutionPhone", URLEncoder.encode(attraction.getAttractionInstitutionPhone(), "utf-8"));
			job.put("date", attraction.getAttractiondate().toString());

			jarr.add(job);
		}

		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		model.addAttribute("sendJson", sendJson);
		
		return "map/mapMap";
	}
	
	//관광지 검색 처리용 메소드
	@RequestMapping(value="asearchTitle.do", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mapSearchTitleMethod(
			
			@RequestParam(name="action", required=false) String action,
			@RequestParam("keyword") String keyword,
			@RequestParam(name="limit", required=false) String slimit,
			@RequestParam(name="page", required=false) String page,
			ModelAndView mv) {
		
				int currentPage = 1;
				if(page != null && page.length() > 0) {
					currentPage = Integer.parseInt(page);
				}
				
				int limit = 5;
				if(slimit != null && slimit.length() > 0) {
					limit = Integer.parseInt(slimit);
				}
				
				//검색결과가 적용된 총 페이지 계산을 위한 총 목록 갯수 조회
				int listCount = mapservice.selectSearchTitleCount(keyword);
				
				//뷰 페이지에 사용할 페이징 관련 값들 계산 처리
				Paging paging = new Paging(listCount, currentPage, limit, "asearchTitle.do");
				paging.calculate();
				
				//한 페이지에 출력할 검색 결과 적용된 목록 조회
				Search search = new Search();
				search.setStartRow(paging.getStartRow());
				search.setEndRow(paging.getEndRow());
				search.setKeyword(keyword);
				
				Attraction attraction = mapservice.selectSearchTitle(keyword);
				System.out.println("출력" + attraction.getAttractionName());
				//받은 결과에 따라 성공/실패 페이지 내보내기
				if(attraction != null) {
					mv.addObject("attraction", attraction);
					mv.addObject("paging", paging);
					mv.addObject("currentPage", currentPage);
					mv.addObject("action", action);
					mv.addObject("keyword", keyword);
					mv.addObject("limit", limit);
					
				
					mv.setViewName("map/mapMap");
					
				}else {
					mv.addObject("message", action + "에 대한 " + keyword + "검색 결과가 존재하지 않습니다.");
					mv.setViewName("common/error");
				}
				
				return mv;
			}
	
		
	
	
	
	

}
