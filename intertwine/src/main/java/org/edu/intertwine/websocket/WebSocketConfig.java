package org.edu.intertwine.websocket;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		//ChatHandler url 매핑
		registry.addHandler(new ChatHandler(), "/chat").withSockJS();
		//ViewChatting url 매핑
        registry.addHandler(new ViewChatting(), "/viewChat").withSockJS();
            
	}

}
