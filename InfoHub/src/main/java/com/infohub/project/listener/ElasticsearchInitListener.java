package com.infohub.project.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.BufferedReader;
import java.io.InputStreamReader;

@WebListener
public class ElasticsearchInitListener {
	
	 public void contextInitialized(ServletContextEvent sce) {
	        try {
	            System.out.println("🔄 Elasticsearch 초기화 시작...");

	            // Python 스크립트 경로 확인 필요
	            ProcessBuilder pb = new ProcessBuilder("C:\\Users\\420_28\\AppData\\Local\\Programs\\Python\\Python314", "C:/infohub/scripts/migrate_news.py");
	            pb.redirectErrorStream(true);
	            Process process = pb.start();

	            BufferedReader reader = new BufferedReader(
	                new InputStreamReader(process.getInputStream(), "UTF-8")
	            );
	            String line;
	            while ((line = reader.readLine()) != null) {
	                System.out.println(line);
	            }

	            int exitCode = process.waitFor();
	            System.out.println("파이썬 스크립트 종료 코드: " + exitCode);
	            System.out.println("✅ Elasticsearch 초기화 완료");

	        } catch (Exception e) {
	            System.err.println("❌ Elasticsearch 초기화 중 오류 발생:");
	            e.printStackTrace();
	        }
	    }

}
