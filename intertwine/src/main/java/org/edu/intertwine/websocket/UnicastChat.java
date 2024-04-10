package org.edu.intertwine.websocket;

import java.io.IOException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/UnicastChat/{loginUser}/{chatId}")
public class UnicastChat {
	// 연결한 사용자 리스트
		// 단 한 사용자가 2번 연결하면 안되기 때문에
		// Set을 통해 연결 정보에 대한 중복을 배재한다.
//	private static Map<Session, String> sessionUserIdMap = new ConcurrentHashMap<>();
//    private static Map<String, Session> userIdSessionMap = new ConcurrentHashMap<>();
	private static Map<String, Map<String, Session>> chatSessionMap = new ConcurrentHashMap<>();
		
		@OnOpen
		public void onOpen(Session session, @PathParam("loginUser") String loginUser, @PathParam("chatId") String chatId){
			// 서버에 연결한 시점에 동작하는 메소드
//			System.out.println(session);
//			
//			// 기존 사용자 리스트에 새로 연결 요청이
//			// 들어온 사용자를 추가한다.
//			clients.add(session);
//			 sessionUserIdMap.put(session, loginUser);
//		        userIdSessionMap.put(loginUser, session);
//		        System.out.println("Session opened, user id: " + loginUser);
			 chatSessionMap.putIfAbsent(chatId, new ConcurrentHashMap<>());
		        chatSessionMap.get(chatId).put(loginUser, session);
		        System.out.println("Session opened, user id: " + loginUser + ", chat id: " + chatId);
		}
		
		@OnMessage
		 public void onMessage(
				 String message, Session session,  @PathParam("chatId") String chatId) throws IOException{
		
			 // 메시지를 채팅방의 모든 사용자에게 보내기
			 System.out.println("Message in chat " + chatId + ": " + message);
		    Map<String, Session> users = chatSessionMap.get(chatId);
		    if (users != null) {
		        for (Session s : users.values()) {
		            if (s.isOpen()) {
		                try {
		                    s.getBasicRemote().sendText(message);
		                } catch (IOException e) {
		                    e.printStackTrace();
		                }
		            }
		        }
		    }
			
		}
		 
		@OnError
		public void onError(Throwable e){
			// 데이터 전달 과정에서 에러가
			// 발생할 경우 수행하는 메소드
			
			e.printStackTrace();
		}
		
		@OnClose
		public void onClose(Session session,  @PathParam("loginUser") String loginUser, @PathParam("chatId") String chatId){
//			 String userId = sessionUserIdMap.remove(session);
//		        userIdSessionMap.remove(userId);
//		        System.out.println("Session closed, user id: " + userId);
			  Map<String, Session> chat = chatSessionMap.get(chatId);
		        if (chat != null) {
		            chat.remove(loginUser);
		            if (chat.isEmpty()) {
		                chatSessionMap.remove(chatId);
		            }
		        }
		        System.out.println("Session closed, user id: " + loginUser + ", chat id: " + chatId);
		}

}
