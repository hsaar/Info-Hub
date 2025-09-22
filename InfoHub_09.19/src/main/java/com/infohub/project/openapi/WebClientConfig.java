package com.infohub.project.openapi;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.reactive.ReactorClientHttpConnector;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.client.WebClient;

import reactor.netty.http.client.HttpClient;

@Configuration
public class WebClientConfig {
	
	@Bean
	public RestTemplate restTemplate() {
	    return new RestTemplate();
	}
	
	@Bean
	public WebClient webClient() {
		return WebClient.builder().baseUrl("https://openapi.naver.com/v1")
				.clientConnector(new ReactorClientHttpConnector(HttpClient.create()))
				.defaultHeader("X-Naver-Client-Id", "bPpRxSN1KvIoU06MtUhH")
				.defaultHeader("X-Naver-Client-Secret","YVBePbOoAG")
				.build();
	}
}
