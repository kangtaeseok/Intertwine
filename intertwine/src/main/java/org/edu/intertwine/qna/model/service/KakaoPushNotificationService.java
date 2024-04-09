package org.edu.intertwine.qna.model.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class KakaoPushNotificationService {

    public void sendPushNotification() {
        String url = "https://kapi.kakao.com/v2/push/send";
        String serviceAppAdminKey = "YOUR_SERVICE_APP_ADMIN_KEY";

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "KakaoAK " + serviceAppAdminKey);

        String requestBody = "{\"for_apns\":{\"badge\":3,\"sound\":\"sound_file\",\"push_alert\":true,\"content-available\":1,\"category\":\"INVITE_CATEGORY\",\"message\":\"홍길동님 외 2명이 댓글을 달았습니다.\",\"custom_field\":{\"article_id\":\"111\",\"comment_id\":\"222\"}},\"for_fcm\":{\"collapse\":\"articleId123\",\"delay_while_idle\":false,\"time_to_live\":17200,\"dry_run\":false,\"priority\":\"high\",\"custom_field\":{\"article_id\":111,\"comment_id\":222,\"comment_preview\":\"나의 댓글을 받아랏!...(생략)\"}}}";

        HttpEntity<String> requestEntity = new HttpEntity<>(requestBody, headers);

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> responseEntity = restTemplate.exchange(url, HttpMethod.POST, requestEntity, String.class);

        if (responseEntity.getStatusCode() == HttpStatus.OK) {
            System.out.println("푸시알람이 성공적으로 전송되었습니다.");
        } else {
            System.out.println("푸시알람 전송에 실패했습니다. 상태 코드: " + responseEntity.getStatusCodeValue());
        }
    }

    public static void main(String[] args) {
        KakaoPushNotificationService service = new KakaoPushNotificationService();
        service.sendPushNotification();
    }
	
	
	
}
