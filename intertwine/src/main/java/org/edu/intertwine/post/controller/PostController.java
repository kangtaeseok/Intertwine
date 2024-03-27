package org.edu.intertwine.post.controller;

import java.io.UnsupportedEncodingException;

import org.edu.intertwine.post.model.vo.Like;
import org.edu.intertwine.post.model.vo.Post;
import org.edu.intertwine.post.model.vo.Tag;
import org.edu.intertwine.post.service.PostService;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PostController {

	private static final Logger logger = LoggerFactory.getLogger(PostController.class);
	@Autowired
	private PostService postService; // 다형성 이용 (동적바인딩)

	// 게시글 공감 추가 및 업데이트 **완료**
	// Ajax 비동기 통신 비동기 통신은 @ResponseBody 태그 추가
	@RequestMapping(value = "######################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public String updateLike(Like like, Model model) {

		// 먼저 이 포스트에 이 유저가 공감을 표시한 적이 있는 지 확인
		// 1은 있음 0은 없음 0의 경우 insert 1의 경우 업데이트 / 또는 제거
		if (postService.selectLikeCount(like) > 0) {
			// 이 유저가 이 포스트에 공감한 적이 있는 지 체크
			
			if (postService.selectSameLikeCount(like) > 0) {
				// 그럼 같은 공감을 클릭한건지 아닌지 확인
				// 같은 공감이 한 번 더 클릭됨 -> 삭제조치
				int check = postService.deleteLike(like);
				if (check > 0) {
					// 성공 시 일어날 이벤트 기술 미정**************************************
					return "";
				} else {
					// 실패 시 에러 메시지
					model.addAttribute("message", "문제가 발생하였습니다.");
					return "common/error";
				}
			} else {
				// 다른 공감이 클릭됨 -> 업데이트
				int check = postService.updateLike(like);
				if (check > 0) {
					// 성공 시 일어날 이벤트 기술 미정**************************************
					return "";
				} else {
					// 실패 시 에러 메시지
					model.addAttribute("message", "문제가 발생하였습니다.");
					return "common/error";
				}
			}

		} else {
			// 공감한 적이 없다면 공감 추가
			int check = postService.insertLike(like);
			if (check > 0) {
				// 성공 시 일어날 이벤트 기술 미정**************************************
				return "";
			} else {
				// 실패 시 에러 메시지
				model.addAttribute("message", "문제가 발생하였습니다.");
				return "common/error";
			}

		}

	}//updatelike 메소드 끝

	// 마이 페이지에 포스트 불러오기 **수정필요**
	// 인피니트 로딩의 경우
	@RequestMapping(value = "######################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView getPostsForMyPage(Post post, ModelAndView mv) throws UnsupportedEncodingException {
		
		//포스트 카운트를 확인 함
		int postCount = postService.selectPostsCountForMyPage(post);
		if( postCount > 0 ) {
			//모든걸 불러오진 않고 항상 15개씩 최신순 불러옴
			//불러올 정보 : 포스트/사진/공감/댓글
			JSONArray jarr = new JSONArray();
			
			
			
			
		} else {
			mv.addObject("message", "아직 작성된 포스트가 없습니다.");
			
		}
		
	}
	
	//피드에 포스트 불러오기 **수정필요**
	@RequestMapping(value = "#####################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	@ResponseBody
	public ModelAndView getPostsForFeed(Post post, ModelAndView mv, @RequestParam("checked")int checked) {
		//JS에서 넘겨받은 변수로 확인한 포스트 갯수 확인 JS에서 계속 합쳐서 보내야함
		int postCount = postService.selectPostsCountForFeed(post);
		
		//포스트 갯수 확인
		if(postCount > 0) {
			int leftCount = postCount - checked;
			//포스트가 1개 이상 있을 시
			//JS에서 갯수를 받아서 남은 볼 수 있는 포스트 갯수 설정
			//JS에서 계속 갯수를 합산해야함
			if(leftCount > 0) {
				
			} else {
				//더 이상 확인하지 않은 포스트가 없을 경우
				mv.addObject("message", "확인 가능한 모든 포스트를 확인했어요");
			}
		}else {
			//어떤 포스트도 없을 경우
			mv.addObject("message", "아직 포스트가 없습니다.");
			mv.setViewName("common/error");
		}
		
		return mv;
	}//getPostsForFeed 끝
	
	//포스트 개별 프라이버시 설정 업데이트 **완료**
	public String updatePrivacy(Post post, Model model) {
		//뷰에서 포스트 아이디와 게시물 아이디 확인 및 값 얻어옴
		//뷰에서 본인인지 아닌지 확인하므로 여기선 그냥 업데이트만 수행
		
		//업데이트 수행 및 리턴 확인
		int check = postService.updatePrivacy(post);
		if(check > 0) {
			//성공 시 수행할 것 정의
			return "";
		} else {
			// 실패 시 에러 메시지
			model.addAttribute("message", "문제가 발생하였습니다.");
			return "common/error";
		}		
	}//updatePrivacy
	
	@RequestMapping(value="***.do", method=RequestMethod.POST)
	public String addTag(Tag tag, Model model) {
		//포스트에서 태그를 추가함 이미 포스트에 대한 아이디가 발급됨
		//거기서 태그가 추가됨 포스트 아이디 태그네임 전달받음
		//전달받은 두 컴비네이션이 존재하는지 확인
		int check1 = postService.selectTagCount(tag);
		
		//0일 시 추가
		if(check1 == 0) {
			int check2 = postService.insertTag(tag);
			if(check2 == 1) {
				//성공시 수행할 작업
				return "";
			}else {
				model.addAttribute("message", "태그 추가에 문제가 발생했습니다.");
				return "common/error";
			}
		} else {
			//1일 시 에러
			model.addAttribute("message", "이미 있는 태그입니다.");
			return "common/error";
		}
		

	}
	
	public String removeTag(Tag tag, Model model) {
		//포스트에서 태그를 제거
		//거기서 태그가 제거됨 포스트 아이디 태그네임 전달받음
		//전달받은 두 컴비네이션이 존재하는지 확인
		//없으면 제거 불가
		int check1 = postService.selectTagCount(tag);
		
		//1일 시 확인된 태그 제거함
		if(check1 == 1) {
			int check2 = postService.deleteTag(tag);
			if(check2 == 1) {
				//성공시 수행할 작업
				return "";
			}else {
				model.addAttribute("message", "태그 제거에 문제가 발생했습니다.");
				return "common/error";
			}
			
		} else {
			//0일 시 없는 태그를 찾음 
			model.addAttribute("message", "존재하지 않는 태그입니다.");
			return "common/error";
		}
	}
	
	//최근 공감 3개 불러오기 (개별 포스트 카드에서 사용)
	@RequestMapping(value = "######################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String getLastest3Likes() {
		//불러와야 하는 것 최근 공감 3개 타입과 사진, 닉네임 
		//또한 이들은 클릭 가능해야함
	}//getLastest3Likes

	
	//포스트 제거
	@RequestMapping(value = "######################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String removePost(Post post, Model model) {
		//아마도 그냥 세션 확인해서 사용자 id와 지우려는 포스트의 사용자 id확인은 c태그로 할듯
		//그래야 관리자 역시 지울 수 있음 그 포스트를 만든 사용자가 아닐 경우 그냥 삭제버튼을 가려버림
		//지울 수 있는 사람의 경우 지울 postId 넘겨받아 지워버림
		int check = postService.deletePost(post);
		
		if(check == 1) {
			//성공시 수행할 작업
			return "";
		}else {
			model.addAttribute("message", "포스트 제거에 문제가 발생했습니다.");
			return "common/error";
		}
		//하지만 같이 딸린 공감, 댓글, 태그 지워짐 -> 트리거로 해결함
		

	}
	
	@RequestMapping(value = "######################미완성############################.do", method = { RequestMethod.POST, RequestMethod.GET })
	public 

}
