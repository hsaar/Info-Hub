package com.infohub.project.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import org.springframework.http.HttpMethod;

import org.springframework.util.LinkedMultiValueMap;

@Service
public class KakaoService {
	
	 
	public LoginDTO getUserInfo(String accessToken) {
		RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Bearer " + accessToken);
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<?> request = new HttpEntity<>(headers);

        ResponseEntity<Map> response = restTemplate.exchange(
            "https://kapi.kakao.com/v2/user/me",
            HttpMethod.POST,
            request,
            Map.class
        );

        Map<String, Object> body = response.getBody();

        Map<String, Object> kakaoAccount = (Map<String, Object>) body.get("kakao_account");
        Map<String, Object> profile = kakaoAccount != null ? (Map<String, Object>) kakaoAccount.get("profile") : null;

        LoginDTO user = new LoginDTO();
        user.setKakaoId(body.get("id") != null ? Long.valueOf(body.get("id").toString()) : null);
        user.setName(profile != null && profile.get("nickname") != null ? profile.get("nickname").toString() : "Unknown");
        user.setEmail(kakaoAccount != null && kakaoAccount.get("email") != null ? kakaoAccount.get("email").toString() : "");

        return user;
    }

    // accessToken 요청 메서드 (카카오 OAuth 코드 -> accessToken)
    public String getAccessToken(String code) {
        RestTemplate restTemplate = new RestTemplate();
        String tokenUrl = "https://kauth.kakao.com/oauth/token";

        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "50d17a154d919b83d81f7ff6cd356141");
        params.add("redirect_uri", "http://localhost:8080/project/kakaoLogin");
        params.add("code", code);

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);
        ResponseEntity<Map> response = restTemplate.postForEntity(tokenUrl, request, Map.class);

        return (String) response.getBody().get("access_token");
    }
}
