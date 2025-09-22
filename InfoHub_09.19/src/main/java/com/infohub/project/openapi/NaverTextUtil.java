package com.infohub.project.openapi;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

import org.apache.commons.text.StringEscapeUtils;
import org.jsoup.Jsoup;

public class NaverTextUtil {
	public static String cleanDescription(String raw) throws UnsupportedEncodingException {
		if(raw == null) return "";
		
		String unescaped = StringEscapeUtils.unescapeJava(raw);
		
		String urlDecoded;
		try {
			urlDecoded = URLDecoder.decode(unescaped, StandardCharsets.UTF_8.name());
		} catch (IllegalArgumentException ex) {
			// TODO Auto-generated catch block
			urlDecoded = unescaped;
		}
		
		String cleaned = Jsoup.parse(urlDecoded).text();
		
		return cleaned.trim();
	}
}
