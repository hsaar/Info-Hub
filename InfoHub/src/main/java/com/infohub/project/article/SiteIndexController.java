package com.infohub.project.article;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.infohub.project.openapi.ElasticsearchService;

@Controller
public class SiteIndexController {
	
	@Autowired
    private SiteIndexService siteIndexService;
	
	@Autowired
    private ElasticsearchService esService;

    @GetMapping("/site/indexAll")
    @ResponseBody
    public List<Map<String, Object>> indexAll(@RequestParam(required = false) String keyword) {
        System.out.println("keyword = " + keyword);
        try {
            if (keyword != null && !keyword.isEmpty()) {
                // 부분 검색(wildcard)로 한글자 검색도 가능
                List<Map<String, Object>> results = esService.searchByKeyword1("site_index", "*" + keyword + "*");
                System.out.println("검색 결과 개수 = " + results.size());
                return results;
            } else {
                return esService.searchAll("site_index");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Elasticsearch 조회 중 오류 발생", e);
        }
    }
    
    @GetMapping("/siteIndex")
    public String showSiteIndex(@RequestParam(required = false) String keyword, Model model) {
    	
    	if (keyword == null) keyword = "";
    	
    	Date date = new Date();
		SimpleDateFormat isoFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		
		String formattedDate = isoFormat.format(date);
		
		model.addAttribute("formattedDate", formattedDate );
    	
		try {
	        List<Map<String, Object>> results;

	        if (keyword == null || keyword.trim().isEmpty()) {
	            // keyword가 없으면 전체 데이터 조회
	            results = esService.searchAll("site_index");
	            keyword = ""; // input에 세팅용
	        } else {
	            results = esService.searchByKeyword1("site_index", keyword);
	        }

	        model.addAttribute("results", results);
	        model.addAttribute("keyword", keyword);

	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "검색 중 오류가 발생했습니다.");
	    }

        return "/siteIndex"; // siteIndex.jsp로 이동
    }
}
