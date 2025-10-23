package com.infohub.project.openapi;

import co.elastic.clients.elasticsearch.ElasticsearchClient;
import co.elastic.clients.transport.rest_client.RestClientTransport;
import co.elastic.clients.json.jackson.JacksonJsonpMapper;
import org.apache.http.HttpHost;
import org.apache.http.auth.AuthScope;
import org.apache.http.auth.UsernamePasswordCredentials;
import org.apache.http.impl.client.BasicCredentialsProvider;
import org.apache.http.impl.nio.client.HttpAsyncClientBuilder;
import org.elasticsearch.client.RestClient;
import org.elasticsearch.client.RestClientBuilder;

public class ElasticsearchConfig {

    private static ElasticsearchClient client;

    public static ElasticsearchClient getClient() {
        if (client == null) {

            try {
                // 🔹 Elastic 기본 계정 (설치 시 표시된 'elastic' 유저 비밀번호 사용)
                String username = "elastic";
                String password = "ccaQ+nruS53M9X4E=*nb"; // ← elastic 계정 비밀번호 입력

                // 🔹 인증 정보 설정
                final BasicCredentialsProvider credentialsProvider = new BasicCredentialsProvider();
                credentialsProvider.setCredentials(AuthScope.ANY,
                        new UsernamePasswordCredentials(username, password));

                // 🔹 HTTPS 연결 + 인증 설정
                RestClientBuilder builder = RestClient.builder(
                        new HttpHost("localhost", 9200, "https")
                ).setHttpClientConfigCallback(new RestClientBuilder.HttpClientConfigCallback() {
                    @Override
                    public HttpAsyncClientBuilder customizeHttpClient(HttpAsyncClientBuilder httpClientBuilder) {
                        return httpClientBuilder
                                .setDefaultCredentialsProvider(credentialsProvider)
                                .setSSLHostnameVerifier((hostname, session) -> true); // 인증서 검증 무시
                    }
                });

                RestClient restClient = builder.build();
                RestClientTransport transport = new RestClientTransport(
                        restClient, new JacksonJsonpMapper()
                );

                client = new ElasticsearchClient(transport);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return client;
    }
}