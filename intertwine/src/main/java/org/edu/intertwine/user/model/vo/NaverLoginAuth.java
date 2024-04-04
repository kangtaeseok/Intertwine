package org.edu.intertwine.user.model.vo;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.client.RestTemplate;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component("naverLoginAuth")
public class NaverLoginAuth {
	private final static String CLIENT_ID = "Ke8ILgdUZL4ESEsHC80z";
	private final static String CLIENT_SECRET = "rMFNP_YqYj";
	private final static String REDIRECT_URI = "http://localhost:8080/intertwine/naver_login.do";
	private final static String SESSION_STATE = "oauth_state";
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	public String getAuthorizationUrl(HttpSession session) {
		String state = generateRandomString();
		setSession(session, state);	
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
	
		return oauthService.getAuthorizationUrl();

	}
	OAuth2AccessToken accessToken;
	public OAuth2AccessToken getAccessToken() {
		return accessToken;
	}
	
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException {
	
		/* Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인 */
		String sessionState = getSession(session);
		if (StringUtils.pathEquals(sessionState, state)) {
	
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
	
			/* Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득 */
			accessToken = oauthService.getAccessToken(code);
			return accessToken;

		}
		return null;
	}



	private String generateRandomString() {
	return UUID.randomUUID().toString();
	}

	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	private String getSession(HttpSession session) {
		return (String) session.getAttribute(SESSION_STATE);
	}
	public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException {
	
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI).build(NaverLoginApi.instance());
	
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();

	}
	
	public void logOut(String oauthToken) {
		String baseURL;
		ResponseEntity<String> response;
		RestTemplate template = new RestTemplate();
		System.out.println("네이버 로그아웃실행...");
		baseURL = "http://nid.naver.com/nidlogin.logout";
		try {
			URL url = new URL(baseURL);
			try {

				response = template.getForEntity(baseURL, String.class);

				System.out.println(response.getBody());

				/*
				 * HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				 * conn.setRequestMethod("GET"); conn.setDoOutput(true); conn.disconnect();
				 */

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (MalformedURLException e) {
			e.printStackTrace();
		}

	}



}	
